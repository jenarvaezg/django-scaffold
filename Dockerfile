FROM python:3-slim

ENV HOMEDIR=/app/ \
  TERM=vt100 \
  C_FORCE_ROOT=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONPATH=/app

ARG ENV

WORKDIR $HOMEDIR

RUN apt-get update -y --fix-missing \
  && apt-get clean \
  && apt-get install -y --no-install-recommends git  make wait-for-it \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir --upgrade pip poetry \
  && poetry config virtualenvs.create false

COPY src/pyproject.toml $HOMEDIR/pyproject.toml
COPY src/poetry.lock poetry.lock
RUN if [ "$ENV" = "local" ] ; then poetry install ; else poetry install --no-dev ; fi

COPY src $HOMEDIR
EXPOSE 80
