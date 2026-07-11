# MediaMTX binary source.
# Pin the version so future releases do not unexpectedly change behavior.
FROM bluenviron/mediamtx:1.19.2 AS mediamtx

# Small runtime image with a trusted CA certificate bundle.
FROM alpine:3.21

RUN apk add --no-cache ca-certificates \
    && update-ca-certificates

# Copy the MediaMTX binary from the official image.
COPY --from=mediamtx /mediamtx /mediamtx

# Copy our configuration.
COPY mediamtx.yml /mediamtx.yml

ENTRYPOINT ["/mediamtx"]
