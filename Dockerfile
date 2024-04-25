FROM centos:7

# Install Apache
RUN yum install -y httpd

# Copy HTML file into the container
COPY index.html /var/www/html/

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Apache service
CMD ["httpd", "-D", "FOREGROUND"]


