FROM node:24-bookworm-slim

WORKDIR /usr/src/app

RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*

COPY package.json package-lock.json ./

RUN npm install --production

COPY . .

EXPOSE 8080

CMD ["node", "index.js"]
