---
name: machine-learning
description: >-
  Train and iterate ML models with clear validation design and baselines. Use
  when building predictive models, feature pipelines, classification/regression
  workflows, or when the user asks to train / tune a model.
---

# Machine Learning

## Goal

Ship a model that beats a simple baseline under an honest validation scheme.

## Workflow

```
ML:
- [ ] Define prediction task and metric(s)
- [ ] Fix train/validation/test (or CV) design
- [ ] Build strong baseline
- [ ] Iterate features / model family
- [ ] Log experiments
- [ ] Freeze candidate for evaluation skill
```

### 1. Task card

```markdown
- Target:
- Prediction time (features available at inference):
- Metric primary / secondary:
- Split strategy: random | time | group
- Leakage risks:
```

### 2. Validation

- Time series → time-based split (no random shuffle)
- Repeated entities → group split
- Hold out a final test set; touch it only in **model-evaluation**

### 3. Baseline first

Always include at least one of:

- Mean / median / majority class
- Single strong feature rule
- Linear / logistic model

Only then try trees, boosting, etc.

### 4. Iteration loop

1. Change one thing at a time
2. Record metric on validation
3. Keep a small leaderboard in `reports/`

### Stack defaults (Python)

- Tabular: `scikit-learn`; boosting via `HistGradientBoosting*` or LightGBM/XGBoost if already in env
- Pipelines: `sklearn.pipeline.Pipeline` + `ColumnTransformer`
- Persist: `joblib` for sklearn pipelines

## Rules

- No target leakage
- No tuning on the final test set
- Prefer interpretable baselines in the report even if a complex model wins

## Handoff

Next: **model-evaluation**
