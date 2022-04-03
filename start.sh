#!/bin/sh


# refer to https://tailscale.com/kb/1107/heroku/



#/app/tailscaled --tun=userspace-networking --socks5-server=localhost:1055 & \
#/app/tailscale down & \
#/app/tailscale up --authkey=${TAILSCALE_AUTH_KEY} --hostname=heroku-app --advertise-exit-node & \
#/app/tailscale status

/app/tailscaled --tun=userspace-networking --socks5-server=localhost:1055 &
until /app/tailscale up --authkey=${TAILSCALE_AUTH_KEY} --hostname=heroku-app --advertise-exit-node
do
    sleep 30
done

echo Tailscale started

ALL_PROXY=socks5://localhost:1055/

sleep infinity

#while true; do foo; sleep 100; done

#https://forum.tailscale.com/t/create-exit-node-on-railway-app/1837/4
