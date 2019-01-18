from alpine:latest

# Install IP Tables
RUN apk update > /dev/null && apk add -u iptables --no-cache > /dev/null

# Copy Startup Script
COPY start.sh /start.sh

# Run script
CMD [ "/start.sh" ]