---
name: data-quality-audit
description: >-
  Audit dataset quality (missingness, duplicates, types, outliers, leakage) and
  keep docs/DATA_DICTIONARY.md and docs/INSIGHTS.md updated before commits. Use
  when auditing data quality, cleaning data, validating joins, or before EDA /
  modeling.
---

# Data Quality Audit

## Goal

Find quality issues that would invalidate analysis, decide fix vs accept, and **write findings into living docs before committing**.

## Prerequisites

Project should already have the bootstrap layout. If missing `docs/DATA_DICTIONARY.md` or `docs/INSIGHTS.md`, create them (or run **ds-project-bootstrap** first).

## Workflow

```
Quality audit:
- [ ] Confirm dataset path + grain (update DATA_DICTIONARY.md)
- [ ] Missingness profile
- [ ] Duplicates & key integrity
- [ ] Types / ranges / categories
- [ ] Leakage & temporal sanity
- [ ] Decision log (fix | accept | investigate)
- [ ] Append findings to docs/INSIGHTS.md
- [ ] Sync schema notes in docs/DATA_DICTIONARY.md
- [ ] Write cleaned table to data/ or outputs/ if fixing
- [ ] Partial commit(s): docs first or docs+clean together if tightly coupled
```

### Checks (minimum)

| Check | Action |
|-------|--------|
| Missingness | Rate by column; pattern by segment/time |
| Duplicates | Exact rows + key collisions |
| Types | Numeric-as-string, mixed types |
| Ranges | Impossible negatives, future dates |
| Categories | Rare/unknown levels, whitespace/case |
| Joins | Orphan rates, fan-out explosions |
| Target | Class balance / target missingness |

### Leakage red flags

- Features only knowable after the outcome
- IDs or text that encode the label
- Entity leakage across train/test without group split

### Decision log (also mirror into INSIGHTS.md)

```markdown
- Issue:
- Severity: blocker | high | medium | low
- Decision: fix | accept | investigate
- Rationale:
- Docs updated: DATA_DICTIONARY.md / INSIGHTS.md
```

## Living docs (required)

### `docs/DATA_DICTIONARY.md`

Update whenever audit discovers:

- New/removed columns or type corrections
- Primary keys, grain changes
- Nullability or allowed values
- Known bad values or sentinel codes

### `docs/INSIGHTS.md`

Append dated entries, for example:

```markdown
## YYYY-MM-DD — Quality audit (<dataset>)

- Finding: 12% nulls in `tenure`; concentrated in segment X
- Decision: impute with median within segment (accepted risk: …)
- Open: confirm whether null tenure means “new customer”
```

**Do not commit analysis/cleaning code while leaving these docs stale.**

## Commits

Prefer partial commits:

1. `docs: record quality audit findings for <dataset>`
2. `fix: clean <dataset> nulls/duplicates` (if code/data outputs change)
3. `chore: move cleaned table to data/` (if only relocation)

Offer naming fixes for any new scripts/notebooks **before** commit (see **ds-project-bootstrap** naming rules).

## Outputs

- Updated `docs/DATA_DICTIONARY.md` and `docs/INSIGHTS.md`
- Optional cleaned dataset under `data/` or `outputs/`
- Short audit summary in the commit message body or `outputs/` if lengthy

## Handoff

Next: **exploratory-data-analysis** (continue updating `INSIGHTS.md` as patterns appear)
