# Single Table Queries
## Displaying all the columns of a single table
requests['Display all actors'] = "SELECT * FROM actors;"
requests['Display all genres'] = "SELECT * FROM genres;"

## Displaying all data from specific columns within a table
requests['Display the name and year of the movies'] = "SELECT mov_title, mov_year FROM movies;"
requests['Display reviewer name from the reviews table'] = "SELECT rev_name FROM reviews;"

## Filtering rows from a single table using comparison & logical operators
requests["Find the year when the movie American Beauty released"] = "SELECT mov_year FROM movies WHERE mov_title = 'American Beauty';"
requests["Find the movie which was released in the year 1999"] = "SELECT mov_title FROM movies WHERE mov_year = 1999;"
requests["Find the movie which was released before 1998"] = "SELECT mov_title FROM movies WHERE mov_year < 1998;"

## Skipped for now!  SELECT DISTINCT...
requests["Find the name of all reviewers who have rated 7 or more stars to their rating order by reviews rev_name (it might have duplicated names :-))"] = ""

## Filtering rows from a table using a comma-separated list of values
requests["Find the titles of the movies with ID 905, 907, 917"] = "SELECT mov_title FROM movies WHERE id IN (905, 907, 917);"

## Filtering rows from a table where you don't necessarily know the whole string
requests["Find the list of those movies with year and ID which include the words Boogie Nights"] = "SELECT mov_title, mov_year, id FROM movies WHERE mov_title LIKE '%Boogie Nights%';"

## Filtering rows from a table with based on two separate conditions
requests["Find the ID number for the actor whose first name is 'Woody' and the last name is 'Allen'"] = "SELECT id FROM actors WHERE act_fname = 'Woody' AND act_lname = 'Allen';"

# Multi Table Queries
## Filtering with subqueries
requests["Find the actors with all information who played a role in the movies 'Annie Hall'"] = "SELECT * FROM actors WHERE id = (SELECT act_id FROM movies_actors WHERE mov_id = (SELECT id FROM movies WHERE mov_title = 'Annie Hall'));"


requests["Find the first and last names of all the actors who were cast in the movies 'Annie Hall', and the roles they played in that production"] = ""

requests["Find the name of movie and director who directed a movies that casted a role as Sean Maguire"] = ""
requests["Find all the actors who have not acted in any movie between 1990 and 2000"] = ""