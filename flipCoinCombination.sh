#!/bin/bash 
echo "Welcome to Flip coin problem "
declare -A singlet
declare -A doublet
read -p "Enter the number of times you want to flip the coin " num
echo -e "1.Single Comination\n2.Double Combination\n3.Triple Combination"
read -p "Enter your choice " choice
case $choice in 
		1)for((i=0;i<$num;i++))
		  do
			if [[ $(($RANDOM%2)) -eq 0 ]]
			then
				singlet["Heads"]=$((${singlet[Heads]}+1))
			else
				singlet["Tails"]=$((${singlet[Tails]}+1))
			fi
		   done
           if [[ ${singlet[Heads]} > ${singlet[Tails]} ]]
		   then
				singlet["Percentage"]=`echo "scale=2;${singlet[Heads]}/$num*100" | bc`
				echo -e H is the winner and winning percentage is ${singlet[Percentage]}
			else
				singlet["Percentage"]=`echo "scale=2;${singlet[Tails]}/$num*100" | bc`
       			echo -e T is the winner and winning percentage is ${singlet[Percentage]}
			fi;;
		2)for((i=0;i<$num;i++))
        do
            res=$(($RANDOM%2))
	    		res2=$(($RANDOM%2))
            case $res$res2 in 
					00)doublet["HH"]=$((${doublet[HH]}+1));;
					01)doublet["HT"]=$((${doublet[HT]}+1));;
					10)doublet["TH"]=$((${doublet[TH]}+1));;
					11)doublet["TT"]=$((${doublet[TT]}+1));;
				esac   
		  done
		  temp=$((${doublet[HH]}))
		  for i in ${!doublet[@]}
		  do
			if [[ ${doublet[$i]} -ge $temp ]]
			then
				temp=$((${doublet[$i]}))
				val=$i
			fi
		 done	
		 doublet["percentage"]=`echo "scale=2;$temp/$num*100" | bc`
		 echo $val is the winner and winning percentage is ${doublet[percentage]};;
	*)echo Enter a valid input;;
esac





