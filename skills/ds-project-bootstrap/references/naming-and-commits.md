# Naming and commits

## File naming

| Kind | Pattern | Example |
|------|---------|---------|
| Notebook | `NN_topic.ipynb` | `01_intake.ipynb` |
| Script | `NN_verb_object.py` | `02_clean_customers.py` |
| Output figure | `NN_topic.ext` optional | `03_churn_by_tenure.png` |

Rules:

- Zero-pad to 2 digits unless the project agrees otherwise
- Contiguous numbers within a folder when order matters
- `snake_case`, no spaces
- Ban vanity suffixes: `final`, `final_v2`, `NEW`, `copy`

## Pre-commit naming review

Agent checklist:

1. List `notebooks/` and `scripts/`
2. Flag gaps, collisions, vague names, files outside standard folders
3. Propose a rename table (old → new)
4. Ask user before applying
5. Commit renames alone: `chore: normalize notebook and script filenames`

## Partial commits

One concern per commit. Prefer:

| Order | Example message |
|-------|-----------------|
| 1 | `chore: scaffold project layout and gitignore` |
| 2 | `docs: add SPEC, AGENTS, CLAUDE, and living docs` |
| 3 | `docs: update dictionary after intake` |
| 4 | `docs: record quality audit findings` |
| 5 | `fix: handle duplicate keys in customers` |
| 6 | `chore: normalize notebook and script filenames` |

Update living docs when findings appear; commit those doc updates before or with the tightly related code — never leave docs stale across a commit of related work.
