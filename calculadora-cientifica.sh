#!/bin/bash

# Convertir radianes a grados
radianes_a_grados() {
    local rad=$1
    echo "scale=6; $rad * 180 / (4*a(1))" | bc -l
}

# 1. Operaciones básicas
menu_basico() {
    echo ""
    echo "----- OPERACIONES BÁSICAS -----"
    echo "1) Suma (+)"
    echo "2) Resta (-)"
    echo "3) Multiplicación (*)"
    echo "4) División (/)"
    read -p "Elige una opción: " opcion_basica

    read -p "Ingresa el primer número: " n1
    read -p "Ingresa el segundo número: " n2

    case $opcion_basica in
        1)
            resultado=$(echo "scale=6; $n1 + $n2" | bc -l)
            echo "Resultado: $n1 + $n2 = $resultado"
            ;;
        2)
            resultado=$(echo "scale=6; $n1 - $n2" | bc -l)
            echo "Resultado: $n1 - $n2 = $resultado"
            ;;
        3)
            resultado=$(echo "scale=6; $n1 * $n2" | bc -l)
            echo "Resultado: $n1 * $n2 = $resultado"
            ;;
        4)
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
}

# 2. Trigonometría inversa
menu_trig_inversa() {
    echo ""
    echo "----- TRIGONOMETRÍA INVERSA -----"
    echo "1) Arcoseno (arcsen)"
    echo "2) Arcocoseno (arccos)"
    echo "3) Arcotangente (arctan)"
    read -p "Elige una opción: " opcion_inv
    read -p "Ingresa el valor x: " x

    case $opcion_inv in
        1)
            rad=$(echo "scale=10; a($x / sqrt(1 - $x*$x))" | bc -l 2>/dev/null)
            if [ -z "$rad" ]; then
                echo "Error: El valor debe estar en el rango [-1, 1]."
            else
                grados=$(radianes_a_grados "$rad")
                echo "arcsen($x) = $grados°"
            fi
            ;;
        2)
            rad=$(echo "scale=10; (2*a(1)) - a($x / sqrt(1 - $x*$x))" | bc -l 2>/dev/null)
            if [ -z "$rad" ]; then
                echo "Error: El valor debe estar en el rango [-1, 1]."
            else
                grados=$(radianes_a_grados "$rad")
                echo "arccos($x) = $grados°"
            fi
            ;;
        3)
            rad=$(echo "scale=10; a($x)" | bc -l)
            grados=$(radianes_a_grados "$rad")
            echo "arctan($x) = $grados°"
            ;;
        *)
            echo "Opción inválida."
            ;;
    esac
}

# Menú principal
while true
do
    echo ""
    echo "======================================="
    echo "          CALCULADORA EN BASH          "
    echo "======================================="
    echo "1) Operaciones básicas (+, -, *, /)"
    echo "2) Trigonometría Inversa"
    echo "0) Salir"
    echo "======================================="
    read -p "Elige una opción: " opcion

    case $opcion in
        1) menu_basico ;;
        2) menu_trig_inversa ;;
        0)
            echo "¡Hasta luego!"
            break
            ;;
        *)
            echo "Opción no válida, intenta de nuevo."
            ;;
    esac
done
