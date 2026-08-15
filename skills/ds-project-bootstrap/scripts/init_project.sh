#!/usr/bin/env bash
# Scaffold a standard data science project for agent workflows.
set -euo pipefail

ROOT="${1:-.}"
mkdir -p "$ROOT"
ROOT="$(cd "$ROOT" && pwd)"
NAME="$(basename "$ROOT")"

mkdir -p "$ROOT"/{data,docs,notebooks,outputs,scripts}

for d in data docs notebooks outputs scripts; do
  touch "$ROOT/$d/.gitkeep"
done

# Remove .gitkeep once real stub files exist in docs/
rm -f "$ROOT/docs/.gitkeep"

if [[ ! -f "$ROOT/.gitignore" ]]; then
  cat > "$ROOT/.gitignore" <<'EOF'
.venv/
venv/
__pycache__/
*.py[cod]
.ipynb_checkpoints/
.DS_Store
.env
*.egg-info/
dist/
build/

# Local bulky raw extracts (keep folder)
data/**
!data/.gitkeep
!data/**/.gitkeep

# Generated outputs (keep folder; commit curated reports deliberately)
outputs/**
!outputs/.gitkeep
!outputs/**/.gitkeep
EOF
fi

if [[ ! -f "$ROOT/requirements.txt" ]]; then
  cat > "$ROOT/requirements.txt" <<'EOF'
pandas>=2.0
numpy>=1.24
matplotlib>=3.7
scikit-learn>=1.3
pyarrow>=14.0
jupyter>=1.0
EOF
fi

if [[ ! -f "$ROOT/README.md" ]]; then
  cat > "$ROOT/README.md" <<EOF
# ${NAME}

See [SPEC.md](SPEC.md) for the problem statement and success metrics.

## Setup

\`\`\`bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
\`\`\`

## Layout

- \`data/\` — datasets
- \`docs/\` — DATA_DICTIONARY.md, INSIGHTS.md
- \`notebooks/\` — numbered exploratory notebooks
- \`outputs/\` — figures, tables, artifacts
- \`scripts/\` — numbered reusable scripts

Agent conventions: [AGENTS.md](AGENTS.md)
EOF
fi

if [[ ! -f "$ROOT/SPEC.md" ]]; then
  cat > "$ROOT/SPEC.md" <<EOF
# Spec — ${NAME}

## Problem

## Success metric

## In scope

## Out of scope

## Data sources

| Source | Location | Owner | Notes |
|--------|----------|-------|-------|
|        |          |       |       |

## Constraints

## Open questions
EOF
fi

if [[ ! -f "$ROOT/AGENTS.md" ]]; then
  cat > "$ROOT/AGENTS.md" <<'EOF'
# Agent guide

Instructions for coding agents working in this repository.

## Project layout

Keep this structure. Create missing folders; do not invent parallel trees.

- `data/` — datasets (prefer not committing bulky raw extracts)
- `docs/` — living documentation (`DATA_DICTIONARY.md`, `INSIGHTS.md`)
- `notebooks/` — exploration (numbered)
- `outputs/` — figures, tables, model artifacts
- `scripts/` — reusable scripts (numbered)
- `SPEC.md` — problem, metrics, scope
- `AGENTS.md` / `CLAUDE.md` — agent conventions

## Living docs (update before commit)

When you discover schema details, quality issues, or analysis insights:

1. Update `docs/DATA_DICTIONARY.md` (columns, types, grain, keys, sentinels)
2. Append to `docs/INSIGHTS.md` with date, finding, decision, open questions
3. Only then commit related code/notebooks/data moves

Stale docs are a defect — fix docs in the same session as the finding.

## Naming

- Notebooks: `notebooks/01_intake.ipynb`, `02_quality_audit.ipynb`, …
- Scripts: `scripts/01_load_raw.py`, `02_clean.py`, …
- Prefer `snake_case`, ASCII, no spaces
- Avoid: `final`, `v2_final`, `new`, `old`, dates-as-versions unless agreed

Before committing, review names for correct enumeration and clarity. If anything is wrong, **propose renames and ask before applying**.

## Commits

- Partial and clear: one concern per commit
- Good: `docs: add tenure null finding to insights`
- Good: `fix: drop duplicate customer_id rows`
- Bad: mixing renames + cleaning + modeling in one commit
- Suggested order: docs → code/notebooks → data relocation → renames (renames alone)

Never commit secrets, `.env`, or `.venv/`.

## Analysis hygiene

- Do not mutate irreplaceable raw sources in place; write cleaned copies
- Record fix-vs-accept decisions in `INSIGHTS.md`
- Prefer small numbered scripts over one mega-notebook when logic stabilizes
EOF
fi

if [[ ! -f "$ROOT/CLAUDE.md" ]]; then
  cat > "$ROOT/CLAUDE.md" <<'EOF'
# Claude / agent brief

Read in this order when starting work:

1. `SPEC.md` — problem and success metric
2. `AGENTS.md` — layout, naming, commits, living docs
3. `docs/DATA_DICTIONARY.md` — schema
4. `docs/INSIGHTS.md` — prior findings and decisions

## Must do

- Keep `docs/DATA_DICTIONARY.md` and `docs/INSIGHTS.md` updated as you learn things
- Update those docs before (or in the same change set as) commits that depend on the findings
- Use numbered `notebooks/` and `scripts/` names; offer renames before commit if order/names are wrong
- Prefer partial, clear commits

## Must not

- Commit secrets or virtualenvs
- Leave living docs stale after a quality or EDA finding
- Dump unrelated changes into a single commit
EOF
fi

if [[ ! -f "$ROOT/docs/DATA_DICTIONARY.md" ]]; then
  cat > "$ROOT/docs/DATA_DICTIONARY.md" <<'EOF'
# Data dictionary

Living document — update whenever schema understanding changes.

## Datasets

| Name | Path | Grain | Primary key | Rows (approx) | As of |
|------|------|-------|-------------|----------------|-------|
|      |      |       |             |                |       |

## Columns

| Dataset | Column | Type | Nullable | Description | Notes |
|---------|--------|------|----------|-------------|-------|
|         |        |      |          |             |       |

## Relationships

| From | To | Key | Cardinality | Notes |
|------|----|-----|-------------|-------|
|      |    |     |             |       |

## Known data issues

| Dataset | Issue | Severity | Status | See also |
|---------|-------|----------|--------|----------|
|         |       |          |        | INSIGHTS.md |
EOF
fi

if [[ ! -f "$ROOT/docs/INSIGHTS.md" ]]; then
  cat > "$ROOT/docs/INSIGHTS.md" <<'EOF'
# Insights & decisions

Living log — append dated entries as findings appear. Update before related commits.

## Template

```markdown
## YYYY-MM-DD — <title>

- Context:
- Finding:
- Evidence:
- Decision:
- Open questions:
```

## Log

<!-- Newest entries at the top -->
EOF
fi

echo "Initialized DS project at: $ROOT"
echo "Next: fill SPEC.md, then dataset-intake / data-quality-audit"
