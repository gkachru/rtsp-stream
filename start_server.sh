#!/bin/bash
source docker.env

docker run -d \
        -v `pwd`/log:/var/log/rtsp-stream \
        -v `pwd`/videos:/tmp/videos \
        -v `pwd`/rtsp-stream.yml:/app/rtsp-stream.yml \
        -e RTSP_STREAM_AUTH_JWT_ENABLED=false \
        -e RTSP_STREAM_AUTH_JWT_SECRET="do-not-reveal-this" \
        -e RTSP_STREAM_AUTH_JWT_METHOD="secret" \
        -e RTSP_STREAM_CLEANUP_TIME=5m0s \
        -e RTSP_STREAM_STORE_DIR=/tmp/videos \
        -e RTSP_STREAM_AUDIO_ENABLED=false \
        -e RTSP_STREAM_PROCESS_LOGGING_ENABLED=false \
        -e RTSP_STREAM_PROCESS_LOGGING_DIR=/var/log/rtsp-stream \
        -e RTSP_STREAM_BLACKLIST_ENABLED=false \
        -e RTSP_STREAM_CORS_ENABLED=false \
        -e RTSP_STREAM_CORS_ALLOWED_ORIGINS="" \
        -e RTSP_STREAM_CORS_ALLOW_CREDENTIALS=false \
        -e RTSP_STREAM_CORS_MAX_AGE=0 \
        -e RTSP_STREAM_PORT=3080 \
        -p 8080:3080 \
        --name streamer \
        roverr/rtsp-stream:${DOCKER_VERSION}
