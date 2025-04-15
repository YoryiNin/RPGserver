FROM ubuntu:22.04

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    libglib2.0-0 \
    libnss3 \
    libgconf-2-4 \
    libxi6 \
    libxrender1 \
    libxtst6 \
    libxrandr2 \
    && rm -rf /var/lib/apt/lists/*

# Crear directorio del juego
WORKDIR /app

# Copiar archivos del servidor
COPY . .

# Dar permisos de ejecución al binario del servidor
RUN chmod +x ./juego.x86_64

# Exponer el puerto que uses en tu NetworkManager (por ejemplo: 7777)
EXPOSE 7777

# Comando para correr el servidor (headless)
CMD ["./juego.x86_64", "-batchmode", "-nographics"]
