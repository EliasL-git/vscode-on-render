FROM gitpod/openvscode-server:latest

USER openvscode-server

ENTRYPOINT ["/bin/sh", "-c", "exec /home/.openvscode-server/bin/openvscode-server --host 0.0.0.0 --port \"${PORT:-3000}\" --without-connection-token"]
