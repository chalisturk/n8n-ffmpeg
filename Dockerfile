

FROM docker.n8n.io/n8nio/n8n:1.109.2

# Paket kurarken root ol
USER root

# FFmpeg ve altyazı fontları (ASS için) — tek satır, \ yok
RUN apk add --no-cache ffmpeg libass ttf-dejavu fontconfig

# n8n default kullanıcıya geri dön
USER node
ENV N8N_PORT=5678
EXPOSE 5678
