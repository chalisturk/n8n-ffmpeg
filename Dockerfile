# n8n resmi imajından başlayın (Debian tabanlı)
FROM n8nio/n8n:latest

# ffmpeg ve altyazı için libass + temel fontlar
USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg fonts-dejavu libass9 && \
    rm -rf /var/lib/apt/lists/*

# n8n varsayılan kullanıcıya dön
USER node

# n8n veri klasörü (Coolify volume buraya bağlayacağız)
ENV N8N_PORT=5678
EXPOSE 5678
