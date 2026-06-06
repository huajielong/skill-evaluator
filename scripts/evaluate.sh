#!/bin/bash
# 技能评估器 - 自动化检查脚本
# 用法: bash evaluate.sh --security <技能路径>
#       bash evaluate.sh --lines <技能路径>
#       bash evaluate.sh --integrity <技能路径>
#       bash evaluate.sh --all <技能路径>

set -euo pipefail

SKILL_PATH="${2:-}"
MODE="${1:-}"

if [ -z "$SKILL_PATH" ] || [ ! -d "$SKILL_PATH" ]; then
  echo "用法: bash evaluate.sh <mode> <技能目录路径>"
  echo "模式:"
  echo "  --security   运行安全门禁检查"
  echo "  --lines      统计 SKILL.md 行数"
  echo "  --integrity  验证脚本/资源文件完整性"
  echo "  --all        运行全部检查"
  exit 1
fi

SKILL_MD="$SKILL_PATH/SKILL.md"

security_check() {
  echo "=== 安全门禁检查 ==="
  local FAILED=0
  local GREP="grep -nE"  # 用 ERE 替代 PCRE，兼容 Windows

  # 1. 脚本可读性
  echo ""
  echo "[1/5] 脚本可读性检查"
  local SCRIPTS=$(find "$SKILL_PATH" -name '*.sh' -o -name '*.py' -o -name '*.js' 2>/dev/null)
  if [ -z "$SCRIPTS" ]; then
    echo "  ✅ 无可执行脚本文件（或全部为 .md）"
  else
    local SUSPICIOUS=0
    while IFS= read -r f; do
      local LINE1=$(head -1 "$f" 2>/dev/null)
      # 检测混淆：base64 编码或最小化代码
      if echo "$LINE1" | $GREP -qi 'base64|begin[[:space:]]+[0-9]' 2>/dev/null; then
        echo "  ❌ 疑似混淆文件: $f"
        SUSPICIOUS=1
      fi
    done <<< "$SCRIPTS"
    if [ "$SUSPICIOUS" -eq 0 ]; then
      echo "  ✅ 全部脚本可读"
    else
      FAILED=1
    fi
  fi

  # 2. 网络外呼（搜索 SKILL.md 和所有脚本）
  echo ""
  echo "[2/5] 网络外呼检查"
  local CALLS=$($GREP -hri 'curl|wget|fetch|axios|WebFetch' \
    "$SKILL_MD" $(find "$SKILL_PATH/scripts/" -type f 2>/dev/null) 2>/dev/null || true)
  if [ -z "$CALLS" ]; then
    echo "  ✅ 无网络外呼"
  else
    # 过滤注释行、文档示例、以及 grep 检测模式本身
    local CLEAN=$(echo "$CALLS" | $GREP -vi \
      'example|docs\.|grep.*[cC]url|grep.*[wW]get|grep.*fetch|grep.*[Ww]eb[Ff]etch|grep.*axios|^[0-9]*:[[:space:]]*#|搜索.*curl|搜索.*wget|搜索.*fetch' \
      2>/dev/null || true)
    if [ -z "$CLEAN" ]; then
      echo "  ✅ 仅有文档示例/注释中的外呼，无实际调用"
    else
      echo "  ❌ 发现网络外呼:"
      echo "$CLEAN"
      # 提取域名并检查是否在 SKILL.md 中声明
      local DOMAINS=$(echo "$CLEAN" | $GREP -oi 'https\?://[^/\"'"'"' ]+' | sort -u 2>/dev/null || true)
      if [ -n "$DOMAINS" ]; then
        echo "  目标域名:"
        echo "$DOMAINS" | while read d; do
          if grep -qi "$d" "$SKILL_MD" 2>/dev/null; then
            echo "    ✅ $d (已在 SKILL.md 声明)"
          else
            echo "    ❌ $d (SKILL.md 中未声明)"
            FAILED=1
          fi
        done
      fi
    fi
  fi

  # 3. 凭证采集（排除常见代码示例误报）
  echo ""
  echo "[3/5] 凭证采集检查"
  local CREDS_ALL=$($GREP -ri 'api.?key|token|secret|password' "$SKILL_MD" 2>/dev/null || true)
  if [ -z "$CREDS_ALL" ]; then
    echo "  ✅ 未发现凭证相关字段"
  else
    local CREDS_CLEAN=$(echo "$CREDS_ALL" | $GREP -vi \
      'JWT token|auth_token|session.?token|refresh_token|access_token|github.token|npm token|in.*example|示例|搜索.*token|搜索.*secret|搜索.*密码|^[0-9]*:[[:space:]]*\|' \
      2>/dev/null || true)
    if [ -z "$CREDS_CLEAN" ]; then
      echo "  ✅ 仅有正常代码示例中的 token/secret 引用，无不合理索要"
    else
      echo "  ⚠️  发现凭证相关关键词（需人工确认是否合理）:"
      echo "$CREDS_CLEAN"
    fi
  fi

  # 4. 远程代码执行（搜索 SKILL.md + scripts/）
  echo ""
  echo "[4/5] 远程代码执行检查"
  # 检测：curl url | bash/sh 或 wget url | bash/sh 或 eval( 动态执行
  # 注意：\| 在 ERE 中匹配字面管道符，不是"或"
  local REMOTE=$($GREP -hri 'curl.*\|[[:space:]]*(bash|sh)|wget.*\|[[:space:]]*(bash|sh)|(^|[^a-zA-Z_])eval[(]' \
    "$SKILL_MD" $(find "$SKILL_PATH/scripts/" -type f 2>/dev/null) 2>/dev/null || true)
  if [ -z "$REMOTE" ]; then
    echo "  ✅ 无远程代码执行风险"
  else
    # 过滤 grep 检测模式本身
    local CLEAN=$(echo "$REMOTE" | $GREP -vi 'grep.*curl|grep.*wget|grep.*eval|^[0-9]*:[[:space:]]*#' 2>/dev/null || true)
    if [ -z "$CLEAN" ]; then
      echo "  ✅ 无远程代码执行风险"
    else
      echo "  ❌ 发现远程代码执行风险:"
      echo "$CLEAN"
      FAILED=1
    fi
  fi

  # 5. 安全绕过
  echo ""
  echo "[5/5] 安全绕过检查"
  local BYPASS=$($GREP -i 'auto.?approve|disable.*safety|bypass.*security|关掉权限|不需要确认|全部允许' \
    "$SKILL_MD" 2>/dev/null || true)
  if [ -z "$BYPASS" ]; then
    echo "  ✅ 无安全绕过指令"
  else
    # 过滤 grep 检测模式本身
    local CLEAN=$(echo "$BYPASS" | $GREP -vi 'grep.*auto|grep.*安全|grep.*权限|^[0-9]*:[[:space:]]*#|搜索.*自动|搜索.*权限|搜索.*安全' 2>/dev/null || true)
    if [ -z "$CLEAN" ]; then
      echo "  ✅ 无安全绕过指令"
    else
      echo "  ❌ 发现安全绕过/权限操作指令:"
      echo "$CLEAN"
      FAILED=1
    fi
  fi

  echo ""
  if [ "$FAILED" -eq 0 ]; then
    echo ">>> 安全门禁: ✅ 通过"
  else
    echo ">>> 安全门禁: ❌ 否决 - 存在风险项，不建议安装"
  fi
  return $FAILED
}

