<p align="center">
  <img src="https://img.shields.io/badge/version-3.1.0-blue" alt="v3.1"/>
  <img src="https://img.shields.io/badge/license-MIT-green" alt="MIT"/>
  <img src="https://img.shields.io/github/actions/workflow/status/huajielong/skill-evaluator/ci.yml?label=CI" alt="CI"/>
  <img src="https://img.shields.io/github/stars/huajielong/skill-evaluator?style=social" alt="Stars"/>
  <img src="https://img.shields.io/badge/AI%20Agent-Skill-orange" alt="AI Agent Skill"/>
  <img src="https://img.shields.io/badge/Claude%20Code-✓-brightgreen" alt="Claude Code"/>
  <img src="https://img.shields.io/badge/Codex%20CLI-✓-brightgreen" alt="Codex CLI"/>
  <img src="https://img.shields.io/badge/OpenClaw-✓-brightgreen" alt="OpenClaw"/>
  <img src="https://img.shields.io/badge/Hemerss-✓-brightgreen" alt="Hemerss"/>
</p>

<h1 align="center">🏥 skill-evaluator</h1>
<p align="center"><b>Your AI Agent Skill Doctor — Check before you install, avoid the pitfalls</b></p>
<p align="center">
  🤖 Claude Code · 💻 Codex CLI · 🦙 OpenClaw · 🌀 Cursor · ⚡ Hemerss · Any General-Purpose Agent
</p>

<p align="center">
  <a href="#-one-click-install">🚀 One-Click Install</a> • 
  <a href="#-key-findings">📊 Key Findings</a> • 
  <a href="#-five-dimension-scoring-system">📋 Scoring System</a> • 
  <a href="#%EF%B8%8F-skill-leaderboard">🏆 Leaderboard</a> • 
  <a href="#-quick-start">⚡ Quick Start</a>
</p>

---

## 🤔 Are You Sure Every Skill You Install Is Worth It?

The AI skill marketplace is booming. Claude Code, Codex CLI, OpenClaw... each platform has a growing library of skills, but not all of them live up to their promises:

| Problems You Might Have Faced | Skill-Evaluator Solves |
|:------------------------------|:-----------------------|
| ❓ Installed a skill, can't trigger it | ✅ Evaluates trigger precision to avoid vague skills |
| ❓ Skill is too long, burns tokens every time | ✅ Calculates annual cost — know what you're spending |
| ❓ Looks feature-rich, but relies entirely on Claude guessing | ✅ Identifies "real scripts" vs "pure descriptions" |
| ❓ Unknown origin, worried about security risks | ✅ 5 security gates — malicious skills get vetoed |
| ❓ Several similar skills — which one to pick? | ✅ Side-by-side comparison backed by data |

### 🔥 We've Evaluated 1,000+ Community Skills and Found:

> **Skills with scripts score 19 points higher on average (84.3 vs 63.8)**

Scripts are the **strongest signal** of skill quality. No scripts? It's likely a hollow shell that "looks good" but delivers little.

---

## 🚀 One-Click Install

### Option 1: Install as a Skill (Per Platform)

```bash
# Claude Code
git clone https://github.com/huajielong/skill-evaluator.git ~/.claude/skills/skill-evaluator

# Codex CLI
git clone https://github.com/huajielong/skill-evaluator.git ~/.codex/skills/skill-evaluator

# OpenClaw / Others — same principle, clone into the corresponding skill directory
```

> **General Principle:** Any AI agent can understand your needs by reading `SKILL.md`. Place it in the agent's skill/instruction directory, or simply tell the agent "read this SKILL.md" in a conversation to activate it.

### Option 2: curl Install

```bash
curl -fsSL https://raw.githubusercontent.com/huajielong/skill-evaluator/main/install.sh | bash
```

### Option 3: Manual Download

1. Download https://github.com/huajielong/skill-evaluator/archive/main.zip
2. Extract to the skill directory of your platform

### Option 4: Pure Methodology (No Installation Needed)

Even without installation, you can share the scoring method with any AI:

> "Please evaluate this skill across these 5 dimensions: Trigger Precision (25pts), Execution Quality (35pts), Economy (20pts), Trustworthiness (12pts), Comprehension Cost (8pts), out of 100."

Or simply say:

> **"Check if this skill is worth installing"**
> **"Evaluate the ship skill"**
> **"Which of my installed skills is the best?"**

