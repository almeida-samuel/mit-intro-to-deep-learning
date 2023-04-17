# syntax=docker/dockerfile:1.4
FROM python:3.11-slim

RUN mkdir /workspace
WORKDIR /workspace

RUN python -m pip install --upgrade pip
RUN pip install tensorflow==2.12.0 tensorflow-io==0.32.0
RUN pip install pandas

RUN useradd samuel --home /workspace --shell /bin/bash

COPY --chown=samuel:samuel ./ /workspace