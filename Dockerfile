from alpine:latest

# Copy Startup Script
COPY start.sh /start.sh

# Install IP Tables & fix permissions
RUN apk update > /dev/null && \
    apk add -u iptables --no-cache > /dev/null && \
    chmod +x /start.sh

# Run script
CMD [ "/start.sh" ]