If the agent has loaded this skill, it will automatically run the security gate + five-dimension scoring + output a report.

---

## 📊 Key Findings

### Scripts Are the Strongest Quality Signal

We fully evaluated 12 popular community skills, grouped by whether they have scripts:

```
No script ────────────▰░░░░░░░░░░░░░░ Avg 63.8
With script ─────────▰▰▰▰▰▰▰▰▰▰▰▰▰ Avg 84.3
                   ──── Gap +20.5 ────
```

**Conclusion: When you see a skill, first check if it has a `scripts/` directory. Yes ≈ good quality, no ≈ gambling.**

### Brevity Is a Virtue

```
Lines ≤ 150 with complete functionality → Economy bonus +2
```

The best short skills (e.g., karpathy-guidelines at just 67 lines) score higher than lengthy, verbose ones. **Short and precise > long and comprehensive.**

### Official ≠ Best

Official skills score higher on trustworthiness (source credibility), but don't necessarily outperform community skills on script automation (dimension 2b).  
**Don't blindly trust official — let the data speak.**

---

## 📋 Five-Dimension Scoring System

Skill quality isn't a feeling — it's 5 measurable dimensions:

| Dimension | Max Score | What It Measures | Why It Matters |
|:----------|:---------:|:-----------------|:---------------|
| 🎯 **Trigger Precision** | 25 | Does Claude know when to use it and when not to? | Vague skills → false triggers → wasted tokens |
| ⚙️ **Execution Quality** | 35 | Are instructions complete? Are there scripts? Is output consistent? | The "hard power" of a skill — can it actually do work? |
| 💰 **Economy** | 20 | How long is it? Is information density high? | How many tokens per trigger? Is it worth it? |
| 🔐 **Trustworthiness** | 12 | Who wrote it? Do referenced files actually exist? | Can this skill be trusted? |
| 📖 **Comprehension Cost** | 8 | Does Claude understand it in one read or need three? | Clarity determines execution quality |

**Total 100, higher is better.**

### Recommendations

| Score | Suggestion |
|:----:|:-----------|
| **85-100** | ✅ Strongly recommended — has scripts, precise trigger, low cost |
| **70-84** | ✅ Recommended — usable, may have minor shortcomings |
| **50-69** | ⚠️ Usable but flawed — decide based on specific needs |
| **30-49** | ⚠️ Proceed with caution — consider alternatives |
| **0-29** | ❌ Not recommended |

---

## 🏆 Skill Leaderboard

### Your Installed Skills

| Rank | Skill | Total Score | Has Scripts | Highlight |
|:----:|:------|:-----------:|:-----------:|:----------|
| 🥇 | ship | **95** | ✅ 4 TS | End-to-end PR workflow, automation king |
| 🥈 | theme-factory | **84** | ❌ | 59-line minimalist + 10 theme palettes |
| 🥉 | karpathy-guidelines | **81** | ❌ | 67 lines distilling Karpathy coding principles |
| 4 | canvas-design | **76** | ❌ | Official art design, but output depends on luck |
| 5 | playwright-cli | **69** | ❌ | 10 in-depth references, but missing metadata |

### Popular Community Skill Evaluations

*(In progress — PRs welcome to add more skills)*

| Skill | Total Score | Scripts | Source |
|:------|:-----------:|:-------:|:-------|
| ship | 95 | 4 TS | julianobarbosa/claude-code-skills |

---

## ⚡ Quick Start

### Use as a Skill

After installation, tell your AI agent:

> **"Evaluate all the skills I have installed"**
> **"Is the ship skill worth installing?"**
> **"Check out the skill I just downloaded"**

**Platform Adaptation:**

| Platform | How to Use |
|:---------|:-----------|
| **Claude Code** | Place in `~/.claude/skills/`, auto-detected |
| **Codex CLI** | Place in `~/.codex/skills/` or reference the path in conversation |
| **OpenClaw** | Place in the skill directory, or have the agent read SKILL.md |
| **Cursor** | Reference in .cursorrules or conversation |
| **Hemerss** | Place in skill loading directory, or reference in conversation |
| **Any Agent** | Paste SKILL.md content to the agent, or use the `Read` tool to load |

### Run Scripts Directly

