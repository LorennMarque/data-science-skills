# Doc templates

Used by `scripts/init_project.sh`. Agents may recreate files from here if the script is unavailable.

## SPEC.md

```markdown
# Spec — <project>

## Problem
## Success metric
## In scope
## Out of scope
## Data sources
## Constraints
## Open questions
```

## AGENTS.md

Must include: layout, living-docs-before-commit (dictionary, insights, research), naming/enumeration review with offer-to-fix, partial clear commits, no secrets.

## CLAUDE.md

Point to SPEC → AGENTS → RESEARCH → DATA_DICTIONARY → INSIGHTS. Restate must-do / must-not briefly.

## docs/DATA_DICTIONARY.md

Tables for datasets, columns, relationships, known issues. Update on every schema learning.

## docs/INSIGHTS.md

Dated log, newest first. Each entry: context, finding, evidence, decision, open questions.

## docs/RESEARCH.md

Case framing at bootstrap: problem family, strategies, methods, industry tools, recommended path, risks, open questions. See [research-brief.md](research-brief.md).
