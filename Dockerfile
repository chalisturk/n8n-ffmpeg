# 1) Statik FFmpeg indir (amd64/arm64 destekli)
FROM alpine:3.20 AS ff
RUN apk add --no-cache curl tar xz
ARG TARGETARCH
RUN set -eux; \
    case "$TARGETARCH" in \
      amd64) ARCH=amd64 ;; \
      arm64) ARCH=arm64 ;; \
      *) echo "unsupported arch: $TARGETARCH" && exit 1 ;; \
    esac; \
    URL="https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-${ARCH}-static.tar.xz"; \
    echo "Downloading ${URL}"; \
    curl -fL "$URL" -o /tmp/ffmpeg.tar.xz; \
    tar -C /tmp -xf /tmp/ffmpeg.tar.xz; \
    DIR="$(find /tmp -maxdepth 1 -type d -name 'ffmpeg-*' | head -n1)"; \
    install -m0755 "$DIR/ffmpeg"  /ffmpeg; \
    install -m0755 "$DIR/ffprobe" /ffprobe;

# 2) n8n tabanına kopyala
FROM n8nio/n8n:1.109.2
USER root
COPY --from=ff /ffmpeg  /usr/local/bin/ffmpeg
COPY --from=ff /ffprobe /usr/local/bin/ffprobe
RUN chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe
USER node
