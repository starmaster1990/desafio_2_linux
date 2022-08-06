#!/bin/bash

######## Ejercicio 1 ########
basePath="foo"
dir1="$basePath/dummy"
dir2="$basePath/empty"
file1="$dir1/file1.txt"
file2="$dir1/file2.txt"
string="Me encanta bash!!"

<< 'Comment'
    Elimina el directorio para volver a recrear todo de nuevo
Comment
deleteDirectory(){
    rm -rf "$basePath"
}

<< 'Comment'
    Crea directorio
    Recibe 1 parametro - el nombre del directorio
Comment
directoryCreator(){
    mkdir -p $1
}

deleteDirectory

directoryCreator $dir1
directoryCreator $dir2

echo "$string" > "$file1"
touch "$file2"

######## Ejercicio 2 ########

cat  "$file1" > "$file2"
mv "$file2" "$dir2"