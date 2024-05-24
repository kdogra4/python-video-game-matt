# Use the specified Nginx image
FROM docker.io/library/nginx@sha256:af296b188c7b7df99ba960ca614439c99cb7cf252ed7bbc23e90cfda59092305

# Install Python and other essentials
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    curl

# Set the working directory in the container for the Python application
WORKDIR /usr/src/app

# Copy the Python application and requirements
COPY . .

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Remove the default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy a new Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Make port 80 available to the world outside this container
EXPOSE 80

# Start Nginx and keep it running in the foreground while running the Python script
CMD ["sh", "-c", "nginx && python3 Spongebob.py"]