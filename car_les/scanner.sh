#!/bin/bash

file="0/include/initialConditions"

fmt() {
    printf "%.4f\n" "$1"
}

flowVelocity=$(grep "^[[:space:]]*flowVelocity" "$file" | sed -E 's/.*\(([^)]*)\).*/\1/')
Ux=$(echo "$flowVelocity" | awk '{print $1}')
Uy=$(echo "$flowVelocity" | awk '{print $2}')
Uz=$(echo "$flowVelocity" | awk '{print $3}')

U=$(awk "BEGIN {print sqrt($Ux*$Ux + $Uy*$Uy + $Uz*$Uz)}")

p=$(grep "^[[:space:]]*pressure" "$file" | awk '{print $2}' | tr -d ';')
k=$(awk '$1=="turbulentKE" {gsub(/;/,"",$2); print $2; exit}' "$file")
omega=$(awk '$1=="turbulentOmega" {gsub(/;/,"",$2); print $2; exit}' "$file")



file_fc="system/forceCoeffs"

ARef=$(awk '$1=="Aref" {gsub(/;/,"",$2); print $2; exit}' "$file_fc")
LRef=$(awk '$1=="lRef" {gsub(/;/,"",$2); print $2; exit}' "$file_fc")
magUInf=$(awk '$1=="magUInf" {gsub(/;/,"",$2); print $2; exit}' "$file_fc")


echo "===== CURRENT INITIAL CONDITIONS ====="
echo "flowVelocity = ($flowVelocity)"
echo "U = $(fmt "$U")"
echo "pressure = $(fmt "$p")"
echo "k = $(fmt "$k")"
echo "omega = $(fmt "$omega")"


echo "ARef = $(fmt "$ARef")"
echo "LRef = $(fmt "$LRef")"
echo "magUInf = $(fmt "$magUInf")"
