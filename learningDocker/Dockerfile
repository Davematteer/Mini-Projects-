FROM ubuntu:latest
RUN apt-get update && apt-get install -y figlet wget
RUN wget http://www.jave.de/figlet/fonts/details/starwars.flf -0 /usr
COPY print-message.sh /print-message.sh
RUN chmod +x /print-message.sh
CMD ["/print-message.sh"]
