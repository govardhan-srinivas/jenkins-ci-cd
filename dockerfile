# Use the official Nginx image
FROM nginx:alpine

# Copy the Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the Angular build files to the Nginx HTML directory
COPY dist/test-app /usr/share/nginx/html

# Expose port 80
EXPOSE 8080
