---
name: codebase-backed-ai-resume-tailoring
description: Use when rewriting resume bullets, project descriptions, or interview材料 from an actual codebase so the AI-related claims stay truthful, concrete, and aligned with the repository implementation.
---

# Codebase Backed Ai Resume Tailoring

## Overview

Use this skill to turn real repository evidence into resume wording for AI application or AI platform roles. The goal is to make the resume sound strong without exaggerating beyond what the code actually implements.

## When to Use

Use this skill when the user:

- Provides a repo and asks for a resume rewrite or project summary
- Wants AI/RAG/agent work emphasized for interview preparation
- Needs Chinese LaTeX bullets, project descriptions, or plain resume bullets rewritten
- Wants wording aligned with actual code instead of marketing claims
- Wants help identifying which features are strong enough to highlight and which should stay out of the resume

Do not use this skill for generic career coaching that is not tied to a codebase.

## Workflow

### 1. Inspect the repository first

Read the code, not just the README. Prioritize evidence from:

- Service classes and controllers
- AI and RAG configuration
- Tool registration or prompt management
- Tests that prove the behavior
- Deployment or observability code

Treat unfinished drafts, plans, and comments as lower-confidence than implemented code.

### 2. Separate implemented facts from planned ideas

Before rewriting any bullet, classify each claim as one of:

- Implemented and visible in code
- Supported by tests or configuration
- Planned but not yet shipped
- Too vague to safely mention

Only put the first two categories into the resume wording unless the user explicitly wants a roadmap section.

### 3. Rewrite for the target role

For AI application engineer resumes, emphasize the strongest evidence in this order:

1. AI application scope and user-facing capability
2. RAG, tool use, memory, prompt management, and observability
3. Streaming, caching, indexing, and performance work around AI calls
4. Deployment and operations that make the AI feature usable in production

Prefer bullets that show ownership plus implementation detail plus outcome. Example shape:

- `基于 Spring AI ... 构建 ...`
- `通过 ... 实现 ...`
- `设计并实现 ...，支持 ...，提升 ...`

### 4. Keep wording honest and concrete

Avoid:

- Claiming model quality improvements that were never measured
- Saying "AI Agent" if the system is only a prompt wrapper
- Mentioning MCP, tool use, memory, or RAG unless the code actually supports it
- Overusing generic phrases such as "提升研发效率" unless the user wants a broad engineering-summary bullet

Prefer concrete nouns from the repo, such as model names, vector stores, SSE, prompt templates, cache layers, and testable features.

### 5. Deliver resume-ready output

Return one of these forms depending on the user request:

- A polished LaTeX `\ResumeItem{...}` block
- A set of Chinese resume bullets with consistent tone
- A before/after comparison when the user wants a rewrite
- A short gap analysis listing what is strong, what is weak, and what to build next

If the user supplies an existing draft, rewrite it instead of starting from zero.
