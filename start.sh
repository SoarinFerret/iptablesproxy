#!/bin/sh

if [ -z "$SERVERIP" -o -z "$SERVERPORT" -o -z "$HOSTPORT" ]; then
  echo "Variables SERVERIP, SERVERPORT, and HOSTPORT must be set."; exit;
fi

# Create Rules to forward Traffic
iptables -t nat -A PREROUTING -p tcp --dport ${HOSTPORT} -j DNAT --to-destination  ${SERVERIP}:${SERVERPORT}
iptables -t nat -A POSTROUTING -j MASQUERADE

# Setup masquerade, to allow using the container as a gateway
for iface in $(ip a | grep eth | grep inet | awk '{print $2}'); do
  iptables -t nat -A POSTROUTING -s "$iface" -j MASQUERADE
done

while [ true ]; do
    sleep 3600;
done