#!/bin/bash

webName="web.html"

read -p "Introduzca la url de la web " webUrl


<< 'Comment'
   Obtiene el codigo de respuesta de una peticion
Comment
function statusPage(){
    echo $(curl -s -I "$webUrl" | head -n 1 | awk '{print $2}')
}

<< 'Comment'
    Obtiene el contenido de la pagina
Comment
function getPage(){
    curl -s -o "$webName" "$webUrl"
}

<< 'Comment'
    Busca la palabra ingresada
Comment
function find(){    
    match=$(grep -n "$1" "$webName" | awk -F  ":" '{print $1}')
    if [[ -z "$match" ]]; then
        echo "No se encontraron coincidencias"
    else
        echo "Hay coincidencias en las lineas"
        echo $match
    fi
}

statusCode=$(statusPage)

if [[ "$statusCode" == "200" ]]; then
    read -p "Introduzca la palabra a buscar " filter
    if [[ -z "$filter" ]]; then
        echo "No ingreso una palabra, el trabajo termino"
    else
        find "$filter"
    fi 
else
    echo "La pagina solicitada no existe"
fi