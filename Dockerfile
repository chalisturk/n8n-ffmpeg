FROM n8nio/n8n:latest

USER root

# FFmpeg ve gerekli araçları kur
RUN apk update && \
    apk add --no-cache \
    ffmpeg \
    mediainfo \
    python3 \
    py3-pip

USER node

EXPOSE 5678

CMD ["n8n"]
