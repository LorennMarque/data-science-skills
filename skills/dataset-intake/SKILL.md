---
name: dataset-intake
description: >-
  Load, validate schema, and document datasets into docs/DATA_DICTIONARY.md.
  Use when ingesting CSV/Parquet/SQL data, registering new tables, or starting
  work on a fresh data source.
---

# Dataset Intake

## Goal

Get data into a known, documented state before quality audit or EDA.

## Workflow

```
Intake:
- [ ] Locate source files / queries → place under data/
- [ ] Load with explicit dtypes where possible
- [ ] Record shape, grain, time range
- [ ] Update docs/DATA_DICTIONARY.md
- [ ] Append intake note to docs/INSIGHTS.md
- [ ] Partial commit: docs (then code/notebook if any)
- [ ] Handoff to data-quality-audit
```

### 1. Load

Prefer Parquet over CSV when both exist. For CSV:

```python
import pandas as pd

df = pd.read_csv(
    path,
    parse_dates=["..."],  # only known date cols
    # dtype={...} when schema is known
)
```

Keep load logic in numbered `scripts/` or `notebooks/` (`01_intake.*`). Save snapshots under `data/`.

### 2. Capture facts → DATA_DICTIONARY.md

Update:

- Dataset path, grain, primary/candidate keys
- Row/column counts, time range
- Column types and nullability
- Surprising values / sentinels

### 3. INSIGHTS.md intake entry

```markdown
## YYYY-MM-DD — Intake (<dataset>)

- Source:
- Shape:
- Grain:
- Time range:
- Surprises:
- Next: data-quality-audit
```

### 4. Naming

If new notebooks/scripts lack correct numbering, propose renames and ask before commit.

## Rules

- Do not overwrite irreplaceable raw sources in place
- Never assume column meaning — confirm when ambiguous
- Do not commit while leaving `DATA_DICTIONARY.md` / `INSIGHTS.md` stale

## Handoff

Next: **data-quality-audit**
