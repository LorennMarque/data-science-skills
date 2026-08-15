# Project layout

## Standard tree

```
project/
├── AGENTS.md
├── CLAUDE.md
├── SPEC.md
├── README.md
├── .gitignore
├── requirements.txt
├── data/
├── docs/
│   ├── DATA_DICTIONARY.md
│   ├── INSIGHTS.md
│   └── RESEARCH.md
├── notebooks/
├── outputs/
└── scripts/
```

## Roles

| Path | Role |
|------|------|
| `data/` | Inputs and cleaned tables |
| `docs/` | Living dictionary, insights, research brief (commit these) |
| `docs/RESEARCH.md` | Case analysis + industry strategies/methods/tools |
| `notebooks/` | Exploration narrative |
| `outputs/` | Figures, tables, artifacts |
| `scripts/` | Reusable, numbered automation |
| `SPEC.md` | Problem / metric / scope |
| `AGENTS.md` | How agents must work in this repo |
| `CLAUDE.md` | Short brief pointing at SPEC + AGENTS + docs |

## Messy project repair

1. Create missing paths/files without deleting user content
2. Propose moves (`reports/` → `outputs/`, random CSVs → `data/`)
3. Run naming review; offer fixes before commit
4. Commit scaffold and renames separately
