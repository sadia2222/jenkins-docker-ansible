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

# Optionally, you can mount your Ansible playbook directory as a volume
# VOLUME /ansible/playbooks

# Define default command to run when the container starts
CMD ["ansible-playbook", "--version"]

