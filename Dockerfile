# Use a base image with Python pre-installed
FROM python:3.9-slim

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ansible \
    && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /ansible

# Expose port for HTTP
EXPOSE 80

# Define default command to run when the container starts
CMD ["bash"]
