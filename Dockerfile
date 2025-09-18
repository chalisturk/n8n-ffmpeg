# n8n + ffmpeg
FROM n8nio/n8n:1.67.0

USER root
RUN apt-get update \
 && apt-get install -y --no-install-recommends ffmpeg \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Kalıcı çalışma klasörü
RUN mkdir -p /data && chown -R node:node /data

USER node
