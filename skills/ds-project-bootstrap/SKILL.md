---
name: ds-project-bootstrap
description: >-
  Scaffold a reproducible data science project (folders, env, README, data
  contracts). Use when starting a new DS project, setting up analysis repos,
  or when the user asks to bootstrap / initialize a data science workspace.
---

# DS Project Bootstrap

## Goal

Create a clean, reproducible project layout before any analysis code.

## Workflow

Copy and track:

```
Bootstrap:
- [ ] Clarify goal, success metric, and constraints
- [ ] Create directory layout
- [ ] Add environment + dependency files
- [ ] Add README with problem statement
- [ ] Add data contract stub
- [ ] Document next skill to run (usually dataset-intake)
```

### 1. Clarify scope

Ask only what blocks scaffolding:

- Business question / decision
- Primary metric and time horizon
- Data sources available (paths, APIs, warehouses)
- Python vs R preference (default: Python)

### 2. Create layout

```
project-name/
├── README.md
├── pyproject.toml          # or requirements.txt
├── .gitignore
├── data/
│   ├── raw/                # immutable inputs
│   ├── interim/            # cleaned intermediates
│   └── processed/          # model-ready tables
├── notebooks/
├── src/
│   └── <package>/
├── reports/
│   ├── figures/
│   └── tables/
└── tests/
```

Prefer `src/` packages over dumping logic into notebooks.

### 3. Environment

- Pin Python version in `pyproject.toml` or `.python-version`
- Minimal starter deps: `pandas`, `numpy`, `matplotlib`, `scikit-learn`, `pyarrow`
- Add `.gitignore` covering `data/raw/`, `.venv/`, `__pycache__/`, `.ipynb_checkpoints/`

### 4. README skeleton

```markdown
# <Project>

## Problem
## Success metric
## Data sources
## Setup
## Reproducibility notes
## Analysis log
```

### 5. Data contract stub

Create `data/CONTRACT.md` (or YAML) with:

- Expected tables / files
- Key columns, types, grain (row meaning)
- Freshness and known caveats

## Scripts

- `scripts/init_project.sh` — create the standard folder tree

```bash
bash skills/ds-project-bootstrap/scripts/init_project.sh /path/to/project-name
```

## References

- Layout rationale: [references/project-layout.md](references/project-layout.md)

## Handoff

Next: **dataset-intake** once raw data paths exist.
