# Subagents

Expert Cursor subagents for this skill pack. Each file is a [Cursor custom subagent](https://cursor.com/docs/subagents) (YAML frontmatter + prompt).

## Install into a project

```bash
mkdir -p .cursor/agents
ln -s "$(pwd)/agents/"*.md .cursor/agents/
# Or copy if you prefer editable project-local agents:
# cp agents/*.md .cursor/agents/
```

Invoke with `/name` (e.g. `/ds-bootstrap`) or ask the parent agent to delegate.

## Agents ↔ skills

| Subagent | Skill | Role |
|----------|-------|------|
| `ds-bootstrap` | `ds-project-bootstrap` | Scaffold / repair project |
| `dataset-intake` | `dataset-intake` | Load + dictionary |
| `data-quality-audit` | `data-quality-audit` | Quality audit |
| `eda` | `exploratory-data-analysis` | Exploration |
| `data-viz` | `data-visualization` | Communication charts |
| `stats-analysis` | `statistical-analysis` | Inference |
| `ml-modeling` | `machine-learning` | Modeling |
| `model-eval` | `model-evaluation` | Evaluation |
| `analysis-review` | `analysis-review` | Critique (readonly) |

## Shared operating principles

Every subagent must:

1. Read `SPEC.md` (or ask for the decision goal) before deep work
2. Prefer project layout: `data/`, `docs/`, `notebooks/`, `outputs/`, `scripts/`
3. Keep `docs/DATA_DICTIONARY.md` and `docs/INSIGHTS.md` current before related commits
4. Use numbered names; **propose renames and ask** before applying
5. Prefer **partial, clear commits**
6. Be precise: separate observation, interpretation, and recommendation
7. Optimize for decision quality aligned with SPEC — not busywork or decoration
8. Return a short structured handoff to the parent agent

Detailed procedures live in `skills/<name>/SKILL.md`. Subagents execute; skills are the source of truth for checklists.
