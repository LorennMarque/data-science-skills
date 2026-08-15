# data-science-skills

Cursor / LLM agent skills for end-to-end data science work.

Each folder is one skill (`SKILL.md` + optional `references/` / `scripts/`).

## Skills

| Skill | Purpose |
|-------|---------|
| [ds-project-bootstrap](ds-project-bootstrap/) | Scaffold/repair layout, AGENTS/CLAUDE/SPEC, living docs, naming + commits |
| [dataset-intake](dataset-intake/) | Load data and seed `docs/DATA_DICTIONARY.md` |
| [data-quality-audit](data-quality-audit/) | Quality audit with docs updated before commit |
| [exploratory-data-analysis](exploratory-data-analysis/) | Structured EDA → `docs/INSIGHTS.md` |
| [data-visualization](data-visualization/) | Clear, honest charts for communication |
| [statistical-analysis](statistical-analysis/) | Hypothesis tests and inference |
| [machine-learning](machine-learning/) | Train and iterate models |
| [model-evaluation](model-evaluation/) | Metrics, diagnostics, comparison |
| [analysis-review](analysis-review/) | Review analysis for rigor and clarity |

## Flow

```
bootstrap → intake → data-quality-audit → EDA → visualization → stats / ML → evaluation → review
```

Living docs in bootstrapped projects (`docs/DATA_DICTIONARY.md`, `docs/INSIGHTS.md`) update as findings appear, before related commits.

## Install

Personal (all skills):

```bash
git clone https://github.com/LorennMarque/data-science-skills.git
cd data-science-skills
for d in */; do
  [ -f "${d}SKILL.md" ] || continue
  ln -s "$(pwd)/${d%/}" ~/.cursor/skills/
done
```

Project-scoped:

```bash
mkdir -p .cursor/skills
for d in /path/to/data-science-skills/*/ ; do
  [ -f "${d}SKILL.md" ] || continue
  ln -s "${d%/}" .cursor/skills/
done
```

## License

MIT — see [LICENSE](LICENSE).
