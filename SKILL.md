---
name: wechat-computer-use-send-message
description: Use when operating WeChat on macOS through computer-use, especially to find a chat and send a message reliably, or when Chinese text entry fails and clipboard-based paste/send is needed.
---

# WeChat Message Sending via Computer Use

## Overview

Use this skill to send WeChat messages on macOS through the `computer use` tools with the highest practical reliability found in live testing.

Prefer a conservative flow: verify the WeChat window, confirm the exact outgoing text, target the correct chat, then use clipboard paste plus keyboard send. Treat direct Chinese typing as unreliable unless it has already been proven to work in the current session.

## When to Use

Use this skill when:

- Operating desktop WeChat through `mcp__computer_use__` tools
- Sending a real message to a named contact or group
- Chinese text does not appear in the input box when using `type_text`
- The app state must be re-synced before another action
- Reliability matters more than elegance

Do not use this skill when:

- A direct local API or first-party integration is available
- The task requires impersonation, harassment, threats, or other disallowed content
- Login, payment, or other high-risk confirmations are involved and the user has not explicitly approved the action

## Proven Findings

The following behaviors were observed during live interaction with desktop WeChat:

- `get_app_state` works reliably when using the bundle id `com.tencent.xinWeChat`
- Direct `type_text` can work for plain English
- Direct `type_text` for Chinese may fail silently: the caret appears in the input area, but the text never lands
- Coordinate clicks can fail with `AXError.notImplemented`, so avoid depending on click-based focus unless necessary
- AppleScript-only attempts to activate WeChat, paste, and press Return may succeed at the OS level but still fail to place text into the chat box
- The reliable path was:
  1. Copy the exact message into the macOS clipboard
  2. Confirm WeChat is already focused on the intended chat
  3. Use `press_key` with `super+v`
  4. Verify the message appears in the input box
  5. Use `press_key` with `Return`
  6. Verify the bubble appears in the conversation
- If `press_key` reports that the app changed, call `get_app_state` again before continuing

## Default Workflow

### 1. Confirm the outbound content

Before transmitting a real message to another person, confirm the exact text to send. If the user says "send option 2" or similar, restate the final sentence before sending.

### 2. Sync WeChat state

Read the latest WeChat window using:

- `mcp__computer_use__.get_app_state` with `app: "com.tencent.xinWeChat"`

Check that:

- The correct chat title is visible
- The conversation looks current
- The input box is available

### 3. Choose the input method

Use the following order:

1. For short English text, `type_text` is acceptable
2. For Chinese text, prefer clipboard paste first
3. Fall back to direct typing only if clipboard paste is unavailable

### 4. Put the message on the clipboard

Use the bundled script:

- `scripts/copy_wechat_message.sh "message text"`

This copies the exact UTF-8 string into the macOS clipboard with no extra newline.

### 5. Paste into WeChat

Send:

- `mcp__computer_use__.press_key` with `key: "super+v"`

If the tool says the app changed, immediately re-run `get_app_state` and then retry paste.

### 6. Verify before sending

Do not press Return until the message is visibly present in the input area. This is the key guardrail discovered in testing.

### 7. Send and verify delivery

Send:

- `mcp__computer_use__.press_key` with `key: "Return"`

Then re-check the window and verify that the message appears as a sent bubble in the conversation.

## Chat Targeting

If the intended chat is not already open:

1. Sync app state
2. Use the visible WeChat UI to select the target conversation if already present in the sidebar
3. If search is required, use the search field only after confirming the current UI layout from `get_app_state`
4. After opening the chat, re-sync state before pasting

When multiple contacts have similar names, pause and confirm which conversation to use before sending.

## Failure Recovery

If text does not appear after paste:

1. Re-sync with `get_app_state`
2. Confirm WeChat is still frontmost and the same chat is selected
3. Retry `super+v`
4. If still absent, do not claim success

If direct typing partially works:

- Do not mix typing methods mid-message unless the visible input box proves the text is present

If a message is sent successfully:

- Report the exact text that was sent
- Optionally mention any visible reply, but only if actually observed in the conversation

## Common Mistakes

- Assuming `type_text` works for Chinese because it worked for English
- Assuming a successful AppleScript process means the message reached the chat box
- Sending before visually checking the draft in the input box
- Continuing after a "user changed app" warning without refreshing state
- Claiming a message was sent when only the clipboard changed

## Quick Reference

- Bundle id: `com.tencent.xinWeChat`
- Reliable Chinese send path: clipboard -> `super+v` -> verify draft -> `Return`
- Re-sync trigger: any app-change warning or suspicious UI mismatch
- Success criterion: sent bubble visible in the conversation

## Bundled Resource

- `scripts/copy_wechat_message.sh`: Copy an exact message into the macOS clipboard for later paste into WeChat
