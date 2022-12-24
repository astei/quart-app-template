FROM python:3.11.1-slim AS base
WORKDIR /app

ENV POETRY_VERSION=1.3.1
ENV APP_ENV=development

FROM base as builder

ENV PIP_DEFAULT_TIMEOUT=100 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1 \
    POETRY_VERSION=1.3.1
RUN pip install "poetry==$POETRY_VERSION"
RUN python -m venv /app/venv

COPY pyproject.toml poetry.lock ./
RUN poetry export -f requirements.txt | /app/venv/bin/pip install -r /dev/stdin

COPY . .
RUN poetry build && /app/venv/bin/pip install dist/*.whl

FROM base as app

EXPOSE 5000

COPY --from=builder /app/venv /app/venv
COPY docker-entrypoint.sh ./
CMD ["./docker-entrypoint.sh"]
