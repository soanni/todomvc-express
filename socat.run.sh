#!/bin/sh
docker run -d --name socat-nid --network=container:todomvc local/socat socat TCP-LISTEN:4848,fork TCP:127.0.0.1:5858
