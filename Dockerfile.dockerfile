FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y libglib2.0-0 libnss3 libgconf-2-4 libxi6 libxrandr2 libxcursor1 libxinerama1 libatk1.0-0 libc6 libx11-6 && \
    rm -rf /var/lib/apt/lists/*

COPY . /server

RUN chmod +x /server/juego.x86_64

EXPOSE 7777

CMD ["/server/juego.x86_64", "-batchmode", "-nographics", "-logfile", "/dev/stdout"]
