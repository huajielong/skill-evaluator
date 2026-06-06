# Evals — skill-evaluator 测试套件

## 结构

```
evals/
├── evals.json           # 测试用例定义（含 assertions）
├── fixtures/
│   ├── good-skill/      # 模拟"好技能"——应通过门禁 + 高分
│   ├── evil-skill/      # 模拟"恶意技能"——应被安全门禁否决
│   └── meh-skill/       # 模拟"平庸技能"——应低分
└── README.md
```

## 用法

### 手动运行安全门禁测试

```bash
# evil-skill 应该被否决
bash scripts/evaluate.sh --security evals/fixtures/evil-skill
# → 应输出 ❌ 否决

# good-skill 应该通过
bash scripts/evaluate.sh --security evals/fixtures/good-skill
# → 应输出 ✅ 通过
```

### 手动运行完整评估

```bash
bash scripts/evaluate.sh --all evals/fixtures/good-skill
bash scripts/evaluate.sh --all evals/fixtures/evil-skill
```

### 运行完整测试（待添加自动化测试脚本）

目前手动运行上述命令并对照 `evals.json` 中的 assertions 逐条验证。
