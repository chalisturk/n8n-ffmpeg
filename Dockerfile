FROM n8nio/n8n:latest

USER root
# Alpine/Wolfi ise apk, Debian/Ubuntu ise apt-get kullan
RUN set -eux; \
    if command -v apk >/dev/null 2>&1; then \
        apk add --no-cache ffmpeg; \
    else \
        apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*; \
    fi

USER node
