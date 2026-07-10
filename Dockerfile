# MediaMTX media server for Atlas live video.
# Ingests RTMP (TLS terminated by Fly.io) and republishes as WebRTC/WHEP.
# No transcoding — H.264 is copied straight through, so the ffmpeg-less
# image is enough and keeps the container tiny.
FROM bluenviron/mediamtx:latest

# Our configuration (auth hook, RTMP + WebRTC/TCP-only, dynamic paths).
COPY mediamtx.yml /mediamtx.yml

# The base image entrypoint is /mediamtx which reads /mediamtx.yml by default.
