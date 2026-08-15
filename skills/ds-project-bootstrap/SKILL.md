---
name: ds-project-bootstrap
description: >-
  Bootstrap or repair a data science project layout (data, docs, notebooks,
  outputs, scripts), create AGENTS.md / CLAUDE.md / SPEC.md / docs stubs, fix
  file naming, and guide partial clear commits. Use when starting a new DS
  project, cleaning a messy repo, or when the user asks to bootstrap / init.
---

# DS Project Bootstrap

## Goal

Leave the repo in a standard, agent-friendly layout with living docs and commit hygiene — before analysis starts.

## When the project is messy

If folders/files are scattered or missing the standard tree:

1. Create any missing folders/files listed below (do not delete user work)
2. Move existing assets into the right place **only after confirming** with the user
3. Run the **naming review** and offer fixes before any commit

## Target layout

```
project/
├── AGENTS.md
├── CLAUDE.md
├── SPEC.md
├── README.md
├── .gitignore
├── requirements.txt
├── data/                 # raw & working datasets (gitignored patterns apply)
├── docs/
│   ├── DATA_DICTIONARY.md
│   └── INSIGHTS.md
├── notebooks/
├── outputs/              # figures, tables, model artifacts
└── scripts/
```

Create with:

```bash
bash skills/ds-project-bootstrap/scripts/init_project.sh /path/to/project
```

Or create the same files manually from [references/doc-templates.md](references/doc-templates.md).

## Workflow

```
Bootstrap:
- [ ] Clarify problem → fill SPEC.md
- [ ] Ensure layout + .gitignore + requirements.txt
- [ ] Write AGENTS.md, CLAUDE.md, SPEC.md
- [ ] Seed docs/DATA_DICTIONARY.md and docs/INSIGHTS.md
- [ ] Naming review → offer renames before commit
- [ ] Partial commits (structure / docs / renames separately)
- [ ] Handoff: dataset-intake or data-quality-audit
```

### 1. SPEC.md

Capture: problem, success metric, scope in/out, data sources, constraints, open questions. Keep it short; update when the goal changes.

### 2. AGENTS.md (required practices)

Seed from the template. It must instruct agents to:

- Prefer the standard folder layout above
- Keep `docs/DATA_DICTIONARY.md` and `docs/INSIGHTS.md` current as findings appear
- Update living docs **before** committing related work
- Use numbered notebook/script names (`01_`, `02_`, …) — see naming rules
- Offer to fix naming/order **before** committing
- Make **partial, clear commits** (one concern per commit); never dump unrelated changes together
- Not commit secrets, raw bulky extracts, or `.venv/`

### 3. CLAUDE.md

Short project brief for Claude-compatible agents: point to `SPEC.md`, `AGENTS.md`, and the docs that must stay updated. Keep under ~80 lines.

### 4. Living docs

| File | Role |
|------|------|
| `docs/DATA_DICTIONARY.md` | Tables, grain, columns, types, nullability, keys |
| `docs/INSIGHTS.md` | Dated findings, decisions, open questions |

**Rule:** when something new is learned (schema quirk, quality issue, insight), append/update these docs in the same work session, then commit docs with or just before the code that depends on them.

### 5. Naming review (before commit)

Scan `notebooks/`, `scripts/`, and key data files. Flag:

- Missing numeric prefixes where order matters
- Gaps or collisions (`01_`, `03_` without `02_`)
- Spaces, inconsistent case, vague names (`analisis_final_v2_final.ipynb`)
- Outputs sitting outside `outputs/`

Propose a rename plan, **ask before applying**, then commit renames alone:

```text
chore: normalize notebook and script filenames
```

Rules: [references/naming-and-commits.md](references/naming-and-commits.md)

### 6. Partial commits

After bootstrap, prefer separate commits such as:

1. `chore: scaffold project layout and gitignore`
2. `docs: add SPEC, AGENTS, CLAUDE, and living docs stubs`
3. `chore: rename notebooks/scripts to numbered convention` (only if user accepted)

Do not mix scaffolding, renames, and analysis in one commit.

## requirements.txt starter

```
pandas>=2.0
numpy>=1.24
matplotlib>=3.7
scikit-learn>=1.3
pyarrow>=14.0
jupyter>=1.0
```

Pin tighter only when the user asks.

## Handoff

1. Place or link raw data under `data/`
2. Run **dataset-intake** (load + first dictionary pass)
3. Run **data-quality-audit** (quality findings → docs + optional clean outputs)
