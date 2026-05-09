---
name: slow-sql-design-docx
description: Use when drafting or filling a Chinese enterprise-style slow SQL optimization outline/design DOCX from a slow SQL analysis Excel file, a Word template, and implementation scripts such as tar-packaged index DDL.
---

# Slow SQL Design DOCX

## Overview

Use this skill to turn slow SQL analysis artifacts into a conservative outline/design document. The main job is not generic document editing; it is evidence control:

- Extract what the analysis Excel says.
- Extract what the implementation package actually changes.
- Fill the DOCX template only with content supported by those artifacts.
- Leave unknown fields blank or marked as pending instead of inventing business facts.

## When to Use

Use this skill when the user provides:

- A slow SQL analysis spreadsheet, often with categorized sheets such as city/district or production slow SQL summaries
- A DOCX outline/design template to fill
- A deployment package, tarball, SQL script, or version package containing index DDL or rollback DDL
- A request to write a Chinese technical outline/design for database index optimization

Do not use this skill for normal prose polishing, SQL tuning from scratch, or database changes that are not backed by provided scripts.

## Inputs to Identify

Classify each file before writing:

- `analysis`: Excel workbook containing slow SQL, trade names, nodes, causes, recommendations, and rectification status
- `template`: DOCX file whose existing sections, paragraphs, and tables should be preserved where possible
- `implementation`: tar/zip/sql package containing actual online and rollback SQL
- `output`: a new DOCX path; never overwrite the original template unless the user explicitly asks

If several candidate files exist, prefer the files explicitly mentioned by the user.

## Workflow

### 1. Inspect the package before the spreadsheet

List the deployment package contents and identify the authoritative implementation scripts.

Common file names:

- `*_online.sql`
- `*_rollback.sql`
- `version.sql`
- `update.sql`
- `rollback.sql`

Extract concrete DDL facts:

- Schema or owner, if present
- Table names
- Index names
- Indexed columns and order
- Rollback statements
- Any comments that identify batch, system, or ticket context

Treat the implementation scripts as the scope boundary. If the Excel recommends ten optimizations but the package adds three indexes, document the three implemented changes and mention only as context that other Excel items are outside this package when useful.

### 2. Read the Excel as supporting evidence

Inspect workbook sheet names first, then read the likely summary/classification sheets.

Look for columns such as:

- Slow SQL text or SQL fingerprint
- Analysis, cause, bottleneck, or current issue
- Optimization suggestion
- Transaction or service name
- Node, module, branch, city, district, or environment
- Rectification status
- Table or index references

Join spreadsheet rows to implementation DDL by table name, index target table, SQL text, or transaction/module hints. Do not force a match if evidence is weak.

### 3. Read the DOCX template structure

Before editing, extract:

- Paragraph text
- Heading hierarchy
- Table captions and row/column labels
- Placeholder tokens, example text, and obvious template residue

Choose insertion points that match the template rather than appending a separate report at the end. Preserve existing formatting when practical.

### 4. Fill only supported sections

Typical sections and safe content:

- Requirement/background: slow SQL exists in production; this change adds indexes according to the package
- Scope: list only tables and indexes from implementation scripts
- Current analysis: summarize matched Excel rows and observed slow SQL categories
- Technical design: index DDL, affected tables, expected access path improvement, no application code change if scripts show only DDL
- Deployment: online SQL script names, execution order, affected database objects
- Rollback: rollback SQL script names and exact drop-index statements
- Verification: explainable checks such as SQL execution success, index existence, explain plan/index usage, and slow SQL observation after release
- Non-functional impact: expected query latency improvement; note storage/DDL lock impact as considerations if not quantified

Unknown items should stay as `待补充`, blank, or clearly marked `未从提供材料中确认`.

### 5. Remove template residue

Before finalizing, search the generated DOCX text for obvious leftovers:

- `XX`
- `xxx`
- `TODO`
- `待填写` when the surrounding field has actually been filled
- instructional sentences from the template
- irrelevant original feature names

Keep `待补充` only where information is truly unknown.

## Validation

Perform at least structure-level validation:

- Generated DOCX is a valid zip/package.
- The original template remains unchanged unless requested.
- Every online index DDL from the implementation package appears in the output.
- Every rollback DDL appears in the output or the rollback section.
- No implemented index is missing from the scope/design sections.
- No Excel-only recommendation is described as implemented unless it appears in the scripts.

If LibreOffice or another renderer is available, export to PDF/images and inspect layout. If not available, say visual rendering was not performed and report the structural checks instead.

## Failure Handling

If a script cannot be parsed safely:

- Quote the unresolved script path and leave related design details pending.
- Do not guess index columns or rollback statements.

If Excel and scripts disagree:

- Prefer scripts for implemented scope.
- Use Excel only for analysis/background.
- State the discrepancy briefly in the working notes or final response.

If the template has ambiguous sections:

- Fill the most directly matching sections.
- Leave unrelated business, approval, date, owner, and system-code fields pending.

## Final Response

Report:

- Output DOCX path
- Implemented index count and tables
- Unknown fields intentionally left pending
- Validation performed
- Any validation that could not be performed, such as missing `soffice`
