

# n8n sürümünü seninle aynı tut: 1.111.1 örnek
FROM docker.n8n.io/n8nio/n8n:1.109.2

# n8n imajı Debian/Ubuntu tabanlıdır, apt çalışır
USER root
RUN apt-get update \
 && apt-get install -y --no-install-recommends ffmpeg \
 && rm -rf /var/lib/apt/lists/*

# n8n yine node (1000) ile çalışsın
USER node
ENV N8N_PORT=5678
EXPOSE 5678
