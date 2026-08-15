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
- [ ] Write 5–10 insights with evidence → append docs/INSIGHTS.md
- [ ] Update docs/DATA_DICTIONARY.md if schema understanding changed
- [ ] List open questions / next analyses
- [ ] Commit docs before or with related notebooks/figures
```

### Living docs

Every non-trivial finding goes into `docs/INSIGHTS.md` (dated). Put figures under `outputs/`. Do not leave docs stale across commits.

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

- Numbered notebook under `notebooks/` and/or script under `scripts/`
- Figures in `outputs/`
- Updated `docs/INSIGHTS.md` (and dictionary if needed)

## Handoff

- Inferential questions → **statistical-analysis**
- Predictive goals → **machine-learning**
- Done analyzing → **analysis-review**
