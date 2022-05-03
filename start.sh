#!/bin/sh

/app/tailscaled --tun=userspace-networking --socks5-server=localhost:1055 &
until /app/tailscale up --authkey=${TAILSCALE_AUTH_KEY} --hostname=dotts-heroku --accept-routes --accept-dns
do
    sleep 30
done

export ALL_PROXY=socks5://localhost:1055/
