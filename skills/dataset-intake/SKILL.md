---
name: dataset-intake
description: >-
  Load, validate schema, and document datasets for analysis. Use when ingesting
  CSV/Parquet/SQL data, registering new tables, checking schema against a data
  contract, or starting work on a fresh data source.
---

# Dataset Intake

## Goal

Get data into a known, documented state before quality checks or EDA.

## Workflow

```
Intake:
- [ ] Locate source files / queries
- [ ] Load with explicit dtypes where possible
- [ ] Record shape, grain, time range
- [ ] Compare to data contract (create if missing)
- [ ] Write a short intake note
- [ ] Handoff to data-quality
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

For SQL, keep the query in `src/` or `notebooks/` and save a snapshot to `data/raw/` or `data/interim/`.

### 2. Capture facts

Record:

- Row count, column count
- Grain (what one row means)
- Primary / candidate keys
- Time column + min/max
- Missingness rate per key columns
- Sample of unexpected values

### 3. Contract check

If `data/CONTRACT.md` exists, flag:

- Missing expected columns
- Type mismatches
- Duplicate keys
- Rows outside expected date range

If missing, draft the contract from observed schema.

### 4. Intake note template

```markdown
## Intake — <dataset>

- Source:
- Loaded at:
- Shape:
- Grain:
- Time range:
- Issues / surprises:
- Next: data-quality
```

## Rules

- Do not overwrite `data/raw/`
- Prefer writing cleaned copies to `data/interim/`
- Never assume column meaning — confirm with user when ambiguous

## Handoff

Next: **data-quality**
