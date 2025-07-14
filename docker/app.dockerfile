#syntax=docker/dockerfile-upstream:1.4.0-rc1
ARG BASE=base
FROM ${BASE}

WORKDIR /src
ADD ["package.json", "package-lock.json", "/src/"]
RUN npm install --omit=dev
ADD [".", "/src/"]

EXPOSE 9000
ENV CONFIG_PORT=4002 \
    CONFIG_KETCHER_URL=http://localhost:4002 \
    CONFIG_MIN_WORKERS=1 \
    CONFIG_MAX_WORKERS=4

CMD [ "node", "app.js" ]
