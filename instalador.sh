#!/bin/bash

echo  "Script para instalar Visual Studio Code, DBeaver, Docker, Node.js con NVM y Flutter con FVM en Lubuntu"

# Actualizar el sistema
echo "Actualizando el sistema..."
sudo apt update && sudo apt upgrade -y

# Instalar dependencias necesarias
echo "Instalando dependencias..."
sudo apt install -y software-properties-common apt-transport-https wget curl gnupg2 lsb-release ca-certificates snapd

# --------------------------------------------
# INSTALAR VISUAL STUDIO CODE usando Snap
echo "Instalando Visual Studio Code..."
sudo snap install --classic code

# Verificar instalación de Visual Studio Code
if command -v code &> /dev/null
then
    echo "Visual Studio Code se instaló correctamente."
else
    echo "Error: Visual Studio Code no se instaló correctamente."
fi
sudo snap install dbeaver-ce

# Verificar instalación de DBeaver
if command -v dbeaver &> /dev/null
then
    echo "DBeaver se instaló correctamente."
else
    echo "Error: DBeaver no se instaló correctamente."
fi

# --------------------------------------------
# INSTALAR DOCKER
echo "Instalando Docker..."

# Añadir la clave GPG de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Añadir el repositorio de Docker
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list'

# Instalar Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Añadir el usuario al grupo Docker (opcional)
echo "Añadiendo el usuario al grupo Docker..."
sudo usermod -aG docker $USER

# Verificar instalación de Docker
if command -v docker &> /dev/null
then
    echo "Docker se instaló correctamente."
else
    echo "Error: Docker no se instaló correctamente."
fi

# --------------------------------------------
# INSTALAR NODE.js con NVM
echo "Instalando Node.js con NVM..."

# Instalar NVM (Node Version Manager)
wget -q -O- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# Cargar NVM en la terminal actual
source ~/.bashrc

#Version 
source nvm --version

# Instalar la última versión LTS de Node.js
nvm install node

# Establecer la versión LTS como predeterminada
source node -v

# Verificar instalación de Node.js
if command -v node &> /dev/null
then
    echo "Node.js se instaló correctamente."
else
    echo "Error: Node.js no se instaló correctamente."
fi

# --------------------------------------------
# INSTALAR FLUTTER con FVM
echo "Instalando Flutter con FVM..."

# Instalar FVM (Flutter Version Manager)
curl -fsSL https://fvm.app/install.sh | bash

# Añadir FVM a la variable de entorno PATH
echo "export PATH=\"$PATH:$HOME/.pub-cache/bin\"" >> ~/.bashrc
source ~/.bashrc

# Instalar la última versión estable de Flutter
fvm install stable

# Usar la versión instalada de Flutter
fvm use stable

# Verificar instalación de Flutter
if command -v flutter &> /dev/null
then
    echo "Flutter se instaló correctamente."
else
    echo "Error: Flutter no se instaló correctamente."
fi

# --------------------------------------------
# Finalizar
echo "Instalación completa. Por favor, reinicia tu sistema o ejecuta 'newgrp docker' para usar Docker sin 'sudo'."

