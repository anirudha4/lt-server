FROM node:16-alpine

WORKDIR /app

COPY package.json /app/
COPY yarn.lock /app/

RUN yarn install --production && yarn cache clean

COPY . /app

ENV NODE_ENV production
ENTRYPOINT ["sh", "-c", "node -r esm ./bin/server --port ${PORT:-3000} --domain ${DOMAIN:-localhost}"]
