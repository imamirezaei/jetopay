# مرحله بیلد
FROM node:18 AS builder
WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY . .
RUN npm run build

# مرحله اجرا
FROM node:18
WORKDIR /app

COPY --from=builder /app/dist ./dist
COPY package.json package-lock.json ./
RUN npm install --omit=dev

CMD ["node", "dist/main.js"]