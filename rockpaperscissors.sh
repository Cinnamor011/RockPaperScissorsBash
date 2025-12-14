#Author: Jolie Wilson
#Date: 12/13/2025
#Description: Bash script that runs the game rock paper scissors until user quits.
#The user plays against the CPU that uses a randomizer to select between an array called
#selection. Both the users input and CPU choices are compared then winner is declared

#!/bin/bash

echo "Welcome to rock, paper, scissors!" #Welcome user, signify the script is now running

#Win counter keeps track of users wins, set to 0 as default
wins=0

# Array of strings called selection
selection=("rock" "paper" "scissors")

while true; do
    # Prompt user to choose between four options, option is stored in variable player_choice
    read -p "Choose rock, paper, or scissors (or type quit): " player_choice

    # If player enters quit, exit the while loop which ends the game
    if [[ "$player_choice" == "quit" ]]; then
        echo "Play again soon!"
	echo "Total wins: $wins"
        break
    fi

    # Validate input from user, if incorrect input, prompts user again
    if [[ "$player_choice" != "rock" && "$player_choice" != "paper" && "$player_choice" != "scissors" ]]; then
        echo "Invalid choice. Try again."
        continue
    fi

    # CPU selects random element from array selection, stored in variable cpu
    cpu=${selection[$RANDOM % 3]}
    echo "You chose: $player_choice"
    sleep 1 #waits one second before showing next console output
    echo "CPU chose: $cpu"

    # Using if statements, compares both choices from user and cpu which then decides the winner. 
    # The possibilities are between a tie, player wins, or cpu wins.
    if [[ "$player_choice" == "$cpu" ]]; then
	sleep 1
        echo "It's a tie!"
    elif [[ "$player_choice" == "rock" && "$cpu" == "scissors" ]] || #if both choices are true, player wins
         [[ "$player_choice" == "paper" && "$cpu" == "rock" ]] || #|| operator means any one of these conditions determine player win
         [[ "$player_choice" == "scissors" && "$cpu" == "paper" ]]; then
	sleep 1
        echo "You win!"
	((wins++)) #adds +1 to the win counter
    else
	sleep 1
        echo "You lose!" #If none other condition can be satisfied, program defaults to player loss
    fi

    echo "" #Leaves space for the while loop to execute again
done #while loop and script ends once user enters quit
