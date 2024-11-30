# Base image
FROM python:3.10.12

# Metadata
LABEL org.opencontainers.image.authors="A. Mhamdi"
LABEL version="latest"

SHELL [ "/bin/bash", "-c" ]

ENV NVM_DIR=/usr/local/nvm
ENV NODE_VERSION=22

# Create directory and install NVM
RUN mkdir -p ${NVM_DIR}
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

ENV PATH=/usr/local/nvm/versions/node/v22.11.0/bin:$PATH
ENV PATH=/marimo/.venv/bin:$PATH

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin

WORKDIR /marimo
COPY requirements.txt .
RUN uv venv .venv
RUN uv pip install pip --upgrade
RUN uv pip install -r requirements.txt --upgrade
WORKDIR /marimo/work
COPY .marimo.toml .

# Expose 1357
EXPOSE 1357

# Default command
CMD ["marimo", "edit", "--host", "0.0.0.0", "--port", "1357", "--headless", "--no-token"]
