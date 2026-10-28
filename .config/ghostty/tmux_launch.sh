#!/usr/bin/env bash
set -euo pipefail

# Ensure Homebrew bins are visible even in --noprofile/--norc shells
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

# Find tmux
TMUX_BIN="$(command -v tmux || true)"
if [[ -z "$TMUX_BIN" ]]; then
	echo "tmux not found in PATH. Install with: brew install tmux" >&2
	# Optional: fall back to a login shell so you at least get a terminal
	exec "$SHELL" -l
fi

SESSION_NAME="ghostty"

# Attach if session exists, otherwise create then attach
exec tmux new-session -A -s ghostty /opt/homebrew/bin/nu
