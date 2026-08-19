#!/bin/bash

while true; do
echo "---------------------------"
echo "  CALCULADORA CIENTIFICA   "
echo "---------------------------"
echo "1. Op. Basicas"
echo "2. Trigonometricas"
echo "3. Exponenciales"
echo "4. Trigonometricas inversas"
echo "5. Logaritmicas"
echo "6. Raices"
echo "7. salir"
echo "---------------------------"

read -p "Eliga una opcion: " opcion

case $opcion in
1)

;;

2)

echo "---TRIGONOMETRICAS---"
echo "1. Seno"
echo "2. Coseno"
echo "3. Tangente"
read -p "Elige una opcion (1-3): " op_trig
read -p "Ingrese el angulo en radianes: " angulo

	case $op_trig in
	1)
	resultado=$(echo "s($angulo)" | bc -l)
	echo "El seno es: $resultado"
	;;

	2)
	resultado=$(echo "c($angulo)" | bc -l)
	echo "El coseno es: $resultado"
	;;

	3)
	resultado=$(echo "s($angulo)/c($angulo)" | bc -l)
	echo "La tangente es: $resultado"
	;;

	*)
	echo  "Opcion invalida"
	;;

esac
;;


3)

echo "--- EXPONENCIALES ---"
echo "1. Potenica basica(x^y)"
echo "2. Exponencial de euler (e^x)"
read -p "Elige una opcion (1-2): " op_exp

case $op_exp in

	1)
	read -p "ingresa el numero base: " base
	read -p "ingresa el exponente (debe ser entero): " exp
	resultado=$(echo "$base ^ $exp" | bc -l)
	echo "el resultado de $base elevado a $exp es: $resultado"
	;;

	2)
	read -p "ingresa el valor de x para e^x: " valor_e
	resultado=$(echo "e($valor_e)" | bc -l)
	echo "El resultado de e^$valor_e es: $resultado"
	;;

	*)
	echo "Opcion invalida"
	;;
  esac
  ;;

4)

;;

5)
echo "---LOGARITMICAS---"
echo "1. Logaritmo natural (ln)"
echo "2. Logaritmo base 10 (log)"
read -p "Elige una opcion (1-2): " op_log
read -p "Ingrese el numero:" numero
case $op_log in 
1)
resultado=$(echo "l($numero)" | bc -l)
echo "El logaritmo natural es: $resultado"
;;
2)
resultado=$(echo "l($numero)/l(10)" | bc -l)
echo "El logaritmo base 10 es: $resultado"
;;
*)
echo "opcion invalida"
;;
esac 
;;

6)
echo "--RAICES--"
echo "1. Rices cuadradas"
echo "2. Raiz n-esima"
read -p "Elige una opcion (1-2):" op_raiz
read -p "Ingrese el numero:" numero
case $op_raiz in
1)
resultado=$(echo "sqrt($numero)" | bc -l)
echo " La raiz cuadrada es:$resultado"
;;
2)
read -p "Ingrese el n de la raiz:" n
resultado=$(echo "e(l($numero)/$n)" |bc -l)
echo "La raiz $n-esima es:$resultado"
;;
*)
echo "opcion invalida"
;;
esac
;;

7)
echo "Saliendo de la calculadora..."
exit 0
;;

*)
echo "Elige una opcion valida (1-7)"
;;

esac

echo ""
read -p  "Presiona una tecla para continuar"
clear

done

