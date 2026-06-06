#!/bin/bash
# ============================================================
#  skill-evaluator 一键安装脚本
#  https://github.com/huajielong/skill-evaluator
# ============================================================
set -euo pipefail

REPO="huajielong/skill-evaluator"
BRANCH="main"
TARGET="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills/skill-evaluator}"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo ""
echo -e "${CYAN}═══════════════════════════════════════════${NC}"
echo -e "${CYAN}  🏥 skill-evaluator 安装程序${NC}"
echo -e "${CYAN}═══════════════════════════════════════════${NC}"
echo ""

# Step 1: 检查依赖
echo -e "${YELLOW}[1/4]${NC} 检查依赖..."

if ! command -v git &>/dev/null; then
  echo -e "${RED}❌ 需要 git，请先安装：https://git-scm.com/${NC}"
  exit 1
fi
echo -e "  ${GREEN}✅ git 已安装${NC}"

# Step 2: 检查目标目录
echo -e "${YELLOW}[2/4]${NC} 检查安装目录..."

if [ -d "$TARGET" ]; then
  if [ -f "$TARGET/SKILL.md" ]; then
    echo -e "  ${YELLOW}⚠️  目标目录已存在 skill-evaluator${NC}"
    read -p "  是否覆盖更新？(y/N): " CONFIRM
    if [ "$CONFIRM" != "y" ] && [ "$CONFIRM" != "Y" ]; then
      echo -e "  ${YELLOW}⏭️  跳过安装${NC}"
      exit 0
    fi
    rm -rf "$TARGET"
  else
    echo -e "  ${RED}❌ $TARGET 已存在但不是 skill-evaluator${NC}"
    echo "  请手动移除或指定其他目录"
    exit 1
  fi
fi

# Step 3: 克隆仓库
echo -e "${YELLOW}[3/4]${NC} 从 GitHub 克隆..."
echo -e "  仓库: ${CYAN}https://github.com/$REPO${NC}"
echo -e "  目标: ${CYAN}$TARGET${NC}"

git clone --depth 1 --branch "$BRANCH" "https://github.com/$REPO.git" "$TARGET"

echo -e "  ${GREEN}✅ 克隆完成${NC}"

# Step 4: 验证安装
echo -e "${YELLOW}[4/4]${NC} 验证安装..."

if [ -f "$TARGET/SKILL.md" ]; then
  echo -e "  ${GREEN}✅ SKILL.md 存在${NC}"
else
  echo -e "  ${RED}❌ SKILL.md 缺失，安装可能不完整${NC}"
  exit 1
fi

if [ -f "$TARGET/scripts/evaluate.sh" ]; then
  echo -e "  ${GREEN}✅ evaluate.sh 存在${NC}"
  chmod +x "$TARGET/scripts/evaluate.sh"
fi

echo ""
echo -e "${GREEN}═══════════════════════════════════════════${NC}"
echo -e "${GREEN}  🎉 skill-evaluator 安装成功！${NC}"
echo -e "${GREEN}═══════════════════════════════════════════${NC}"
echo ""
echo -e "  安装位置: ${CYAN}$TARGET${NC}"
echo ""
echo -e "  ${YELLOW}接下来怎么做：${NC}"
echo ""
echo -e "  1️⃣  打开 Claude Code，输入："
echo -e "     ${CYAN}> 帮我评估一下我装的技能${NC}"
echo ""
echo -e "  2️⃣  或直接跑脚本："
echo -e "     ${CYAN}> bash $TARGET/scripts/evaluate.sh --all <技能路径>${NC}"
echo ""
echo -e "  3️⃣  查看排行榜："
echo -e "     ${CYAN}> cat $TARGET/RANKINGS.md${NC}"
echo ""
echo -e "  📖 完整文档：${CYAN}https://github.com/$REPO${NC}"
echo ""
