---
name: statistical-analysis
description: >-
  Design and run statistical tests, confidence intervals, and effect-size
  reporting. Use when testing hypotheses, comparing groups, estimating effects,
  A/B analysis, or when the user asks for significance / inference (not just EDA).
---

# Statistical Analysis

## Goal

Estimate effects with appropriate uncertainty — not p-values alone.

## Workflow

```
Stats:
- [ ] State hypothesis and estimand
- [ ] Choose design (observational vs experiment)
- [ ] Check assumptions / choose robust alternative
- [ ] Estimate effect + CI + effect size
- [ ] Multiple testing plan if needed
- [ ] Write plain-language conclusion
```

### Before testing

Write:

1. **Estimand**: what quantity answers the business question?
2. **Null / alternative** (or model of interest)
3. **Unit of analysis** and independence assumptions
4. **Pre-specified** vs exploratory (label clearly)

### Defaults

| Situation | Prefer |
|-----------|--------|
| Two groups, continuous | Mean difference + CI; t-test or bootstrap |
| Two groups, binary | Risk difference / ratio + CI |
| Many groups | ANOVA/Kruskal + planned contrasts |
| Relationships | Regression with CI; report coefficients in original units |
| Non-normal / outliers | Rank-based or bootstrap; don't delete outliers silently |

### Reporting template

```markdown
## Result

- Estimand:
- Estimate:
- 95% CI:
- Effect size:
- n / groups:
- Caveats:
- Decision relevance:
```

## Rules

- Never equate "not significant" with "no effect"
- Prefer confidence intervals over star rituals
- Call out selection bias and confounding in observational data

## Handoff

Next: **analysis-review**, or **machine-learning** if prediction is also required
