FROM nginx:alpine

COPY . /usr/share/nginx/html

EXPOSE 80

FROM mariadb:latest

COPY messal-guillaume_cinema.sql /docker-entrypoint-initdb.d/

EXPOSE 3306