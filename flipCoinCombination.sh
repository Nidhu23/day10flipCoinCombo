#!/bin/bash 
echo "Welcome to Flip coin problem "
declare -A dict
read -p "Enter the number of times you want to flip the coin " num
echo -e "1.Single Comination\n2.Double Combination\n3.Triple Combination"
read -p "Enter your choice " choice
case $choice in 
	1)	for((i=0;i<$num;i++))
		do
			if [[ $(($RANDOM%2)) -eq 0 ]]
			then
				dict["Heads"]=$((${dict[Heads]}+1))
			else
				dict["Tails"]=$((${dict[Tails]}+1))
			fi
		done
		if [[ ${dict[Heads]} > ${dict[Tails]} ]]
		then
			dict["Percentage"]=`echo "scale=2;${dict[Heads]}/$num*100" | bc`
			echo -e H is the winner and winning percentage is ${dict[Percentage]}
		else
			dict["Percentage"]=`echo "scale=2;${dict[Tails]}/$num*100" | bc`
       	echo -e T is the winner and winning percentage is ${dict[Percentage]}
		fi;;
	2)	for((i=0;i<$num;i++))
      do
			res=$(($RANDOM%2))
	    	res2=$(($RANDOM%2))
			case $res$res2 in 
					00)dict["HH"]=$((${dict[HH]}+1));;
					01)dict["HT"]=$((${dict[HT]}+1));;
					10)dict["TH"]=$((${dict[TH]}+1));;
					11)dict["TT"]=$((${dict[TT]}+1));;
			esac   
		done
		temp=$((${dict[HH]}))
		for i in ${!dict[@]}
		do
			if [[ ${dict[$i]} -ge $temp ]]
			then
				temp=$((${dict[$i]}))
				val=$i
			fi
		done	
		dict["percentage"]=`echo "scale=2;$temp/$num*100" | bc`
		echo $val is the winner and winning percentage is ${dict[percentage]};;
	3)	for((i=0;i<$num;i++))
		do
			a=$(($RANDOM%2))
			b=$(($RANDOM%2))
			c=$(($RANDOM%2))
			case ${a}${b}${c} in
			(000)dict["HHH"]=$((${dict[HHH]}+1));;
			(010)dict["HTH"]=$((${dict[HTH]}+1));;
			(101)dict["THT"]=$((${dict[THT]}+1));;
			(111)dict["TTT"]=$((${dict[TTT]}+1));;
			(001)dict["HHT"]=$((${dict[HHT]}+1));;
			(110)dict["TTH"]=$((${dict[TTH]}+1));;
			(100)dict["THH"]=$((${dict[THH]}+1));;
			(011)dict["HTT"]=$((${dict[HTT]}+1));;
			esac
		done
		temp=$((${dict[HHH]}))
		for i in ${!dict[@]}
		do
			if [[ ${dict[$i]} -ge $temp ]]
         then
            temp=$((${dict[$i]}))
            val=$i
         fi
       done
       dict["percentage"]=`echo "scale=2;$temp/$num*100" | bc`
       echo $val is the winner and winning percentage is ${dict[percentage]};;
   *)echo Enter a valid input;;
esac	






