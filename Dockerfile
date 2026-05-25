FROM gitpod/openvscode-server:latest

USER openvscode-server

COPY --chown=openvscode-server:openvscode-server docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