lines_check() {
  if [ ! -f "$SKILL_MD" ]; then
    echo "❌ 未找到 SKILL.md"
    exit 1
  fi
  local LINES=$(wc -l < "$SKILL_MD")
  echo "SKILL.md 行数: $LINES"

  if [ "$LINES" -le 300 ]; then echo "经济性评级: 20/20 ✅ 精炼"; fi
  if [ "$LINES" -ge 301 ] && [ "$LINES" -le 500 ]; then echo "经济性评级: 16/20 ✅ 合格"; fi
  if [ "$LINES" -ge 501 ] && [ "$LINES" -le 800 ]; then echo "经济性评级: 12/20 ⚠️ 偏长"; fi
  if [ "$LINES" -ge 801 ] && [ "$LINES" -le 1200 ]; then echo "经济性评级: 8/20 ⚠️ 长"; fi
  if [ "$LINES" -ge 1201 ] && [ "$LINES" -le 2000 ]; then echo "经济性评级: 4/20 ❌ 过长"; fi
  if [ "$LINES" -ge 2001 ]; then echo "经济性评级: 0/20 ❌ 极长"; fi

  local TOKENS=$(( LINES * 8 * 2 ))
  local DAILY_COST=$(( TOKENS * 30 * 15 / 1000000 ))
  local YEARLY_COST=$(( TOKENS * 30 * 365 * 15 / 1000000 ))
  echo "每次触发约: $TOKENS tokens（输入+输出）"
  echo "日成本估算（30次）: \$${DAILY_COST}/天 (Opus)"
  echo "年成本估算（30次/天）: \$${YEARLY_COST}/年 (Opus)"
}

