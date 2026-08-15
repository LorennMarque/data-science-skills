---
name: data-quality
description: >-
  Profile data quality issues and propose remediations (missingness, duplicates,
  outliers, leakage risk). Use when auditing dataset quality, cleaning data,
  validating joins, or before EDA / modeling.
---

# Data Quality

## Goal

Find and fix (or explicitly accept) quality issues that would invalidate analysis.

## Workflow

```
Quality:
- [ ] Missingness profile
- [ ] Duplicates & key integrity
- [ ] Distribution / outlier scan
- [ ] Categorical validity
- [ ] Leakage & temporal sanity
- [ ] Document decisions (fix vs accept)
- [ ] Write cleaned table to data/interim or processed
```

### Checks (minimum)

| Check | Action |
|-------|--------|
| Missingness | Rate by column; pattern by segment/time |
| Duplicates | Exact rows + key collisions |
| Types | Numeric stored as string, mixed types |
| Ranges | Negatives where impossible, future dates |
| Categories | Rare/unknown levels, whitespace/case |
| Joins | Orphan rates, fan-out explosions |
| Target | Class balance / target missingness |

### Leakage red flags

- Features filled only after the outcome is known
- IDs or free text that encode the label
- Same entity in train and test without group split plan

### Decision log

For each issue:

```markdown
- Issue:
- Severity: blocker | high | medium | low
- Decision: fix | accept | investigate
- Rationale:
```

## Output

- Cleaned dataset path
- Short quality report under `reports/`
- Updated data contract if schema changed

## Handoff

Next: **exploratory-data-analysis** (or **statistical-analysis** / **machine-learning** if EDA already done)
