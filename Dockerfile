# Alpine is a very small Linux image.
FROM python:3-alpine

# The Author.
LABEL maintainer="docker@tiv.net"

# Argument's default values. See the `--build-arg` build parameter in package.json.
ARG version=NO_VERSION
ARG description=NO_DESCRIPTION

# Tell Python to install the required packages.
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

# Copy the application code to the image.
COPY app /app

# Store the ARG values in template files.
RUN echo ${version} > /app/templates/version.txt
RUN echo ${description} > /app/templates/description.txt

# SECURITY WARNING: You are building a Docker image from Windows against a non-Windows Docker host. All files and directories added to build context will have '-rwxr-xr-x' permissions. It is recommended to double check and reset permissions for sensitive files and directories.
# 1. Reset the "others" permission on folders.
RUN find /app -type d -exec chmod 750 \{\} \;
# 2. Reset the executable flag on files.
RUN find /app -type f -exec chmod 640 \{\} \;

# The default working directory for running binaries within a container.
WORKDIR /app

# The port number the container should expose. That's the default Flask port.
EXPOSE 5000

# Start the application.
CMD ["python", "./app.py"]
