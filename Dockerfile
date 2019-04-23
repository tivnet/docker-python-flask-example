FROM python:3-alpine

LABEL maintainer="docker@tiv.net"

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

COPY app /app

WORKDIR /app

# tell the port number the container should expose
EXPOSE 5000

# run the command
CMD ["python", "./app.py"]
