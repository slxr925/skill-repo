---
name: social-content-to-notion-md
description: Use when extracting content from Douyin, Xiaohongshu, short links, or image-heavy social posts into a clean Markdown note and optionally syncing it into Notion.
---

# Social Content To Notion Md

## Overview

Use this skill to turn social-media content into structured Chinese Markdown notes. The focus is on extracting the actual media content first, then summarizing it cleanly, and finally syncing the result into the requested Notion location when the user asks for it.

## When to Use

Use this skill when the user:

- Shares a Douyin, Xiaohongshu, or similar social link and asks for the content to be extracted
- Provides a screenshot-heavy post and wants the text distilled
- Wants the result written as a Markdown document
- Wants the note synced into Notion, usually into a named page or folder
- Wants the answer to preserve only the substantive content and drop source clutter such as author labels, promotion text, or interface noise

Do not use this skill for ordinary prose editing or generic summarization that does not involve social content extraction.

## Workflow

### 1. Resolve the source type

First identify whether the source is:

- A short-video share link
- A text-heavy post with image attachments
- A page where the key content lives in screenshots or embedded media

Prefer the richest source that is actually accessible. If the desktop page is blocked or incomplete, try the mobile share page, page metadata, embedded text, screenshots, or OCR before giving up.

### 2. Extract the real content

Prioritize content in this order:

1. Video transcript or audio narration
2. Image OCR and visible on-screen text
3. Page title, caption, and structured metadata
4. Visible comments only if the user explicitly asks for them

Keep a strict boundary between extracted facts and interpretation. Do not invent missing details from partial frames or decorative text.

### 3. Produce a useful Markdown note

Write the note in a form that is useful for later review:

- Use a clear title
- Separate key takeaways, details, and follow-up items
- Preserve important quotes or examples only when they support the summary
- Add links only when they are part of the source or explicitly needed
- Prefer concise Chinese prose over verbatim transcript dumps

If the user wants a production-facing note, remove source labels, author names, and descriptive chatter that do not belong in the final knowledge base.

### 4. Sync to Notion when requested

When the user names a Notion destination:

- Use that exact target page or path
- Write the Markdown content into the requested location
- Keep the structure clean enough to paste directly into Notion
- If the target is a learning or knowledge page, bias toward summary, headings, and actionable points rather than a raw transcript

If the target cannot be reached, return the Markdown anyway and state what blocked the sync.

### 5. Record gaps explicitly

If video access, transcription, or OCR is incomplete, note that clearly in the output. Provide the verified content first and mark unresolved portions separately instead of smoothing over the missing pieces.
