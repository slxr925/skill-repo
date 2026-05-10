---
name: codex-macos-local-http-proxy-reconnect
description: Use when Codex Desktop on macOS keeps reconnecting and you need to route it through a local HTTP proxy such as Loon by writing ~/.codex/.env and launching Codex with explicit proxy settings.
---

# Codex macOS Local HTTP Proxy Reconnect

## Overview

Use this skill when Codex Desktop on macOS is stuck in repeated `reconnecting` states and the fix is to route traffic through a local HTTP proxy. The goal is not generic networking help; it is a reproducible bootstrap:

- discover the working local proxy endpoint
- write the proxy configuration into `~/.codex/.env`
- launch Codex with explicit proxy settings
- verify the proxy path before treating the fix as complete

## When to Use

Use this skill when:

- Codex Desktop on macOS cannot stay connected
- the user already runs a local proxy app such as Loon
- the user wants Codex to use the proxy consistently, not just once
- the current `~/.codex/.env` is missing or incomplete

Do not use this skill when:

- the platform is not macOS
- there is no local HTTP proxy to route through
- the problem is clearly account/authentication, not networking
- the user only wants a general proxy explanation without changing Codex startup

## Workflow

### 1. Confirm the target platform

This workflow is macOS-specific. If the user is on Windows, do not blindly reuse the macOS launch path or the `Codex.app` bundle path.

### 2. Find the local proxy endpoint

Prefer the proxy app's own UI or configuration first.

For Loon-like setups, look for:

- the local HTTP or HTTPS listen port
- the loopback address, usually `127.0.0.1`
- whether the app exposes a SOCKS port as well

Do not invent a port. If the proxy endpoint cannot be confirmed, stop and ask for the exact local proxy address.

### 3. Write `~/.codex/.env`

Create or update `~/.codex/.env` with both uppercase and lowercase proxy variables so Codex, Electron, Node, and shell-launched tools can all see the same endpoint.

Use this shape:

```bash
HTTP_PROXY=http://127.0.0.1:7222
HTTPS_PROXY=http://127.0.0.1:7222
ALL_PROXY=http://127.0.0.1:7222
http_proxy=http://127.0.0.1:7222
https_proxy=http://127.0.0.1:7222
all_proxy=http://127.0.0.1:7222
NO_PROXY=localhost,127.0.0.1,::1
no_proxy=localhost,127.0.0.1,::1
```

Rules:

- merge with existing content rather than wiping unrelated settings
- keep the proxy URL consistent across all variables
- include loopback bypass entries so local services are not routed back through the proxy

### 4. Launch Codex with explicit proxy settings

When the app is started from a shell, pass the proxy through the environment and the app-level flag when available.

Template:

```bash
nohup env HTTP_PROXY=http://127.0.0.1:7222 HTTPS_PROXY=http://127.0.0.1:7222 ALL_PROXY=http://127.0.0.1:7222 NO_PROXY=localhost,127.0.0.1,::1 /Applications/Codex.app/Contents/MacOS/Codex --proxy-server="http://127.0.0.1:7222" --proxy-bypass-list="<local>;127.0.0.1;localhost;::1" >/tmp/codex-proxy.log 2>&1 &
```

Adjust the path if the app bundle is installed elsewhere.

### 5. Verify the path, not the guess

Treat the fix as complete only when one of these is true:

- Codex stops cycling through `reconnecting`
- a network request through the same proxy returns the expected auth response, such as `401` from the OpenAI endpoint
- the configured proxy endpoint matches the one discovered from the proxy app

If the result still looks unstable:

1. Re-check the proxy port
2. Re-check `~/.codex/.env`
3. Re-launch Codex from a clean process
4. Confirm the proxy app is still running and listening on the same port

## Failure Handling

- If the proxy tool only exposes SOCKS and not HTTP, do not write an HTTP URL unless the app also publishes one.
- If `~/.codex/.env` already contains settings, preserve them unless they conflict with the proxy variables.
- If the app keeps reconnecting after the proxy is set, do not claim success until the network path is validated.

## Notes

- This skill is intentionally narrow: it covers the reliable bootstrap path for macOS Codex reconnect issues.
- If the user needs a cross-platform proxy setup, split the Windows and macOS behaviors into separate workflows rather than pretending the launch paths are identical.

