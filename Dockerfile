FROM debian:trixie-slim@sha256:b6e2a152f22a40ff69d92cb397223c906017e1391a73c952b588e51af8883bf8

RUN apt-get update && apt-get install -y \
    fluxbox \
    freerdp3-x11 \
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
