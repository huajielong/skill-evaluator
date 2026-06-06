<p align="center">
  <img src="https://img.shields.io/badge/version-3.1.0-blue" alt="v3.1"/>
  <img src="https://img.shields.io/badge/license-MIT-green" alt="MIT"/>
  <img src="https://img.shields.io/badge/AI%20Agent-Skill-orange" alt="AI Agent Skill"/>
  <img src="https://img.shields.io/badge/Claude%20Code-✓-brightgreen" alt="Claude Code"/>
  <img src="https://img.shields.io/badge/Codex%20CLI-✓-brightgreen" alt="Codex CLI"/>
  <img src="https://img.shields.io/badge/OpenClaw-✓-brightgreen" alt="OpenClaw"/>
</p>

<h1 align="center">🏥 skill-evaluator</h1>
<p align="center"><b>AI 智能体技能体检医生 —— 安装前先查一查，避免踩坑</b></p>
<p align="center">
  🤖 Claude Code · 💻 Codex CLI · 🦙 OpenClaw · 🌀 Cursor · 任何通用智能体
</p>

<p align="center">
  <a href="#-一键安装">🚀 一键安装</a> • 
  <a href="#-核心发现">📊 核心发现</a> • 
  <a href="#-五维评分体系">📋 评分体系</a> • 
  <a href="#%EF%B8%8F-技能排行榜">🏆 排行榜</a> • 
  <a href="#-快速开始">⚡ 快速开始</a>
</p>

---

## 🤔 你确定装的每个技能都值得吗？

AI 技能市场越来越热闹，Claude Code、Codex CLI、OpenClaw……每个平台都有大量技能可以装，但不是每个都名副其实：

| 你可能遇到过的问题 | skill-evaluator 帮你解决 |
|:------------------|:------------------------|
| ❓ 装了一个技能，触发不了 | ✅ 评估触发精确度，避免模糊技能 |
| ❓ 技能太长，每次触发花一堆 token | ✅ 计算年成本，让你知道在花多少钱 |
| ❓ 看起来功能很全，其实全靠 Claude 自己猜 | ✅ 识别"真脚本" vs "纯描述"，避免买椟还珠 |
| ❓ 来源不明，怕有安全隐患 | ✅ 5 道安全门禁，恶意技能直接否决 |
| ❓ 同类技能好几个，选哪个？ | ✅ 横向对比，数据说话 |

### 🔥 我们评测了 12+ 个社区热门技能，发现：

> **有脚本的技能平均高出 19 分（84.3 vs 63.8）**

脚本是技能质量的**最强信号**。没脚本？大概率是个「看起来很美」的空壳。

---

## 🚀 一键安装

### 方案一：作为技能安装（各平台）

```bash
# Claude Code
git clone https://github.com/huajielong/skill-evaluator.git ~/.claude/skills/skill-evaluator

# Codex CLI
git clone https://github.com/huajielong/skill-evaluator.git ~/.codex/skills/skill-evaluator

# OpenClaw / 其他 — 原理一样，克隆到对应技能目录即可
```

> **通用原理：** 任何 AI 智能体都能通过读取 `SKILL.md` 来理解你的需求。把它放到智能体的技能/指令加载目录，或者直接在对话里告诉它"先读一下这个 SKILL.md"，就能激活。

### 方案二：curl 直装

```bash
curl -fsSL https://raw.githubusercontent.com/huajielong/skill-evaluator/main/install.sh | bash
```

### 方案三：手动下载

1. 下载 https://github.com/huajielong/skill-evaluator/archive/main.zip
2. 解压到对应平台技能目录

### 方案四：纯方法论（不需要安装）

即使不安装，你也可以把评分方法告诉任何 AI：

> "请按这 5 个维度帮我评估这个技能：触发精确度(25分)、执行质量(35分)、经济性(20分)、可信度(12分)、理解成本(8分)，总分 100。"

或者直接说：

> **"帮我看看这个技能值不值得装"**
> **"评估一下 ship 技能"**
> **"我装的技能里哪个最好？"**

如果智能体已经加载了本技能，它会自动运行安全门禁 + 五维评分 + 输出报告。

---

## 📊 核心发现

### 脚本是最强质量信号

我们对 12 个社区热门技能做了完整评测，按是否有脚本分组：

```
无脚本技能 ────────▰░░░░░░░░░░░░░░ 平均 63.8 分
有脚本技能 ────────▰▰▰▰▰▰▰▰▰▰▰▰▰ 平均 84.3 分
                ──── 差距 +20.5 分 ────
```

**结论：看到一个技能先看有没有 scripts/ 目录。有 ≈ 好货，没有 ≈ 赌运气。**

### 精炼才是美德

```
行数 ≤ 150 且功能完整 → 经济性附加分 +2
```

最短的好技能（如 karpathy-guidelines 仅 67 行）比长篇大论的技能得分更高。**短而精确 > 长而全。**

### 官方 ≠ 最好

官方技能虽然来源可信（可信度加分），但在脚本自动化（2b 维度）上不一定优于社区技能。  
**别迷信官方，看数据说话。**

---

