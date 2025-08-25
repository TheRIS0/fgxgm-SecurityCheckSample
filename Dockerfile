FROM node:24-bullseye-slim

WORKDIR /usr/src/app

COPY package.json package-lock.json ./

RUN npm install --production

COPY . .

EXPOSE 8080

CMD ["node", "index.js"]
