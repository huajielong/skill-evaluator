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

> [中文说明](README.zh.md)

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
