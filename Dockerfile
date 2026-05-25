FROM gitpod/openvscode-server:latest

USER openvscode-server

ENTRYPOINT ["/bin/sh", "-c", "if [ -n \"${OPENVSCODE_CONNECTION_TOKEN:-}\" ]; then exec /home/.openvscode-server/bin/openvscode-server --host 0.0.0.0 --port \"${PORT:-3000}\" --connection-token \"${OPENVSCODE_CONNECTION_TOKEN}\"; else exec /home/.openvscode-server/bin/openvscode-server --host 0.0.0.0 --port \"${PORT:-3000}\" --without-connection-token; fi"]
