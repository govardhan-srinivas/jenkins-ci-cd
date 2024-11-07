# use a node image as the base image and name it 'build' for
FROM node:18.18-alpine3.18 as build
# set the working directory to /app
WORKDIR /app
# copy the current directory contents into the container at /app
COPY . .
# install dependencies, matching package-lock.json
RUN npm i
# build the app
RUN npm run build


# Use the latest version of the official Nginx image as the base image
FROM nginx:latest
# copy the custom nginx configuration file to the container in the default
COPY nginx.conf /etc/nginx/nginx.conf
# copy the built application from the build stage to the nginx html 
COPY --from=build /app/dist/test-app /usr/share/nginx/html
# Expose port 80
EXPOSE 80
