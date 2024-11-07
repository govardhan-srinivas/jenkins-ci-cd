# use a node image as the base image and name it 'build' for
FROM node:22.11-alpine3.19 as build

# set the working directory to /app
WORKDIR /app

# Copy only package.json and package-lock.json first
COPY package*.json ./

# Install dependencies
RUN npm ci --force

# Now copy the rest of the application code
COPY . .

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

CMD ["nginx", "-g", "daemon off;"]