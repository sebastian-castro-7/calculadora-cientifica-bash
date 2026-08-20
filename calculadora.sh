#!/bin/bash

while true; do
echo "---------------------------"
echo "  CALCULADORA CIENTIFICA "
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
    echo ""
    echo "----- OPERACIONES BÁSICAS -----"
    echo "1) Suma (+)"
    echo "2) Resta (-)"
    echo "3) Multiplicación (*)"
    echo "4) División (/)"
    read -p "Elige una opción: " opcion_basica

    case $opcion_basica in
        1)
	    while true; do
		read -p "ingresa el primer numero: " n1
		if [[ "$n1" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
		break;
		else
		echo "Error: solo se permiten numeros"
		fi
		done
	   while true; do
		read -p "ingresa el segundo numero: " n2
		if [[ "$n2" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
		break;
		else
		echo "Error: solo se permiten numeros"
		fi
		done

            resultado=$(echo "scale=6; $n1 + $n2" | bc -l)
            echo "Resultado: $n1 + $n2 = $resultado"
            ;;
        2)

      	while true; do
                read -p "ingresa el primer numero: " n1
                if [[ "$n1" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
                break;
                else
                echo "Error: solo se permiten numeros"
                fi
                done
        while true; do
                read -p "ingresa el segundo numero: " n2
                if [[ "$n2" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
                break;
                else
                echo "Error: solo se permiten numeros"
                fi
                done

            resultado=$(echo "scale=6; $n1 - $n2" | bc -l)
            echo "Resultado: $n1 - $n2 = $resultado"
            ;;
        3)

	  while true; do
                read -p "ingresa el primer numero: " n1
                if [[ "$n1" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
                break;
                else
                echo "Error: solo se permiten numeros"
                fi
                done
           while true; do
                read -p "ingresa el segundo numero: " n2
                if [[ "$n2" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
                break;
                else
                echo "Error: solo se permiten numeros"
                fi
                done

            resultado=$(echo "scale=6; $n1 * $n2" | bc -l)
            echo "Resultado: $n1 * $n2 = $resultado"
            ;;
        4)
	   while true; do
                read -p "ingresa el primer numero: " n1
                if [[ "$n1" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
                break;
                else
                echo "Error: solo se permiten numeros"
                fi
                done
           while true; do
                read -p "ingresa el segundo numero: " n2
                if [[ "$n2" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
                break;
                else
                echo "Error: solo se permiten numeros"
                fi
                done

            if [ $(echo "$n2 == 0" | bc -l) -eq 1 ]; then
                echo "Error: No se puede dividir entre cero."
            else
                resultado=$(echo "scale=6; $n1 / $n2" | bc -l)
                echo "Resultado: $n1 / $n2 = $resultado"
            fi
            ;;
        *)
            echo "Opción inválida."
            ;;
    esac
;;


2)

echo "---TRIGONOMETRICAS---"
echo "1. Seno"
echo "2. Coseno"
echo "3. Tangente"
read -p "Elige una opcion (1-3): " op_trig

	        while true; do
                read -p "ingresa el numero en radianes: " angulo
                if [[ "$angulo" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
                break;
                else
                echo "Error: solo se permiten numeros"
                fi
                done

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
	   while true; do
                read -p "ingresa el numero base: " base
                if [[ "$base" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
                break;
                else
                echo "Error: solo se permiten numeros"
                fi
                done

	   while true; do
                read -p "ingresa el exponente (debe ser entero): " exp
                if [[ "$exp" =~ ^-?[0-9]+$ ]]; then
                break;
                else
                echo "Error: solo se permiten numeros enteros"
                fi
                done

	resultado=$(echo "$base ^ $exp" | bc -l)
	echo "el resultado de $base elevado a $exp es: $resultado"
	;;

	2)
	    while true; do
                read -p "ingresa el valor de x para e^x: " valor_e
                if [[ "$valor_e" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
                break;
                else
                echo "Error: solo se permiten numeros"
                fi
                done

	resultado=$(echo "e($valor_e)" | bc -l)
	echo "El resultado de e^$valor_e es: $resultado"
	;;

	*)
	echo "Opcion invalida"
	;;
  esac
  ;;

4)
echo ""
echo "----- TRIGONOMETRÍA INVERSA -----"
echo "1) Arcoseno (sin^-1)"
echo "2) Arcocoseno (cos^-1)"
echo "3) Arcotangente (tan^-1)"
read -p "Elige una opción: " opcion_trig

case $opcion_trig in
    1)
          while true; do
                read -p "ingresa un numero entre -1 y 1x: " x
                if [[ "$x" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
                break;
                else
                echo "Error: solo se permiten numeros"
                fi
                done

        if [ $(echo "$x <= -1 || $x >= 1" | bc -l) -eq 1 ]; then
            echo "Error: El dominio de asin es entre -1 y 1."
        else
            resultado=$(echo "scale=6; a($x / sqrt(1 - $x^2))" | bc -l)
            echo "Resultado: asin($x) = $resultado rad"
        fi
        ;;
    2)

	  while true; do
                read -p "ingresa un numero entre -1 y 1x: " x
                if [[ "$x" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
                break;
                else
                echo "Error: solo se permiten numeros"
                fi
                done

        if [ $(echo "$x <= -1 || $x >= 1" | bc -l) -eq 1 ]; then
            echo "Error: El dominio de acos es entre -1 y 1."
        else
            resultado=$(echo "scale=6; (2 * a(1)) - a($x / sqrt(1 - $x^2))" | bc -l)
            echo "Resultado: acos($x) = $resultado rad"
        fi
        ;;
    3)
          while true; do
                read -p "ingresa un numero entre: " x
                if [[ "$x" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
                break;
                else
                echo "Error: solo se permiten numeros"
                fi
                done

        resultado=$(echo "scale=6; a($x)" | bc -l)
        echo "Resultado: atan($x) = $resultado rad"
        ;;
    *)
        echo "Opción inválida"
        ;;
esac

;;

5)
while true
do
echo "---LOGARITMICAS---"
echo "1. Logaritmo natural (ln)"
echo "2. Logaritmo base 10 (log)"
echo "3. Salir al menu principal"
read -p "Elige una opcion (1-3): " op_log
case $op_log in 
1)

while true; do
  read -p "ingrese el numero:" numero
  if [[ "$numero" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
  if [[ "$numero" == "0" || "$numero" == "0.0" ]]; then
  echo "Error: el logaritmo de cero no existe"
  else
  break
  fi
  else 
  echo "Error: solo se permiten numeros positivos"
  fi
  done

resultado=$(echo "l($numero)" | bc -l)
echo "El logaritmo natural es: $resultado"
;;
2)

while true; do
  read -p "ingrese el numero:" numero
  if [[ "$numero" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
  if [[ "$numero" == "0" || "$numero" == "0.0" ]]; then
  echo "Error: el logaritmo de cero no existe"
  else
  break
  fi
  else 
  echo "Error: solo se permiten numeros positivos"
  fi
  done

resultado=$(echo "l($numero)/l(10)" | bc -l)
echo "El logaritmo base 10 es: $resultado"
;;
3)
break
;;
*)
echo "opcion invalida"
;;
esac
done 
;;

6)
while true
do 
echo "--RAICES--"
echo "1. Rices cuadradas"
echo "2. Raiz n-esima"
echo "3. Salir al menu principal"
read -p "Elige una opcion (1-3):" op_raiz
case $op_raiz in
1)

while true; do
read -p "Ingrese el numero:" numero
 if [[ "$numero" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
 break
 else 
 echo "Error: solo se permiten numeros positivos o cero"
 fi
 done
 
resultado=$(echo "sqrt($numero)" | bc -l)
echo " La raiz cuadrada es:$resultado"
;;
2)

while true; do
read -p "Ingrese el numero:" numero
if [[ "$numero" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
 if [[ "$numero" == "0" || "$numero" == "0.0" ]]; then
   echo "Error: por el metodo logaritmico, el numero debe ser mayor a cero"
  else
    break;
  fi
   else
    echo "Error: solo se permiten numeros positivos"
  fi
 done

while true; do
read -p "Ingrese el n de la raiz:" n
 if [[  "$n" =~ ^-?[0-9]+$ ]]; then
  if [[ "$n" == "0" ]]; then
  echo "Error: el indice de la raiz no puede ser cero"
  else
    break
  fi
    else
  echo "Error: solo permiten numeros enteros para la n"
    fi
  done
resultado=$(echo "e(l($numero)/$n)" |bc -l)
echo "La raiz $n-esima es:$resultado"
;;
3)
break
;;
*)
echo "opcion invalida"
;;
esac
done
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

