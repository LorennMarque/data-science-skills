#!/usr/bin/env bash
# Create a standard data science project tree.
set -euo pipefail

ROOT="${1:-.}"
NAME="$(basename "$(cd "$(dirname "$ROOT")" && pwd)/$(basename "$ROOT")")"

mkdir -p "$ROOT"/{data/{raw,interim,processed},notebooks,src,reports/{figures,tables},tests}

# Keep empty dirs in git
for d in data/raw data/interim data/processed notebooks reports/figures reports/tables tests; do
  touch "$ROOT/$d/.gitkeep"
done

if [[ ! -f "$ROOT/.gitignore" ]]; then
  cat > "$ROOT/.gitignore" <<'EOF'
.venv/
__pycache__/
*.py[cod]
.ipynb_checkpoints/
.DS_Store
data/raw/*
!data/raw/.gitkeep
*.egg-info/
dist/
build/
.env
EOF
fi

if [[ ! -f "$ROOT/README.md" ]]; then
  cat > "$ROOT/README.md" <<EOF
# ${NAME}

## Problem

## Success metric

## Data sources

## Setup

\`\`\`bash
python -m venv .venv
source .venv/bin/activate
pip install -e .
\`\`\`

## Reproducibility notes

## Analysis log
EOF
fi

if [[ ! -f "$ROOT/data/CONTRACT.md" ]]; then
  cat > "$ROOT/data/CONTRACT.md" <<'EOF'
# Data contract

## Tables / files

| Name | Grain | Primary keys | Notes |
|------|-------|--------------|-------|
|      |       |              |       |

## Columns of interest

| Table | Column | Type | Nullable | Description |
|-------|--------|------|----------|-------------|
|       |        |      |          |             |

## Freshness & caveats
EOF
fi

echo "Initialized DS project at: $ROOT"
