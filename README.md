# Marimo Docker Image

To install and run Marimo, follow these steps:
```zsh
uv pip venv .venv
source .venv/bin/activate
uv pip install pip --upgrade
uv pip install -r requirements.txt --upgrade
marimo edit --port 1357 --headless --no-token
```
In order to retrieve the docker image, type:
```zsh
docker pull abmhamdi/marimo
```
The steps below can be used to rebuild the docker image:
```zsh
docker build -t marimo:local .
docker run --rm -p 1357:1357 marimo:local
```
+ The server is accessible via port 1357;
+ No password is required.
