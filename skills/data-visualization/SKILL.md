---
name: data-visualization
description: >-
  Create clear, honest charts for analytical and business communication
  (Storytelling with Data standards). Use when making plots, dashboards,
  report figures, chart titles, or when the user asks to visualize / improve
  a visualization.
---

# Data Visualization

Compact rules for analytical charts. Goal: the audience gets the relevant insight fast — not “show all the data.”

## Before you plot

Answer in one pass:

1. Who is the audience?
2. What must they understand?
3. What decision does this support?
4. **One-sentence takeaway** — if you cannot write it, the chart is not ready

**One chart = one analytical purpose.** Do not plot a variable just because it exists.

Separate **EDA** (many exploratory plots) from **communication** (only evidence for the conclusion).

## Title

Never use generic labels (`Sales by Month`, `Revenue by Product`).

Titles must do at least one of:

1. State the insight
2. Ask the real analytical question
3. State the conclusion
4. Add useful context

Prefer declarative insight titles when the conclusion is known; questions only while still exploratory. Title and chart must agree — no exaggerated wording.

Useful stack:

```text
MAIN INSIGHT
Context / timeframe / method
[chart]
Source note
```

## Chart choice (simplest that works)

| Task | Prefer |
|------|--------|
| Comparison | Bars, dot plots |
| Over time | Lines |
| Distribution | Histogram, box, density |
| Relationship | Scatter |
| Ranking | Sorted horizontal bars |
| Part-to-whole | Stacked / 100% stacked (pie/donut only if ≤ few categories) |
| Exact values | Table |

Prefer **position/length** over angle/area/volume. Avoid 3D. Avoid dual axes unless strongly justified; prefer two aligned charts or indexed series.

Bars: **baseline 0** by default. Lines: zero optional if trend is the point — still show the axis honestly.

## Declutter

Remove anything that does not help understanding: borders, heavy grids, backgrounds, shadows, 3D, decorative effects, duplicate labels, redundant legends, excess ticks/decimals, repeated units, useless axis titles.

Eliminate redundancy: if bars are directly labeled, drop legend/axis/table duplicates.

## Hierarchy, color, labels

Three levels: **primary** (must see first) → **secondary** (context) → **tertiary** (quiet support). Use size, position, contrast, weight, color, whitespace.

- Default: neutral/gray context; **one** highlight color for the signal
- Color has stable meaning across the report (e.g. red = problem only)
- Do not rely on red/green alone — pair with labels, position, shape
- Prefer **direct labels** over legends
- Highlight exceptions; mute the rest (avoid rainbow / spaghetti)

Preattentive cues (color, size, position, bold, enclosure) should make the insight findable without searching.

## Numbers, order, context

- Sort by analytical meaning (magnitude, time, funnel) — not alphabetically when order is natural
- Reduce precision to what the decision needs; keep formats consistent (`$1.2M`, not mixed styles)
- Put units once where they help most
- KPIs need comparison (vs prior, target, benchmark); show **variance** when comparison is the point
- Annotate important events sparingly — anomalies and turning points, not every point

## Integrity

- Honest scales, aspect ratios, and sizes (if area encodes value, scale **area**, not radius)
- Stacked charts: hard to compare non-baseline segments — switch chart if that comparison matters
- Too many categories/series → Top N + Other, filter, small multiples, or mute + highlight
- Same metric across panels → **shared scales**
- Do not imply causality from correlation; separate observation / interpretation / recommendation

## Dashboards & sections

Overview → drivers → detail. One main message per section. Lead with conclusion, then evidence.

Prime space (esp. upper-left): highest-value KPI/insight — not a KPI cemetery.

Scan test (~5s): what is measured, what happened, good/bad, where to look, what follows.

## Project conventions

- Save figures under `outputs/` with clear names
- Append non-trivial visual findings to `docs/INSIGHTS.md` before related commits
- Numbered notebooks/scripts; offer renames before commit
- Partial commits (e.g. `docs: …` then `feat: add figure for …`)

## Pre-publish checklist

**Message** — specific question? one-sentence takeaway? decision-relevant?

**Title** — insightful (not generic)? matches the evidence?

**Chart** — simplest fit? table better? encoding appropriate?

**Clarity** — clutter/redundancy gone? labels/units/precision/order OK?

**Color** — purposeful? signal vs gray context? works if de-emphasized / grayscale?

**Integrity** — honest scales? bars at 0 unless justified? no visual exaggeration?

**Story** — clear focus? context/annotation enough? leads to “so what?”?

**Final** — 5-second test pass? can anything else be removed? helps the decision?

## Golden rules

1. Every chart needs a reason.
2. Titles add insight, question, or context — never waste them.
3. One chart, one primary idea.
4. Remove what does not help; kill redundancy.
5. Color = meaning + attention, not decoration; gray = context.
6. Direct labels; simplest honest chart; effortless comparisons.
7. Context for numbers; highlight what matters; do not make them hunt.
8. No visual exaggeration; meaningful sort; appropriate precision.
9. EDA ≠ presentation; lead with conclusion + evidence.
10. Correct → honest → clear → insightful → fast → polished.
