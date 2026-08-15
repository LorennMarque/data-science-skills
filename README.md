# data-science-skills

Cursor / LLM agent skills for end-to-end data science work.

Each folder under `skills/` is one skill (`SKILL.md` + optional `references/` / `scripts/`).

## Skills

| Skill | Purpose |
|-------|---------|
| [ds-project-bootstrap](skills/ds-project-bootstrap/) | Scaffold/repair layout, AGENTS/CLAUDE/SPEC, living docs + RESEARCH brief, naming + commits |
| [dataset-intake](skills/dataset-intake/) | Load data and seed `docs/DATA_DICTIONARY.md` |
| [data-quality-audit](skills/data-quality-audit/) | Quality audit with docs updated before commit |
| [exploratory-data-analysis](skills/exploratory-data-analysis/) | Structured EDA → `docs/INSIGHTS.md` |
| [data-visualization](skills/data-visualization/) | Clear, honest charts for communication |
| [statistical-analysis](skills/statistical-analysis/) | Hypothesis tests and inference |
| [machine-learning](skills/machine-learning/) | Train and iterate models |
| [model-evaluation](skills/model-evaluation/) | Metrics, diagnostics, comparison |
| [analysis-review](skills/analysis-review/) | Review analysis for rigor and clarity |

## Flow

```
bootstrap → intake → data-quality-audit → EDA → visualization → stats / ML → evaluation → review
```

Living docs in bootstrapped projects (`docs/DATA_DICTIONARY.md`, `docs/INSIGHTS.md`, `docs/RESEARCH.md`) update as findings appear, before related commits. Bootstrap fills `RESEARCH.md` with industry strategies/methods/tools when case context exists.

## Install

Personal (all skills):

```bash
git clone https://github.com/LorennMarque/data-science-skills.git
cd data-science-skills
for d in skills/*/ ; do
  ln -s "$(pwd)/${d%/}" ~/.cursor/skills/
done
```

Project-scoped:

```bash
mkdir -p .cursor/skills
for d in /path/to/data-science-skills/skills/*/ ; do
  ln -s "${d%/}" .cursor/skills/
done
```

## License

MIT — see [LICENSE](LICENSE).
