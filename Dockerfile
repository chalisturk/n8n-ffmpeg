# n8n + ffmpeg (Debian veya Alpine tabanı ile uyumlu)
FROM docker.n8n.io/n8nio/n8n:1.109.2

# ffmpeg, libass ve fontlar (hard-subtitle için gerekli)
USER root
RUN apk add --no-cache ffmpeg libass ttf-dejavu fontconfig; \

# normal kullanıcıya dön
USER node

ENV N8N_PORT=5678
EXPOSE 5678
