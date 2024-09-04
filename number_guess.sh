#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"


# get username

echo "Enter your username:"

read USERNAME

# get user_id

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

# if user_id not found

if [[ -z $USER_ID ]]

then

  # add new user

  INSERT_NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")

  # get new user_id

  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

  echo "Welcome, $USERNAME! It looks like this is your first time here."

else

  # if user_id already exists

  # get user's number of games played and lowest number of guesses to get the secret number

  NUM_GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id = $USER_ID")

  BEST_GUESS_NUM=$($PSQL "SELECT MIN(num_guesses) FROM games WHERE user_id = $USER_ID")

  echo "Welcome back, $USERNAME! You have played $NUM_GAMES games, and your best game took $BEST_GUESS_NUM guesses."

fi


# it's secret number between 1 and 1000 time

SECRET_NUM=$(( RANDOM % 1000 + 1 ))

echo "Guess the secret number between 1 and 1000:"

read GUESS

GUESS_COUNT=1


CHECK_GUESS() {

# if user response is not an integer

if [[ ! $GUESS =~ ^[0-9]+$ ]]

then 

  echo "That is not an integer, guess again:"

  read GUESS

  GUESS_COUNT=$(( $GUESS_COUNT+1 ))   

elif

  # if number guessed is too high

  [[ $GUESS -gt $SECRET_NUM ]]

then

  echo "It's lower than that, guess again:"

  read GUESS

  GUESS_COUNT=$(( $GUESS_COUNT+1 ))

elif

  # if number guessed is too low

  [[ $GUESS -lt $SECRET_NUM ]]

then

  echo "It's higher than that, guess again:"

  read GUESS

  GUESS_COUNT=$(( $GUESS_COUNT+1 ))

fi

}

until [[ $SECRET_NUM = $GUESS ]]
do
  CHECK_GUESS again
done

# if number guessed is correct

GUESS_COUNT=$(( $GUESS_COUNT+1 ))

# add game stats to SQL games table

TRACK_GAME_STATS=$($PSQL "INSERT INTO games(user_id, num_guesses) VALUES($USER_ID, $GUESS_COUNT)")

echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUM. Nice job!"