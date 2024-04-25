# Use a base image with Python installed
FROM python:3.9

# Install Ansible and any other dependencies
RUN pip install ansible

# Set the entrypoint to the Ansible command
ENTRYPOINT ["ansible"]
