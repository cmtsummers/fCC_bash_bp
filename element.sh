#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# if no argument is provided

if [[ -z $1 ]]

then

  echo -e "Please provide an element as an argument."

else

# identify element

  if [[ $1 =~ ^[0-9]+$ ]]

  then

    ELEMENT=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = '$1'")

  elif [[ $1 =~ ^[A-Z][a-z]?$ ]]

  then

    ELEMENT=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$1'")

  else

    ELEMENT=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name = '$1'")

  fi

  # if element not found

  if [[ -z $ELEMENT ]]

  then

    echo -e "I could not find that element in the database."

  else

  # clean up results

  ELEMENT=$(echo $ELEMENT | sed 's/ //g')

  echo $ELEMENT | while IFS=\| read A_NUM SYM NAME A_MASS MELTING BOILING TYPE

  do

  # display results

    echo -e "The element with atomic number $A_NUM is $NAME ($SYM). It's a $TYPE, with a mass of $A_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."

  done

  fi

fi