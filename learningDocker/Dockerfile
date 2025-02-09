# Use Ubuntu as the base image
FROM ubuntu:latest

# Update package lists and install figlet + wget
RUN apt-get update && apt-get install -y figlet wget

# Ensure figlet font directory exists, then download Star Wars font
RUN mkdir -p /usr/share/figlet && \
    wget http://www.jave.de/figlet/fonts/details/starwars.flf -O /usr/share/figlet/starwars.flf

# Copy the script into the container
COPY print-message.sh /print-message.sh

# Make the script executable
RUN chmod +x /print-message.sh

# Run the script when the container starts
CMD ["/bin/bash", "/print-message.sh"]

