FROM debian:bookworm-slim@sha256:f06537653ac770703bc45b4b113475bd402f451e85223f0f2837acbf89ab020a

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