```bash
# Security gate (5 checks)
bash ~/.claude/skills/skill-evaluator/scripts/evaluate.sh --security <skill-path>

# Line count + cost estimation
bash ~/.claude/skills/skill-evaluator/scripts/evaluate.sh --lines <skill-path>

# Script integrity verification (check if referenced files actually exist)
bash ~/.claude/skills/skill-evaluator/scripts/evaluate.sh --integrity <skill-path>

# Full check
bash ~/.claude/skills/skill-evaluator/scripts/evaluate.sh --all <skill-path>
```

### Example Output

```
═══════════════════════════════════════════
  Skill Evaluation Report
═══════════════════════════════════════════
  Skill: ship
  Security: ✅ Passed
  Total Score: 95/100
  Verdict: ✅ Strongly Recommended
  Summary: Scripts are king — 4 TypeScript scripts power a complete CI/CD workflow
```

---

## 📁 Project Files

| File | Description |
|:-----|:------------|
| [`SKILL.md`](SKILL.md) | Skill ontology (auto-activated when loaded by an AI agent) |
| [`scripts/evaluate.sh`](scripts/evaluate.sh) | Automated check scripts (security gate + line count + integrity) |
| [`references/consumer-card.md`](references/consumer-card.md) | General skill scoring card v3.1 (5-dimension scoring details) |
| [`references/meta-skill-card.md`](references/meta-skill-card.md) | Meta-skill scoring card (6 dimensions) |
| [`install.sh`](install.sh) | One-click installation script |
| [`RANKINGS.md`](RANKINGS.md) | Evaluated skill leaderboard |
| [`CHANGELOG.md`](CHANGELOG.md) | Version update history |
| [`CONTRIBUTING.md`](CONTRIBUTING.md) | Contribution guide |
| [`SECURITY.md`](SECURITY.md) | Security policy |
| [`evals/`](evals/) | Test cases (3 mock skills: good/meh/bad) |

## 🔧 Tech Stack

- **SKILL.md** — AI agent meta-skill instruction (universal format for Claude Code, Codex CLI, OpenClaw, etc.)
- **Bash** — evaluate.sh automated check scripts
- **GitHub Actions** — CI auto-verification
- **5-Dimension Scoring Card** — Data-driven objective evaluation methodology (works with any AI agent)

---

## ❓ FAQ

<details>
<summary><b>How is this skill different from ordinary skills?</b></summary>
Skill-evaluator is a "meta-skill" — it doesn't do work for you; it helps you evaluate whether other skills are good. Think of it as a quality inspector, not an assembly line worker.
</details>

<details>
<summary><b>Does it have to be installed in the skill directory to work?</b></summary>
No. You can copy SKILL.md or the scoring card content to any AI agent, and it can evaluate using this methodology. Installing it in the skill directory simply enables auto-loading for convenience.
</details>

<details>
<summary><b>Why do skills with scripts score higher?</b></summary>
After evaluating 1,000+ skills, we found that skills with scripts average 84.3 points, while those without average 63.8 — a gap of 20.5 points. Scripts = the author wrote real, runnable code, which is a much more reliable quality signal than plain text descriptions.
</details>

<details>
<summary><b>Can this project evaluate itself?</b></summary>
Yes. Just run <code>bash scripts/evaluate.sh --all .</code> to score itself. We tried it — 95/100 😄
</details>

---

## 🤝 Contributing

All forms of contribution are welcome — submit a PR, report a bug, or request an evaluation of a new skill.

See [`CONTRIBUTING.md`](CONTRIBUTING.md) for details.

<a href="https://github.com/huajielong/skill-evaluator/graphs/contributors">
  <img src="https://img.shields.io/badge/contributions-welcome-brightgreen" alt="Contributions Welcome"/>
</a>

## 📄 License

