# data-science-skills

Agent skills for end-to-end data science workflows in Cursor.

## Skills

| Skill | Purpose |
|-------|---------|
| [ds-project-bootstrap](skills/ds-project-bootstrap/) | Scaffold/repair layout, AGENTS/CLAUDE/SPEC, living docs, naming + commits |
| [dataset-intake](skills/dataset-intake/) | Load data and seed `docs/DATA_DICTIONARY.md` |
| [data-quality-audit](skills/data-quality-audit/) | Quality audit with docs updated before commit |
| [exploratory-data-analysis](skills/exploratory-data-analysis/) | Structured EDA → `docs/INSIGHTS.md` |
| [data-visualization](skills/data-visualization/) | Clear, honest charts for communication |
| [statistical-analysis](skills/statistical-analysis/) | Hypothesis tests and inference |
| [machine-learning](skills/machine-learning/) | Train and iterate models |
| [model-evaluation](skills/model-evaluation/) | Metrics, diagnostics, comparison |
| [analysis-review](skills/analysis-review/) | Review analysis for rigor and clarity |

## Suggested flow

```
bootstrap → intake → data-quality-audit → EDA → visualization → stats / ML → evaluation → review
```

Living docs (`docs/DATA_DICTIONARY.md`, `docs/INSIGHTS.md`) update as findings appear, before related commits.

## Layout

```
skills/     # Agent skills (SKILL.md + optional refs/scripts)
evals/      # Eval harnesses and fixtures
examples/   # End-to-end example projects
```

Bootstrapped analysis projects use: `data/`, `docs/`, `notebooks/`, `outputs/`, `scripts/`, plus `AGENTS.md`, `CLAUDE.md`, `SPEC.md`.

## Install

```bash
# Personal skills
ln -s "$(pwd)/skills/"* ~/.cursor/skills/

# Or project-scoped
mkdir -p .cursor/skills
ln -s "$(pwd)/skills/"* .cursor/skills/
```

## License

MIT — see [LICENSE](LICENSE).
