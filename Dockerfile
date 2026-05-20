FROM debian:bookworm-slim@sha256:0104b334637a5f19aa9c983a91b54c89887c0984081f2068983107a6f6c21eeb

RUN apt-get update && apt-get install -y \
    fluxbox \
    freerdp2-x11 \
    novnc \
    supervisor \
    x11vnc \
    xvfb \
    && apt-get clean

COPY ./supervisord/conf.d/* /app/conf.d/
COPY ./supervisord/supervisord.conf /app/supervisord.conf

COPY ./docker-entrypoint.sh /

ENV DISPLAY=":0.0" \
    DISPLAY_WIDTH="1024" \
    DISPLAY_HEIGHT="768" \
    RDP_PORT="3389" \
    RDP_ARGUMENTS="/cert:ignore /dynamic-resolution"

ENTRYPOINT ["/docker-entrypoint.sh"]
