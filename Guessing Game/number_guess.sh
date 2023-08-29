#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
SECRETNUMBER= $(( $RANDOM % 1000 +1 ))

echo -e "\n--Number Guessing Game--\n"
echo -e "First let me sign you up.\n"


ASKUSERNAME(){
echo -e "Enter your username:"
read NAME
# length check
NUM_OF_CHAR=$(echo $USERNAME | wc -c)
if [[ $NUM_OF_CHAR -gt 22 ]]
then 
ASKUSERNAME
fi
}

ASKUSERNAME

USER=$($PSQL "SELECT username FROM users WHERE username = '$NAME'")

if [[ -z $USER ]]
then
INSERT_USER=$($PSQL "INSERT INTO users (username) VALUES ('$NAME')")
echo -e "Welcome, $NAME! It looks like this is your first time here."

else
GAMES=$($PSQL "SELECT COUNT(*) FROM games INNER JOIN users USING(user_id) WHERE username = '$NAME'")
BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games INNER JOIN users USING(user_id) WHERE username = '$NAME'")
echo "Welcome back, '$NAME'! You have played '$GAMES' games, and your best game took '$BEST_GAME' guesses."
fi

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$NAME'")
TRIES=1
GUESSES=0

GUESSING_GAME(){


read PLAYERGUESS

while [[ $GUESS =~ ^[+-]?[0-9]+$ && ! $GUESS -eq $SECRET_NUMBER ]]
do
TRIES= $(expr $TRIES  +1)




if [[ $PLAYERGUESS -gt $SECRETNUMBER ]]

then
echo -e "\nIt's lower than that, guess again:"
read PLAYERGUESS

elif [[ $PLAYERGUESS -lt $SECRETNUMBER ]]

then
echo -e "\nIt's higher than that, guess again:"
read PLAYERGUESS
fi
done


if [[ ! $PLAYERGUESS =~ ^[0-9]+$ ]]
then
echo "That is not an integer, guess again:"
TRIES=$(expr $TRIES  +1)
GUESSING_GAME
fi

}
echo "Guess a number between 1 - 1000:"
GUESSING_GAME

INSERT_GAME=$($PSQL "INSERT INTO games(user_id, guesses) VALUES ($USER_ID, $TRIES)")
MANY_TRIES=$(if [[ $TRIES -eq 1 ]]; then echo "try"; else echo "tries"; fi)
echo -e "\nYou guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"