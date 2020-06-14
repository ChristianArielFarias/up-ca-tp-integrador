#!/bin/bash

# ---------- FUNCIONES ---------- #
function mostrar_menu(){
    clear
    echo "1) Mostrar cantidad de elementos de la serie de Fibonacci"
    echo "2) Mostrar número en forma invertida"
    echo "3) Analizar si cadena es palindromo"
    echo "4) Contar cantidad de lineas de un archivo"
	echo "5) Ordenar numeros ingresados"
	echo "6) Contar cuantos archivos de cada tipo"
    echo "7) Salir"

}

function salir(){
    NOMBRE=$1  
    echo "Chau $NOMBRE"
}

function fibonacci(){
	cantidad=$1 
	aux=1
	aux2=1
	echo $aux
	if [ $1 -gt 1 ]
	then
		echo $aux2
	fi
	
	for((i=3;i<=cantidad;i++))
		do	
			val=`expr $aux + $aux2` 
			echo $val
			aux=$aux2
			aux2=$val		
		done
}

# ---------------------------- PROGRAMA PRINCIPAL ---------------------------- #
OPCION=0
mostrar_menu

while true; do
    read -p "Ingrese una opcion: " OPCION
    case $OPCION in
        1)
			NUM=0
			read -p "Ingrese un numero entero: " NUM
			fibonacci $NUM ;;		
		2)
			NUM=0
			read -p "Ingrese un numero entero: " NUM
			echo $NUM | rev ;;
		3)
			read -p "Ingrese una cadena de caracteres: " cadena
			cadenaInvertida=`echo $cadena | rev`
			if [ $cadena = $cadenaInvertida ]
			then
				echo "Es Palindormo"
			else
				echo "NO es Palindormo"
			fi ;;
		4)
			read -p "Ingrese el path del archivo de texto: " path
			if [ -f $path ]
			then
				cantLineas=`cat $path |wc -l`
				echo "Cantidad de lineas que tiene el archivo: $cantLineas"
			else
				echo "El path ingresado no corresponde a un archivo" 
			fi	;;
		5) 
			echo "Ingrese 5 numeros enteros: " 
			for((i=1;i<=5;i++))
				do
					read -p "Numero $i: " numero$i
				done
				
			echo -e "$numero1\n$numero2\n$numero3\n$numero4\n$numero5" | sort -n ;; 
			
		6)
			read -p "Ingrese un directorio: " path
			if [ -d $path ]
			then
				find $path -type f | sed -n 's/..*\.//p'  |sort |uniq -c
			else
				echo "El directorio no existe" 
			fi	;;
						
    		7)	salir `whoami` 
            		break;;

        	*)	echo "Opcion incorrecta";;
    esac
done
exit 0
