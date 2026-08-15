---
name: analysis-review
description: >-
  Review a data analysis or modeling package for rigor, clarity, and decision
  usefulness. Use when reviewing notebooks/reports, checking methodology,
  preparing stakeholder delivery, or when the user asks for an analysis critique.
---

# Analysis Review

## Goal

Catch methodological holes and unclear storytelling before the work influences a decision.

## Workflow

```
Review:
- [ ] Problem ↔ method alignment
- [ ] Data & leakage / bias risks
- [ ] Statistical or ML validity
- [ ] Reproducibility
- [ ] Narrative clarity for audience
- [ ] Issue list with severity
```

### Checklist

**Question & design**

- [ ] Question is decision-relevant and measurable
- [ ] Estimand / prediction task matches the question
- [ ] Confounding / selection bias acknowledged (observational)

**Data**

- [ ] Grain and filters documented
- [ ] Train/test or experiment assignment is honest
- [ ] No obvious leakage

**Methods**

- [ ] Baseline present
- [ ] Assumptions checked or robustness shown
- [ ] Uncertainty reported (CI / error analysis)

**Communication**

- [ ] Claims tied to evidence
- [ ] Limitations section exists
- [ ] Recommended action is explicit (or explicitly deferred)

### Feedback format

```markdown
## Verdict
Ready / needs revision / not decision-grade

## Critical
- ...

## Suggestions
- ...

## Nice to have
- ...
```

## Rules

- Be specific: cite notebook cells, figures, or metric tables
- Prefer fixing blockers over polishing prose
- Do not inflate confidence when data cannot support it
