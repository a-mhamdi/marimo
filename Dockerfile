# Base image
FROM python:3.10.12

# Metadata
LABEL org.opencontainers.image.authors="A. Mhamdi"
LABEL version="latest"

ENV PATH="/marimo/.venv/bin":$PATH

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin

WORKDIR /marimo
COPY requirements.txt requirements.txt
RUN uv venv .venv
RUN uv pip install pip --upgrade
RUN uv pip install -r requirements.txt --upgrade
WORKDIR /marimo/work
 
# Expose 1357
EXPOSE 1357

# Default command
CMD ["marimo", "edit", "--port 1357", "--headless", "--no-token"]
