FROM centos:7
MAINTAINER ali.lotfi.linux@gmail.com

# Install necessary packages
RUN yum install -y httpd \
    zip \
    unzip

# Copy the local photogenic.zip file into the container
COPY photogenic.zip /tmp/

# Extract the contents of photogenic.zip
RUN unzip /tmp/photogenic.zip -d /var/www/html/

# Remove the temporary zip file
RUN rm /tmp/photogenic.zip

# Set the working directory
WORKDIR /var/www/html/

# Start Apache in the foreground when the container starts
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80
