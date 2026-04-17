#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 1 ]; then
  echo "Usage: copy_wechat_message.sh \"message text\"" >&2
  exit 1
fi

printf '%s' "$1" | pbcopy
