---
name: model-evaluation
description: >-
  Evaluate models with the right metrics, diagnostics, error analysis, and
  comparisons. Use when scoring holdout performance, comparing candidates,
  checking calibration, or deciding whether a model is good enough to ship.
---

# Model Evaluation

## Goal

Decide if a model is useful under realistic conditions — not just leaderboard-high.

## Workflow

```
Evaluation:
- [ ] Confirm split / metric contract
- [ ] Score baseline vs candidates on holdout
- [ ] Slice metrics by key segments
- [ ] Error analysis (FP/FN or residual cases)
- [ ] Calibration / threshold (if classification)
- [ ] Write go / no-go recommendation
```

### Metrics by task

| Task | Primary (examples) | Also report |
|------|--------------------|-------------|
| Binary class | PR-AUC or Recall@precision if imbalanced | ROC-AUC, F1, confusion |
| Multiclass | Macro-F1 or cost-weighted | Per-class recall |
| Regression | MAE or RMSE (domain choice) | MAPE only if safe |
| Ranking | NDCG / MAP | |

State the **decision threshold** and business cost of errors when relevant.

### Diagnostics

- Learning curves / overfitting gap (train vs val)
- Segment breakdowns (region, tenure, time period)
- Residual plots or reliability diagrams
- Feature importance or coefficient signs (sanity)

### Comparison table

```markdown
| Model | Primary metric | Secondary | Notes |
|-------|----------------|-----------|-------|
| baseline | | | |
| candidate | | | |
```

### Recommendation format

```markdown
## Recommendation

- Ship / iterate / reject:
- Why (metric + segment risk):
- Known failure modes:
- Monitoring suggestions:
```

## Rules

- Evaluate on data not used for training or tuning
- Prefer business-aligned metrics over vanity AUC
- Call out distribution shift if holdout differs from production

## Handoff

Next: **analysis-review**
