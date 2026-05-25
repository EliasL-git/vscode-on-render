# Gitpod's OpenVSCode Server
Deploy Gitpod's VSCode Webserver on Render

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

Enjoy!

`OPENVSCODE_CONNECTION_TOKEN` is preconfigured in `render.yaml` with `generateValue: true`, so new Render deployments get a random connection token by default.
You can override this environment variable in Render if you want to set your own token value.
At startup, token values are sanitized to characters supported by OpenVSCode (`0-9`, `a-z`, `A-Z`, `-`) to prevent boot failures from incompatible generated values.
