#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Script to insert data from games.csv into the worldcup database 


cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do

  if [[ $YEAR != year && $ROUND != round && $WINNER != winner ]]
  then

  # get winner_id

    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

  # if winner not found

  if [[ -z $WINNER_ID ]]
  then 

  # insert winner into teams table

    INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
  if [[ $INSERT_WINNER == "INSERT 0 1" ]] 
  then
    echo Inserted into teams, $WINNER
  fi

  #  get new winner_id

    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  fi
  fi
  if [[ $OPPONENT != opponent ]]
    then

  # get opponent_id

    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

  # if opponent not found

  if [[ -z $OPPONENT_ID ]]
  then

  # add opponent to teams table

    INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
  if [[ $INSERT_OPPONENT == "INSERT 0 1" ]] 
  then 
    echo Inserted into teams, $OPPONENT
  fi

  # get new opponent_id

    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  fi
  fi
  if [[ $WINNER_GOALS != winner_goals && $OPPONENT_GOALS != opponent_goals ]]
  then

  # add row to games table

    INSERT_INTO_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
  if [[ INSERT_INTO_GAMES == "INSERT 0 1" ]]
    then
    echo Inserted in games, $YEAR
  fi
  fi
done