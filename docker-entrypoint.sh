#!/bin/sh
set -eu

SERVER_BIN="/home/.openvscode-server/bin/openvscode-server"
HOST="0.0.0.0"
PORT="${PORT:-3000}"

if [ -n "${OPENVSCODE_CONNECTION_TOKEN:-}" ]; then
  SANITIZED_TOKEN="$(printf '%s' "${OPENVSCODE_CONNECTION_TOKEN}" | sed 's/[^0-9A-Za-z-]/-/g')"

  if [ -z "${SANITIZED_TOKEN}" ]; then
    SANITIZED_TOKEN="$(head -c 128 /dev/urandom | tr -dc '0-9A-Za-z' | head -c 32)"
  fi

  exec "${SERVER_BIN}" --host "${HOST}" --port "${PORT}" --connection-token "${SANITIZED_TOKEN}"
fi

exec "${SERVER_BIN}" --host "${HOST}" --port "${PORT}" --without-connection-token
