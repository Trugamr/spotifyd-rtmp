# Streaming Spotify to an RTMP Server

This repository allows you to stream Spotify music to an RTMP server, enabling public access to your favorite tunes. We'll explore how to set up a Docker container to run `spotifyd` and stream the audio using `pulseaudio` and `ffmpeg` to send the output to an RTMP server.

### Example using Docker Compose

In the `examples/public-stream` directory, you'll find an example `docker-compose.yml` file that demonstrates how to run two services:

1. `ossrs/srs`: An RTMP server Docker image that accepts incoming streams.
2. `spotifyd-rtmp`: A custom image that runs `spotifyd` and streams the pulseaudio sink output to the RTMP server.

### What is this for?

By creating a public stream, you can share your Spotify music with others. In my case, I use this to create a public stream for a Discord music bot.

### Room for Improvement

There are many ways to enhance this project:

1. **Stability**: Improve the stability of the streaming process.
2. **Docker Image Size**: Optimize the Docker image size to reduce storage requirements.
3. **Latency**: Reduce the latency of the final stream for a more seamless listening experience.
