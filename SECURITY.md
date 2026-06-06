# Security Policy

skill-evaluator has a **security gate** built into its evaluation flow. We take
security seriously — both the security of this project and the skills it evaluates.

## Reporting a vulnerability

If you discover a security issue in this project:

1. **Do not** open a public Issue
2. Email or DM the maintainer directly via GitHub
3. Include a detailed description and steps to reproduce

You should receive a response within 48 hours.

## What we consider a vulnerability

- Code execution via crafted skill files
- Credential harvesting through evaluate.sh
- Bypassing the security gate checks
- Exposure of sensitive data in output

## Self-evaluation note

This project can evaluate itself:

```bash
bash scripts/evaluate.sh --all .
```

We scored 95/100 (ship) — third-party audit welcome.
