# 1) FFmpeg'in statik binarilerini indir (mimariden bağımsız)
FROM alpine:3.20 AS ff
RUN apk add --no-cache curl tar xz
ARG TARGETARCH
RUN set -eux; \
    case "$TARGETARCH" in \
      amd64)  ARCH=x86_64 ;; \
      arm64)  ARCH=aarch64 ;; \
      *) echo "unsupported arch: $TARGETARCH" && exit 1 ;; \
    esac; \
    curl -L -o /tmp/ffmpeg.tar.xz \
      https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-${ARCH}-static.tar.xz; \
    mkdir -p /ff && tar -C /ff -xf /tmp/ffmpeg.tar.xz --strip-components=1

# 2) n8n tabanına kopyala (tag: 1.109.2 veya latest)
FROM n8nio/n8n:1.109.2
USER root
COPY --from=ff /ff/ffmpeg  /usr/local/bin/ffmpeg
COPY --from=ff /ff/ffprobe /usr/local/bin/ffprobe
RUN chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe
USER node
