FROM docker.n8n.io/n8nio/n8n:1.111.1
USER root
# İmaj Alpine, apk var; Debian olsaydı apt kullanırdık. Bu tek satır ikisini de kapsar.
RUN if command -v apk >/dev/null 2>&1; then \
      apk add --no-cache ffmpeg wget ca-certificates && update-ca-certificates; \
    else \
      apt-get update && apt-get install -y --no-install-recommends ffmpeg wget ca-certificates && rm -rf /var/lib/apt/lists/*; \
    fi
USER node
