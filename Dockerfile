# FSI welcome page — static site, no app runtime.
# nginx-unprivileged runs as the non-root `nginx` user (FSI standard) on 8080.
FROM nginxinc/nginx-unprivileged:1.27-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY public/ /usr/share/nginx/html/

EXPOSE 8080
