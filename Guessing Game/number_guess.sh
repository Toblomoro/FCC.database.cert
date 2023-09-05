#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
SECRETNUMBER=$(( $RANDOM % 1000 + 1 ))


echo -e "\n--Number Guessing Game--\n"
echo -e "\nFirst let me sign you up.\n"
echo -e "$SECRETNUMBER"

ASKUSERNAME(){
echo -e "\nEnter your username:"
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
  echo -e "\nWelcome back, $NAME! You have played $GAMES games, and your best game took $BEST_GAME guesses."
fi

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$NAME'")
TRIES=1
PLAYERGUESS=0

GUESSING_GAME(){


read PLAYERGUESS

while [[ $PLAYERGUESS =~ ^[+-]?[0-9]+$ && ! $PLAYERGUESS -eq $SECRETNUMBER ]]
do
TRIES=$(expr $TRIES + 1)
if [[ $PLAYERGUESS -lt $SECRETNUMBER ]]

then
echo -e "\nIt's higher than that, guess again:"
read PLAYERGUESS

elif [[ $PLAYERGUESS -gt $SECRETNUMBER ]]

then
echo -e "\nIt's lower than that, guess again:"
read PLAYERGUESS



fi
done


if [[ ! $PLAYERGUESS =~ ^[0-9]+$ ]]
then
echo "That is not an integer, guess again:"
TRIES=$(expr $TRIES + 1)
GUESSING_GAME
fi

}
echo -e "\nGuess the secret number between 1 and 1000:"
GUESSING_GAME

INSERTED_GAME=$($PSQL "INSERT INTO games (user_id, guesses) VALUES ($USER_ID, $TRIES)")
PLURAL_TRIES=$(if [[ $TRIES -eq 1 ]]; then echo "try"; else echo "tries"; fi)
echo -e "\nYou guessed it in $TRIES tries. The secret number was $SECRETNUMBER. Nice job!"