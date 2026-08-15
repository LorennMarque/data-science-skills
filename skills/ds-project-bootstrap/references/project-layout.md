# Project layout notes

## Why separate `raw` / `interim` / `processed`

- **raw**: never mutate; regenerate everything from here
- **interim**: cleaning, joins, feature drafts
- **processed**: stable tables for EDA / modeling

## Notebooks vs `src/`

- Notebooks: exploration and narrative
- `src/`: reusable transforms, metrics, training entrypoints

Promote notebook logic into `src/` once it stabilizes.

## Contracts

A short data contract prevents silent schema drift. Update it when intake or quality skills discover mismatches.
