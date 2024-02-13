#!/bin/bash

echo "Verificando EFS..."

# Verificar la estructura de directorios de EFS
echo "Contenido de /mnt/efs:"
ls -l /mnt/efs

echo "Tree de /mnt/efs:"
tree /mnt/efs

# Crear un archivo de texto de ejemplo
echo "Hola, este es un archivo de ejemplo." > /mnt/efs/ejemplo.txt

# Verificar si el archivo se ha creado correctamente
echo "Contenido de /mnt/efs después de crear el archivo de ejemplo:"
ls -l /mnt/efs
