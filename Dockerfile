FROM node:alpine

ADD entrypoint.sh /opt/app/entrypoint.sh
RUN npm install minify -g
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]



