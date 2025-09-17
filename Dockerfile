



# n8n with FFmpeg support
FROM n8nio/n8n:latest

# Switch to root to install packages
USER root

# Install FFmpeg (Alpine Linux)
RUN apk update && \
    apk add --no-cache ffmpeg && \
    which ffmpeg && \
    ffmpeg -version

# Create symlink for compatibility
RUN ln -sf $(which ffmpeg) /usr/local/bin/ffmpeg

# Switch back to n8n user
USER node

# Verify installation
RUN /usr/local/bin/ffmpeg -version
