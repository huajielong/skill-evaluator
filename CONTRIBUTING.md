# Contributing to skill-evaluator

We welcome contributions that make skill-evaluator more useful, accurate, and widely adopted.

## Ways to contribute

### 🏆 Submit a skill for evaluation

If you have a skill you'd like reviewed, open an Issue with:
- Link to the skill (GitHub repo or skill file)
- What platform it targets
- Any notable features (scripts, references, etc.)

### 📊 Improve the scoring rubric

The 5-dimension scoring system is data-driven and evolving. If you find edge cases where scores don't match reality:

1. Open an Issue describing the edge case
2. Include examples of skills that score incorrectly
3. Suggest adjustments to the rubric

### 🐛 Report bugs

Open an Issue with:
- What you ran (command, skill path)
- What happened (actual output)
- What should have happened (expected output)

### 🛠️ Fix bugs or add features

1. Fork the repo
2. Create a feature branch: `git checkout -b feat/my-change`
3. Make your changes
4. Test with the included eval fixtures: `bash scripts/evaluate.sh --all evals/fixtures/good-skill`
5. Open a Pull Request

## Code style

- Shell scripts: `set -euo pipefail`, no bashisms where POSIX suffices
- SKILL.md: imperative tone, trigger boundaries explicit, no fluff
- Scoring cards: objective criteria first, subjective judgment labeled

## PR guidelines

- Keep PRs focused: one change per PR
- Update CHANGELOG.md if the change is user-facing
- Add test fixtures for new evaluation features

## Questions?

Open a Discussion or Issue. We're friendly.
