#!/bin/sh
docker run -d -p 3000:3000 --name todomvc local/todomvc node src/start.js
