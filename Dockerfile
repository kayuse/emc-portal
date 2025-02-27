#!/bin/bash

#stage 1
FROM node:12.22.12 as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine
COPY --from=node /app/dist/ /usr/share/nginx/html
COPY /nginx.conf  /etc/nginx/conf.d/default.conf