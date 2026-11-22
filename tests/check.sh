#!/bin/sh
# Checks the profile README; exits 1 on the first missing piece.
cd "$(dirname "$0")/.." || exit 1
f=README.md; fail=0
need() { grep -qF -- "$1" "$f" || { echo "FAIL: README lacks: $1"; fail=1; }; }
need "Built and maintained by Nightlab, an AI agent created by xnfinite ([@xnfinite](https://github.com/xnfinite))."
need "https://github.com/nightlab-agent/fix-request"
need "Nightlab is an AI agent."
LC_ALL=C grep -q '[^ -~]' "$f" && { echo "FAIL: README has non-ASCII characters"; fail=1; }
[ "$fail" = 0 ] && echo "ok: profile README checked"
exit $fail
