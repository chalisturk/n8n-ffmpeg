# n8n + ffmpeg (Debian veya Alpine tabanı ile uyumlu)
FROM n8nio/n8n:latest

# ffmpeg, libass ve fontlar (hard-subtitle için gerekli)
USER root
RUN if command -v apt-get >/dev/null 2>&1; then \
      apt-get update && \
      apt-get install -y --no-install-recommends ffmpeg fonts-dejavu libass9 fontconfig && \
      rm -rf /var/lib/apt/lists/*; \
    else \
      apk add --no-cache ffmpeg libass ttf-dejavu fontconfig; \
    fi

# normal kullanıcıya dön
USER node

ENV N8N_PORT=5678
EXPOSE 5678
