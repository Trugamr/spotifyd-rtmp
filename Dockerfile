FROM ubuntu:jammy as base
# Install required dependencies
RUN apt update
RUN apt install -y pulseaudio alsa-utils socat ffmpeg curl supervisor
# Create non root user
RUN useradd -ms /bin/bash bubble
USER bubble
# Download and setup spotifyd
WORKDIR /app
RUN curl -L https://github.com/spotifyd/spotifyd/releases/download/v0.3.4/spotifyd-linux-slim.tar.gz -o spotifyd.tar.gz
RUN tar -xvf spotifyd.tar.gz
# Copy startup script
COPY --chown=bubble:bubble --chmod=744 scripts ./scripts
COPY --chown=bubble:bubble supervisord.conf .
# Run start script
ENTRYPOINT [ "supervisord", "-c", "/app/supervisord.conf" ]