frontmatter_check() {
  echo "=== 元数据检查 ==="
  if [ ! -f "$SKILL_MD" ]; then
    echo "❌ 未找到 SKILL.md"
    return
  fi

  local FM=$(sed -n '/^---$/,/^---$/p' "$SKILL_MD")
  echo "$FM" | grep -q 'version:' && echo "✅ 有版本号" || echo "❌ 无版本号"
  echo "$FM" | grep -q 'author:' && echo "✅ 有作者" || echo "❌ 无作者信息"
  echo "$FM" | grep -qi 'license' && echo "✅ 有许可证" || echo "❌ 无许可证"
  [ -f "$SKILL_PATH/LICENSE" ] || [ -f "$SKILL_PATH/LICENSE.txt" ] && echo "✅ 有 LICENSE 文件" || echo "❌ 无 LICENSE 文件"
}

script_integrity_check() {
  echo "=== 脚本完整性检查 ==="
  if [ ! -f "$SKILL_MD" ]; then
    echo "❌ 未找到 SKILL.md"
    return
  fi

  # 提取 SKILL.md 中引用的所有脚本/资源路径
  local REFS=$($GREP -oi 'scripts/[^"'"'"' )]*|references/[^"'"'"' )]*' "$SKILL_MD" 2>/dev/null | sort -u || true)
  if [ -z "$REFS" ]; then
    echo "  ℹ️  无脚本/资源引用（纯描述技能）"
    return
  fi

  local MISSING=0
  local FOUND=0
  local PLACEHOLDER=0
  while IFS= read -r ref; do
    # 跳过包含 <path-to-skill> 等占位符的路径
    if echo "$ref" | $GREP -qi '<.*>' 2>/dev/null; then
      echo "  ⚠️  占位符路径: $ref (需人工解析)"
      PLACEHOLDER=$((PLACEHOLDER + 1))
      continue
    fi
    if [ -f "$SKILL_PATH/$ref" ]; then
      echo "  ✅ 存在: $ref"
      FOUND=$((FOUND + 1))
    else
      echo "  ❌ 缺失: $ref"
      MISSING=$((MISSING + 1))
    fi
  done <<< "$REFS"

  echo ""
  if [ "$MISSING" -eq 0 ] && [ "$FOUND" -gt 0 ]; then
    echo ">>> 脚本完整性: ✅ 全部可验证 ($FOUND 个文件)"
  elif [ "$MISSING" -gt 0 ]; then
    echo ">>> 脚本完整性: ❌ 存在 $MISSING 个缺失引用"
  elif [ "$PLACEHOLDER" -gt 0 ]; then
    echo ">>> 脚本完整性: ⚠️ 仅有占位符路径 ($PLACEHOLDER 处)"
  else
    echo ">>> 脚本完整性: ℹ️ 无脚本引用"
  fi
}

case "${MODE}" in
  --security)
    security_check
    ;;
  --lines)
    lines_check
    ;;
  --integrity)
    script_integrity_check
    ;;
  --all)
    security_check
    echo ""
    echo "─────────────────────────────────"
    lines_check
    echo ""
    frontmatter_check
    echo ""
    script_integrity_check
    ;;
  *)
    echo "未知模式: $MODE"
    echo "可用模式: --security, --lines, --integrity, --all"
    exit 1
    ;;
esac
