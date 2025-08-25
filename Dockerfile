FROM node:24-bookworm-slim

WORKDIR /usr/src/app

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        zlib1g zlib1g-dev \
        libpam-modules libpam-modules-bin && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*

COPY package.json package-lock.json ./

RUN npm install --production

COPY . .

EXPOSE 8080

CMD ["node", "index.js"]
