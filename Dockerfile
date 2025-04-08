FROM node:20-alpine AS builder

WORKDIR /app

RUN npm config set https-proxy http://proxy2.gld.hksarg:8080
RUN npm config set proxy http://proxy2.gld.hksarg:8080

COPY  . .
RUN npm ci
RUN npm run build


FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html

