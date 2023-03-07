FROM ubuntu:jammy as base
# Install required dependencies
RUN apt update
RUN apt install -y pulseaudio alsa-utils socat ffmpeg curl
# Create new user
RUN useradd -ms /bin/bash streamer
USER streamer
# Download and setup spotifyd
WORKDIR /app
RUN curl -L https://github.com/Spotifyd/spotifyd/releases/download/v0.3.4/spotifyd-linux-slim.tar.gz -o spotifyd.tar.gz
RUN tar -xvf spotifyd.tar.gz
# Copy startup script
COPY --chown=streamer:streamer --chmod=744 start.sh .
# Run start script
ENTRYPOINT [ "/app/start.sh" ]