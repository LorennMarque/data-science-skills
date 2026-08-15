# Research brief guidance

Fill `docs/RESEARCH.md` at bootstrap when case context exists (user brief, SPEC, tickets, prior docs).

## Purpose

Orient the project before intake/EDA: how industry typically frames and attacks this objective — then pick a concrete path for *this* repo.

## Quality bar

- Tied to SPEC success metric
- Actionable (strategies → methods → tools → recommended path)
- Honest about data/design prerequisites
- No fake citations; if unsure, say so and list what to verify

## Suggested sections

1. **Case summary** — objective, decision, constraints
2. **Problem family** — industry label(s)
3. **Strategies** — 2–4 framings used in practice
4. **Methods** — stats / ML / experiment / causal options mapped to strategies
5. **Tools** — common stack; default to tools already in `requirements.txt` when enough
6. **Recommended approach** — primary + alternatives with tradeoffs
7. **Risks & prerequisites** — data, leakage, ethics, timeline
8. **Open questions** — what blocks locking the approach

Update RESEARCH when the objective or constraints change materially; keep tactical findings in `INSIGHTS.md`.
