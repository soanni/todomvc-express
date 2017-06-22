FROM alpine:3.5

RUN apk add --no-cache nodejs-current tini
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ARG NODE_ENV
ENV NODE_ENV ${NODE_ENV:-production}

COPY package.json /usr/src/app/
RUN npm config set depth 0 && \
    npm install && \
    npm cache clean && \
    rm -rf /tmp/*

COPY . /usr/src/app
EXPOSE 3000
ENTRYPOINT ["/sbin/tini", "--"]

CMD ["npm", "start"]

ARG VCS_REF="local"
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/soanni/todomvc-express"
