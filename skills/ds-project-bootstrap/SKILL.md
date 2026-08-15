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
│   ├── INSIGHTS.md
│   └── RESEARCH.md
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
- [ ] Seed docs/DATA_DICTIONARY.md, docs/INSIGHTS.md, docs/RESEARCH.md
- [ ] Case research pass → fill RESEARCH.md (if context exists)
- [ ] Naming review → offer renames before commit
- [ ] Partial commits (structure / docs / research / renames separately)
- [ ] Handoff: dataset-intake or data-quality-audit
```

### 1. SPEC.md

Capture: problem, success metric, scope in/out, data sources, constraints, open questions. Keep it short; update when the goal changes.

### 2. AGENTS.md (required practices)

Seed from the template. It must instruct agents to:

- Prefer the standard folder layout above
- Keep `docs/DATA_DICTIONARY.md`, `docs/INSIGHTS.md`, and `docs/RESEARCH.md` current as findings appear
- Update living docs **before** committing related work
- Use numbered notebook/script names (`01_`, `02_`, …) — see naming rules
- Offer to fix naming/order **before** committing
- Make **partial, clear commits** (one concern per commit); never dump unrelated changes together
- Not commit secrets, raw bulky extracts, or `.venv/`

### 3. CLAUDE.md

Short project brief for Claude-compatible agents: point to `SPEC.md`, `AGENTS.md`, and the docs that must stay updated (including `RESEARCH.md`). Keep under ~80 lines.

### 4. Living docs

| File | Role |
|------|------|
| `docs/DATA_DICTIONARY.md` | Tables, grain, columns, types, nullability, keys |
| `docs/INSIGHTS.md` | Dated findings, decisions, open questions |
| `docs/RESEARCH.md` | Case framing + industry strategies, methods, tools |

**Rule:** when something new is learned (schema quirk, quality issue, insight, better method), append/update these docs in the same work session, then commit docs with or just before the code that depends on them.

### 5. RESEARCH.md (case analysis at bootstrap)

During bootstrap, if the user provides a brief, brief attachments, ticket text, prior README, or enough SPEC content:

1. Summarize the case and decision objective
2. Map it to common industry problem families (e.g. churn, forecasting, freemium conversion, credit risk, ops anomaly detection)
3. Propose **strategies** (framing / analytical approaches used in practice)
4. Propose **methods** (stats / ML / experimentation / causal where relevant)
5. Propose **tools** commonly used in industry for that class of problem (libraries, platforms) — prefer pragmatic defaults aligned with this repo (`pandas`, `sklearn`, etc.) unless the case needs more
6. Recommend a **primary path** + 1–2 alternatives with tradeoffs
7. List risks, data prerequisites, and open questions

If context is thin: create the stub, state what is missing, and ask only blocker questions — do not invent a fake industry brief.

Do not turn RESEARCH into a literature dump. Keep it actionable and tied to SPEC. Guidance: [references/research-brief.md](references/research-brief.md).

### 6. Naming review (before commit)

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

### 7. Partial commits

After bootstrap, prefer separate commits such as:

1. `chore: scaffold project layout and gitignore`
2. `docs: add SPEC, AGENTS, CLAUDE, and living docs stubs`
3. `docs: draft RESEARCH brief for <problem family>`
4. `chore: rename notebooks/scripts to numbered convention` (only if user accepted)

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
