#! /bin/bash


array=(_ _ _ _ _ _ _ _ _)
player=$(($RANDOM % 2))
if [ ${player} == 0 ]; then
	player_symbol=O
	computer_symbol=X
else
	player_symbol=X
	computer_symbol=O
fi
turn=0
left=9
win=2


show()
{
	echo "  0 1 2"
	echo "0 ${array[0]} ${array[1]} ${array[2]}"
	echo "1 ${array[3]} ${array[4]} ${array[5]}"
	echo "2 ${array[6]} ${array[7]} ${array[8]}"
}


change()
{
	if [ $# != 2 ]; then
		echo "Incorrect move"
	else
		index=$(( $1 * 3 + $2 ))
		if [ ${array[$index]} == "_" ]; then
			array[$index]=$player_symbol
			
			turn=$((1-turn))
			left=$((left-1))
		else
			echo "Incorrect move"
		fi
	fi
}


check()
{
	if [ ${array[$1]} != "_" ] && [ ${array[$1]} == ${array[$2]} ] && [ ${array[$2]} == ${array[$3]} ]; then
		win=$(( 1-turn ))
	fi
}


check_win()
{
	check 0 1 2
	check 3 4 5
	check 6 7 8
	
	check 0 3 6
	check 1 4 7
	check 2 5 8
	
	check 0 4 8
	check 2 4 6
}


save()
{
	if [ $# != 1 ]; then
		echo "Incorrect filename"
	fi
	echo "${array[0]} ${array[1]} ${array[2]} ${array[3]} ${array[4]} ${array[5]} ${array[6]} ${array[7]} ${array[8]}" > $1
	echo "$player" >> $1
	echo "$left" >> $1
	echo "File saved"
}


load()
{
	if [ $# != 1 ]; then
		echo "Incorrect filename"
	fi
	if [ -e "$1" ]; then
		i=0
		while read line; do
			if [ ${i} == 0 ]; then
				IFS=' '
				read -a array <<< "$line"
			fi
			if [ ${i} == 1 ]; then
				player=$line
				turn=$line
			fi
			if [ ${i} == 2 ]; then
				left=$line
			fi
			i=$(( i+1 ))
		done < "$1"
		if [ ${player} == 0 ]; then
			player_symbol=O
			computer_symbol=X
		else
			player_symbol=X
			computer_symbol=O
		fi
	else
		echo "Incorrect filename"
	fi
	echo "File loaded"
	show
}


echo "Started a game of Tic-Tac-Toe"
echo "You are playing as $player_symbol"
echo "To make your move type '1 {row} {column}'"
echo "To save the game type '2 save {savename}'"
echo "To load the game type '3 load {savename}' (if the file exists it will be overwritten)"

while [ ${win} == 2 ]; do
	show
	if [ ${player} == ${turn} ]; then
		while [ ${player} == ${turn} ]; do
			read -r command col row
			if [ ${command} == 1 ]; then
				change $col $row
			elif [ ${command} == 2 ]; then
				save $col
			elif [ ${command} == 3 ]; then
				load $col
			else
				echo "Incorrect option"
			fi
		done
	else
		n=0
		n_m=$(( $RANDOM % ${left} ))
		i=0
		echo $n_m
		while [ ${array[$i]} != "_" ]; do
			i=$(( i+1 ))
			n=$(( n+1 ))
		done
		while [ ${n_m} != 0 ]; do
			n=$(( n+1 ))
			if [ ${array[$i]} == "_" ]; then
				n_m=$(( n_m-1 ))
			fi
			i=$(( i+1 ))
		done
		while [ ${array[$i]} != "_" ]; do
			i=$(( i+1 ))
			n=$(( n+1 ))
		done
		array[$n]=$computer_symbol
		turn=$(( 1-turn ))
		left=$(( left-1 ))
	fi
	
	if [ ${left} == 0 ]; then
		win=-1
	fi
	check_win
done

show
if [ ${win} == ${player} ]; then
	echo "You have won!"
elif [ ${win} == $(( 1 - player )) ]; then
	echo "You have lost!"
else
	echo "Draw"
fi

