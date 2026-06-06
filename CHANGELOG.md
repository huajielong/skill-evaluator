# Changelog

## [3.1.0] - 2026-06-06

### Added
- Script integrity check (`--integrity` mode): verifies referenced scripts/assets actually exist
- Information density scoring: 4 adjustment levels with 5 low-density signals
- Precise script counting: 3+ scripts = 12pts, 1-2 scripts = 9pts, knowledge assets = 6pts
- Negative trigger bonus: +2-3 for explicit anti-triggers
- Cross-skill reference bonus: +1 for referencing sibling skills

### Changed
- Security gate now 5-item checklist (was 4)
- Testability (3pt) → Script integrity (3pt): more practical, fewer false negatives
- Trigger scoring: added 23-point tier for cross-skill references
- CLI platform auto-detection (Azure Repos / GitHub)

### Fixed
- False positive in network call detection for JSDoc comments

## [3.0.0] - 2026-05-20

### Added
- First public release of skill-evaluator
- 5-dimension scoring rubric (Trigger 25 + Execution 35 + Economy 20 + Trust 12 + Clarity 8)
- Security gate with 4 automated checks
- Platform adaptation: Claude Code, Claude.ai, headless
- evaluate.sh automation script
- Meta-skill support (separate scoring card)

### Key metrics
- Script signal identified: with-script avg 84.3 vs without-script avg 63.8 (19pt gap)
- 12 community skills evaluated for benchmark
