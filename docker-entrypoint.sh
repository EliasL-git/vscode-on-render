#!/bin/sh
set -eu

SERVER_BIN="/home/.openvscode-server/bin/openvscode-server"
HOST="0.0.0.0"
PORT="${PORT:-3000}"

if [ -n "${OPENVSCODE_CONNECTION_TOKEN:-}" ]; then
  if printf '%s' "${OPENVSCODE_CONNECTION_TOKEN}" | grep -Eq '^[0-9A-Za-z-]+$'; then
    CONNECTION_TOKEN="${OPENVSCODE_CONNECTION_TOKEN}"
  else
    echo "OPENVSCODE_CONNECTION_TOKEN contains unsupported characters; deriving a compatible token value." >&2
    if command -v sha256sum >/dev/null 2>&1; then
      CONNECTION_TOKEN="$(printf '%s' "${OPENVSCODE_CONNECTION_TOKEN}" | sha256sum | awk '{print $1}')"
    else
      CONNECTION_TOKEN="$(printf '%s' "${OPENVSCODE_CONNECTION_TOKEN}" | sed 's/[^0-9A-Za-z-]/-/g')"
    fi
  fi

  exec "${SERVER_BIN}" --host "${HOST}" --port "${PORT}" --connection-token "${CONNECTION_TOKEN}"
fi

exec "${SERVER_BIN}" --host "${HOST}" --port "${PORT}" --without-connection-token
