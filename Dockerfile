FROM debian:bookworm-slim@sha256:4724b8cc51e33e398f0e2e15e18d5ec2851ff0c2280647e1310bc1642182655d

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
