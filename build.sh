#/bin/sh
docker build -t local/todomvc --build-arg VCS_REF=$(git rev-parse --short HEAD) .
