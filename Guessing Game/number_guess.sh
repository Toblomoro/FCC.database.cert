#!/bin/bash

echo "\n--Number GUessing Game--\n"
echo "First let me sign you up.\n"
echo "What is your name?"

READ NAME



echo $($PSQL "INSERT INTO number_guess(name) VALUES ($NAME)")

echo "Please Guess a number 1 through 1000\n"
READ PLAYERGUESS

GAME(){
SECRETNUMBER= SELECT floor(RANDOM()* 100 +1 
TRIES=0
CORRECT=0
while [[ CORRECT =0 ]];
do
READ PLAYERGUESS

IF
[[ ! $PLAYERGUESSGUESS =~ ^[0-9]+$ ]];
then
echo "That was not a number please try again"
TRIES=($TRIES +1)
elif
 [[ $PLAYERGUESS -gt $SECRETNUMBER ]];
 then
 echo "Your guess is too high try again"
 TRIES=($TRIES +1)
else
 echo "Your guess is too low try again"
 TRIES=($TRIES +1)
FI
done

}