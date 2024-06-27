# Frontend Dockerfile
FROM nginx:latest
COPY . /usr/share/nginx/html

# Backend Dockerfile
FROM node:14
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8080
CMD ["node", "server.js"]

# Database Dockerfile
FROM mysql:5.7
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=mydatabase
COPY ./init.sql /docker-entrypoint-initdb.d/
EXPOSE 3306
