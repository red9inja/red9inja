# Use Alpine as the base image
FROM nginx:alpine

# Install supervisor to manage processes
RUN apk add --no-cache supervisor 

# Create directories for supervisor and Nginx configuration
RUN mkdir -p /etc/supervisor/conf.d /var/www/html

# Copy Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy Supervisor configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Copy your PHP files to the web root (if any)
COPY index.html /var/www/html

# Expose port 80
EXPOSE 80

# Start supervisord
ENTRYPOINT ["/usr/bin/supervisord"]
