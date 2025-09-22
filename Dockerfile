FROM docker.n8n.io/n8nio/n8n:1.111.1
USER root
RUN apt-get update \
 && apt-get install -y --no-install-recommends ffmpeg wget ca-certificates \
 && rm -rf /var/lib/apt/lists/*
USER node