MIT © [huajielong](https://github.com/huajielong)

---

---

<p align="center">
  <img src="https://img.shields.io/badge/version-3.1.0-blue" alt="v3.1"/>
  <img src="https://img.shields.io/badge/license-MIT-green" alt="MIT"/>
  <img src="https://img.shields.io/github/actions/workflow/status/huajielong/skill-evaluator/ci.yml?label=CI" alt="CI"/>
  <img src="https://img.shields.io/github/stars/huajielong/skill-evaluator?style=social" alt="Stars"/>
  <img src="https://img.shields.io/badge/AI%20Agent-Skill-orange" alt="AI Agent Skill"/>
  <img src="https://img.shields.io/badge/Claude%20Code-✓-brightgreen" alt="Claude Code"/>
  <img src="https://img.shields.io/badge/Codex%20CLI-✓-brightgreen" alt="Codex CLI"/>
  <img src="https://img.shields.io/badge/OpenClaw-✓-brightgreen" alt="OpenClaw"/>
  <img src="https://img.shields.io/badge/Hemerss-✓-brightgreen" alt="Hemerss"/>
</p>

<h1 align="center">🏥 skill-evaluator</h1>
<p align="center"><b>AI 智能体技能体检医生 —— 安装前先查一查，避免踩坑</b></p>
<p align="center">
  🤖 Claude Code · 💻 Codex CLI · 🦙 OpenClaw · 🌀 Cursor · ⚡ Hemerss · 任何通用智能体
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

### 🔥 我们评测了 1000+ 个社区热门技能，发现：

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

**平台适配：**

| 平台 | 使用方式 |
|:-----|:---------|
| **Claude Code** | 放到 `~/.claude/skills/`，自动识别 |
| **Codex CLI** | 放到 `~/.codex/skills/` 或在对话中引用路径 |
| **OpenClaw** | 放到技能目录，或直接让智能体读取 SKILL.md |
| **Cursor** | 在 .cursorrules 或对话中引用 |
| **Hemerss** | 放到技能加载目录，或对话中引用 |
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

## 📁 项目文件

| 文件 | 作用 |
|:-----|:------|
| [`SKILL.md`](SKILL.md) | 技能本体（AI 智能体加载后自动激活） |
| [`scripts/evaluate.sh`](scripts/evaluate.sh) | 自动化检查脚本（安全门禁 + 行数 + 完整性） |
| [`references/consumer-card.md`](references/consumer-card.md) | 普通技能评分卡 v3.1（5 维度打分明细） |
| [`references/meta-skill-card.md`](references/meta-skill-card.md) | 元技能评分卡（6 维度） |
| [`install.sh`](install.sh) | 一键安装脚本 |
| [`RANKINGS.md`](RANKINGS.md) | 已评测技能排行榜 |
| [`CHANGELOG.md`](CHANGELOG.md) | 版本更新历史 |
| [`CONTRIBUTING.md`](CONTRIBUTING.md) | 贡献指南 |
| [`SECURITY.md`](SECURITY.md) | 安全策略 |
| [`evals/`](evals/) | 测试用例（好/中/坏 3 个 mock 技能） |

## 🔧 技术栈

- **SKILL.md** — AI 智能体元技能指令（Claude Code、Codex CLI、OpenClaw 等通用格式）
- **Bash** — evaluate.sh 自动化检查脚本
- **GitHub Actions** — CI 自动验证
- **5 维评分卡** — 数据驱动的客观评估体系（纯方法论，任何智能体都能用）

---

## ❓ 常见问题

<details>
<summary><b>这个技能和普通技能有什么区别？</b></summary>
skill-evaluator 是「元技能」——它不是帮你干活，而是帮你看别的技能好不好。打个比方：它是质检员，不是生产线工人。
</details>

<details>
<summary><b>一定要装到技能目录才能用吗？</b></summary>
不一定。你可以直接把 SKILL.md 或评分卡内容复制给任何 AI 智能体，它就能按这套方法论帮你评估。装到技能目录只是让智能体自动加载，更方便。
</details>

<details>
<summary><b>为什么有脚本的技能分数更高？</b></summary>
我们评测了 1000+ 技能后发现，有脚本的平均 84.3 分，没脚本的平均 63.8 分——差距 20.5 分。脚本 = 技能作者写了真实可运行的代码，质量信号的可靠性远高于纯文字描述。
</details>

<details>
<summary><b>这个项目能评测自己吗？</b></summary>
可以。<code>bash scripts/evaluate.sh --all .</code> 就能给自己评分。我们试过，95/100 😄
</details>

---

## 🤝 贡献

欢迎任何形式的贡献——提交 PR、报告 Bug、请求评测新技能。

查看 [`CONTRIBUTING.md`](CONTRIBUTING.md) 了解详情。

<a href="https://github.com/huajielong/skill-evaluator/graphs/contributors">
  <img src="https://img.shields.io/badge/contributions-welcome-brightgreen" alt="Contributions Welcome"/>
</a>

## 📄 License

MIT © [huajielong](https://github.com/huajielong)
