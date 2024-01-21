FROM node:alpine

ADD entrypoint.sh /entrypoint.sh
RUN npm install uglify-js csso -g
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]



