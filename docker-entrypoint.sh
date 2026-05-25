#!/bin/sh
set -eu

SERVER_BIN="/home/.openvscode-server/bin/openvscode-server"
HOST="0.0.0.0"
PORT="${PORT:-3000}"

if [ -n "${OPENVSCODE_CONNECTION_TOKEN:-}" ]; then
  case "${OPENVSCODE_CONNECTION_TOKEN}" in
    *[!0-9A-Za-z-]*)
      echo "OPENVSCODE_CONNECTION_TOKEN contains unsupported characters; deriving a compatible token value." >&2
      CONNECTION_TOKEN="$(printf '%s' "${OPENVSCODE_CONNECTION_TOKEN}" | sha256sum | awk '{print $1}')"
      ;;
    *)
      CONNECTION_TOKEN="${OPENVSCODE_CONNECTION_TOKEN}"
      ;;
  esac

  exec "${SERVER_BIN}" --host "${HOST}" --port "${PORT}" --connection-token "${CONNECTION_TOKEN}"
fi

exec "${SERVER_BIN}" --host "${HOST}" --port "${PORT}" --without-connection-token
