#!/bin/bash 
echo "Welcome to Flip coin problem "

declare -A singlet
function flipCoin(){
	if [[ $(($RANDOM%2)) -eq 0 ]]
	then
		return 0
	else
		return 1
fi
}
read -p "Enter the number of times you want to flip the coin " num
for((i=0;i<$num;i++))
do
if flipCoin
then
	singlet["Heads"]=$((${singlet[Heads]}+1))
else
	singlet["Tails"]=$((${singlet[Tails]}+1))
fi
done
echo ${singlet[Heads]} ${singlet[Tails]}
if [[ ${singlet[Heads]} > ${singlet[Tails]} ]]
then
	n=`echo "scale=2;${singlet[Heads]}/$num*100" | bc`
	echo -e H is the winner and winning percentage is $n
else
	n=`echo "scale=2;${singlet[Tails]}/$num*100" | bc`
        echo -e T is the winner and winning percentage is $n
fi
