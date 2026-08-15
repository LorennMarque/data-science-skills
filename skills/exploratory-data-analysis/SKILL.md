---
name: exploratory-data-analysis
description: >-
  Run structured EDA: univariate/bivariate views, segments, and written
  insights. Use when exploring a dataset, generating plots for understanding,
  or summarizing patterns before modeling or statistical tests.
---

# Exploratory Data Analysis

## Goal

Answer: what is in the data, what looks real vs artifact, and what hypotheses are worth testing?

## Workflow

```
EDA:
- [ ] Restate question and audience
- [ ] Univariate profiles (target + key drivers)
- [ ] Bivariate / segmented views
- [ ] Time trends if temporal
- [ ] Write 5–10 insights with evidence
- [ ] List open questions / next analyses
```

### Principles

- Plot with a purpose (one question per figure)
- Prefer rates over raw counts when populations differ
- Annotate sample sizes on segmented charts
- Separate **observation** from **interpretation**

### Minimum views

1. Target distribution (or primary metric)
2. Missingness heatmap or bar (if not done in quality)
3. Top candidate drivers vs target
4. Time series of volume + metric (if applicable)
5. One surprising cut (segment that breaks the average)

### Insight format

```markdown
1. **Claim** — evidence (number/plot). Implication for the problem.
```

Avoid laundry lists of charts with no narrative.

## Deliverables

- Notebook or script under `notebooks/` / `src/`
- Figures in `reports/figures/`
- Short EDA summary in `reports/`

## Handoff

- Inferential questions → **statistical-analysis**
- Predictive goals → **machine-learning**
- Done analyzing → **analysis-review**
