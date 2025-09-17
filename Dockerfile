FROM n8nio/n8n:1.109.2-alpine
USER root
RUN apk add --no-cache ffmpeg
USER node
