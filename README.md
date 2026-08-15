# data-science-skills

Agent skills for end-to-end data science workflows in Cursor.

## Skills

| Skill | Purpose |
|-------|---------|
| [ds-project-bootstrap](skills/ds-project-bootstrap/) | Scaffold a reproducible DS project |
| [dataset-intake](skills/dataset-intake/) | Load, validate, and document datasets |
| [data-quality](skills/data-quality/) | Profile quality issues and remediation |
| [exploratory-data-analysis](skills/exploratory-data-analysis/) | Structured EDA and insights |
| [statistical-analysis](skills/statistical-analysis/) | Hypothesis tests and inference |
| [machine-learning](skills/machine-learning/) | Train and iterate models |
| [model-evaluation](skills/model-evaluation/) | Metrics, diagnostics, comparison |
| [analysis-review](skills/analysis-review/) | Review analysis for rigor and clarity |

## Suggested flow

```
bootstrap → intake → data-quality → EDA → stats / ML → evaluation → review
```

## Layout

```
skills/     # Agent skills (SKILL.md + optional refs/scripts)
evals/      # Eval harnesses and fixtures
examples/   # End-to-end example projects
```

## Install

Copy or symlink skills into your Cursor skills directory:

```bash
# Personal skills
ln -s "$(pwd)/skills/"* ~/.cursor/skills/

# Or project-scoped
mkdir -p .cursor/skills
ln -s "$(pwd)/skills/"* .cursor/skills/
```

## License

MIT — see [LICENSE](LICENSE).