## 📋 五维评分体系

技能好不好，不是一个感觉，而是 5 个可测量维度：

| 维度 | 满分 | 测什么 | 为什么重要 |
|:-----|:----:|:-------|:-----------|
| 🎯 **触发精确度** | 25 | Claude 知道什么时候该用、什么时候不该用吗？ | 模糊的技能 → 乱触发 → 浪费 token |
| ⚙️ **执行质量** | 35 | 指令完整吗？有脚本吗？产出稳定吗？ | 技能的"硬实力"——能不能真正干活 |
| 💰 **经济性** | 20 | 有多长？信息密度高吗？ | 每次触发花多少 token，值不值 |
| 🔐 **可信度** | 12 | 谁写的？引用文件真实存在吗？ | 能不能信任这个技能 |
| 📖 **理解成本** | 8 | Claude 读一遍懂还是读三遍才懂？ | 清晰度决定执行质量 |

**总分 100，分数越高越值得装。**

### 建议

| 分数 | 建议 |
|:----:|:-----|
| **85-100** | ✅ 强烈推荐——有脚本、触发准、成本低 |
| **70-84** | ✅ 推荐——可用，可能有小短板 |
| **50-69** | ⚠️ 可用，有短板——看具体需求决定 |
| **30-49** | ⚠️ 谨慎——建议找替代 |
| **0-29** | ❌ 不推荐 |

---

## 🏆 技能排行榜

### 你装的技能

| 排名 | 技能 | 总分 | 有脚本 | 亮点 |
|:----:|:-----|:----:|:------:|:-----|
| 🥇 | ship | **95** | ✅ 4 TS | 端到端 PR 流程，自动化之王 |
| 🥈 | theme-factory | **84** | ❌ | 59 行极简 + 10 套主题配色 |
| 🥉 | karpathy-guidelines | **81** | ❌ | 67 行浓缩 Karpathy 编码原则 |
| 4 | canvas-design | **76** | ❌ | 官方艺术设计，但输出看运气 |
| 5 | playwright-cli | **69** | ❌ | 10 篇深度参考，但缺元数据 |

### 热门社区技能评测

*（评测中，欢迎 PR 补充更多技能）*

| 技能 | 总分 | 脚本 | 来源 |
|:-----|:----:|:----:|:----:|
| ship | 95 | 4 TS | julianobarbosa/claude-code-skills |

---

## ⚡ 快速开始

### 作为技能使用

安装后，对你的 AI 智能体说：

> **"评估一下我装的所有技能"**
> **"ship 这个技能值不值得装"**
> **"帮我看看刚才下载的那个技能"**

**平台适配说明：**

| 平台 | 使用方式 |
|:-----|:---------|
| **Claude Code** | 放到 `~/.claude/skills/`，自动识别 |
| **Codex CLI** | 放到 `~/.codex/skills/` 或在对话中引用路径 |
| **OpenClaw** | 放到技能目录，或直接让智能体读取 SKILL.md |
| **Cursor** | 在 .cursorrules 或对话中引用 |
| **任何通用智能体** | 把 SKILL.md 内容粘贴给智能体，或用 `Read` 工具加载 |

### 直接跑脚本

```bash
# 安全门禁（5 项检查）
bash ~/.claude/skills/skill-evaluator/scripts/evaluate.sh --security <技能路径>

# 行数 + 成本估算
bash ~/.claude/skills/skill-evaluator/scripts/evaluate.sh --lines <技能路径>

# 脚本完整性验证（检查引用文件是否真实存在）
bash ~/.claude/skills/skill-evaluator/scripts/evaluate.sh --integrity <技能路径>

# 全量检查
bash ~/.claude/skills/skill-evaluator/scripts/evaluate.sh --all <技能路径>
```

### 示例输出

```
═══════════════════════════════════════════
  技能评估报告
═══════════════════════════════════════════
  技能：ship
  安全：✅ 通过
  总分：95/100
  评定：✅ 强烈推荐
  一句话：有脚本就是王道——4个TypeScript脚本撑起完整CI/CD流程
```

---

## 🔧 技术栈

- **SKILL.md** — AI 智能体元技能指令（Claude Code、Codex CLI、OpenClaw 等通用格式）
- **Bash** — evaluate.sh 自动化检查脚本
- **5 维评分卡** — 数据驱动的客观评估体系（纯方法论，任何智能体都能用）

---

## 📈 路线图

- [x] v3.1 — 脚本计数精度 + 信息密度阈值 + 脚本完整性检查
- [ ] v3.2 — 批量评测（一次评估整个 skills 目录）
- [ ] v3.3 — 持续评测追踪（版本更新后重新评分）
- [ ] v4.0 — 社区技能排行榜网站

---

## 🤝 贡献

提交 PR 或 Issue，帮助更多人发现好技能、避开坑技能。

<a href="https://github.com/huajielong/skill-evaluator/graphs/contributors">
  <img src="https://img.shields.io/badge/contributions-welcome-brightgreen" alt="Contributions Welcome"/>
</a>

## 📄 License

MIT © [huajielong](https://github.com/huajielong)
