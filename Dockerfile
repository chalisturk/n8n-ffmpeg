# n8n + ffmpeg (Alpine taban)
FROM n8nio/n8n:1.67.0

USER root
RUN apk add --no-cache ffmpeg

# Kalıcı çalışma klasörü
RUN mkdir -p /data && chown -R node:node /data

USER node
