FROM nginx:1.23.1-alpine
ARG PIGGYS_BUILD_SHA
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY /dist/wallet-ui /usr/share/nginx/html
RUN grep -rl "PIGGYS_BUILD_SHA" /usr/share/nginx/html | xargs sed -i "s/PIGGYS_BUILD_SHA/${UK_BUILD_SHA}/g" && grep -rl "PIGGYS_BUILD_TIMESTAMP" /usr/share/nginx/html | xargs sed -i "s/PIGGYS_BUILD_TIMESTAMP/$(date '+%Y-%B-%d %H:%M:%S %Z')/g"
