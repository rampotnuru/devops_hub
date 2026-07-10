#!/bin/bash

read -p "Enter first number: " num1
read -p "Enter second number: " num2
read -p "Enter operation (+,-,*,/): " op

case $op in

+)
echo "Result = $((num1 + num2))"
;;

-)
echo "Result = $((num1 - num2))"
;;

\*)
echo "Result = $((num1 * num2))"
;;

/)
echo "Result = $((num1 / num2))"
;;

*)
echo "Invalid operator"
;;

esac

