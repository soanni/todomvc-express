#!/bin/sh
TODOMVC_IP=$(docker inspect -f "{{.NetworkSettings.IPAddress}}" todomvc)
docker run -d -p 5858:5858 --name socat local/socat socat TCP-LISTEN:5858,fork TCP:${TODOMVC_IP}:4848
