# Gitpod's OpenVSCode Server
Deploy Gitpod's VSCode Webserver on Render

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

Enjoy!

`OPENVSCODE_CONNECTION_TOKEN` is preconfigured in `render.yaml` with `generateValue: true`, so new Render deployments get a random connection token by default.
You can override this environment variable in Render if you want to set your own token value.
At startup, token values that include unsupported characters are deterministically converted to a SHA-256 hex token so OpenVSCode accepts them and startup does not fail.
