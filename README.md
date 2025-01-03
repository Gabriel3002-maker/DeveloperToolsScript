# Script de Instalación de Herramientas en Lubuntu

Este script automatiza la instalación de las siguientes herramientas en un sistema Lubuntu:

- **Visual Studio Code**
- **DBeaver**
- **Docker**
- **Node.js (con NVM)**
- **Flutter (con FVM)**

## Requisitos previos

- Lubuntu o una distribución similar basada en Ubuntu.
- Acceso a la terminal.
- Acceso de superusuario (root) o privilegios `sudo` en la máquina.

## Descripción del Script

El script realiza las siguientes tareas:

1. Actualiza el sistema.
2. Instala dependencias necesarias.
3. Instala Visual Studio Code usando Snap.
4. Instala DBeaver usando Snap.
5. Instala Docker, agrega la clave GPG y el repositorio, y permite la ejecución sin `sudo` mediante el grupo Docker.
6. Instala Node.js usando NVM (Node Version Manager).
7. Instala Flutter usando FVM (Flutter Version Manager).

## Cómo usar el script

1. Una vez que el script  navega hasta el directorio donde se encuentra el archivo y ejecuta el siguiente comando para darle permisos de ejecución:

   chmod +x instalador.sh

2. Ejecuta el script

   ./instalador.sh

3. Finalmente revisa si las aplicaciones fueron correctamente Instaladas



