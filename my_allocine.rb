# Single Table Queries
## Displaying all the columns of a single table
requests['Display all actors'] = "SELECT * FROM actors;"

requests['Display all genres'] = "SELECT * FROM genres;"

## Displaying all data from specific columns within a table
requests['Display the name and year of the movies'] = 
"SELECT mov_title, mov_year FROM movies;"

requests['Display reviewer name from the reviews table'] = 
"SELECT rev_name FROM reviews;"

## Filtering rows from a single table using comparison & logical operators
requests["Find the year when the movie American Beauty released"] = 
"SELECT mov_year FROM movies WHERE mov_title = 'American Beauty';"

requests["Find the movie which was released in the year 1999"] = 
"SELECT mov_title FROM movies WHERE mov_year = 1999;"

requests["Find the movie which was released before 1998"] = 
"SELECT mov_title FROM movies WHERE mov_year < 1998;"

## Joined two tables, returned results in alphabetical order
requests["Find the name of all reviewers who have rated 7 or more stars to their rating order by reviews rev_name (it might have duplicated names :-))"] = 
"SELECT r.rev_name FROM reviews AS r 
INNER JOIN movies_ratings_reviews AS mrr ON r.id = mrr.rev_id 
WHERE rev_stars >= 7 ORDER BY r.rev_name;"

## Filtering rows from a table using a comma-separated list of values
requests["Find the titles of the movies with ID 905, 907, 917"] = 
"SELECT mov_title FROM movies WHERE id IN (905, 907, 917);"

## Filtering rows from a table where you don't necessarily know the whole string
requests["Find the list of those movies with year and ID which include the words Boogie Nights"] = 
"SELECT id, mov_title, mov_year FROM movies WHERE mov_title LIKE '%Boogie%Nights%';"

## Filtering rows from a table based on multiple conditions
requests["Find the ID number for the actor whose first name is 'Woody' and the last name is 'Allen'"] = 
"SELECT id FROM actors WHERE act_fname = 'Woody' AND act_lname = 'Allen';"


## Filtering with multiple subqueries
requests["Find the actors with all information who played a role in the movies 'Annie Hall'"] = 
"SELECT * FROM actors WHERE id = (SELECT act_id FROM movies_actors WHERE mov_id = 
(SELECT id FROM movies WHERE mov_title = 'Annie Hall'));"

## Joining three tables, specifying tables.columns to return
requests["Find the first and last names of all the actors who were cast in the movies 'Annie Hall', and the roles they played in that production"] = 
"SELECT a.act_fname, a.act_lname, m_a.role FROM actors AS a 
INNER JOIN movies_actors AS m_a ON a.id = m_a.act_id 
INNER JOIN movies AS m ON m_a.mov_id = m.id WHERE m.mov_title = 'Annie Hall';"

## Joining four tables
requests["Find the name of movie and director who directed a movies that casted a role as Sean Maguire"] = 
"SELECT d.dir_fname, d.dir_lname, m.mov_title FROM movies AS m 
INNER JOIN movies_actors AS ma ON m.id = ma.mov_id 
INNER JOIN directors_movies AS dm ON ma.mov_id = dm.mov_id 
INNER JOIN directors AS d ON dm.dir_id = d.id WHERE ma.role = 'Sean Maguire';"

requests["Find all the actors who have not acted in any movie between 1990 and 2000"] = 
"SELECT a.act_fname, a.act_lname, m.mov_title, m.mov_year FROM actors AS a 
INNER JOIN movies_actors AS ma ON a.id = ma.act_id INNER JOIN movies AS m ON ma.mov_id = m.id 
WHERE m.mov_year < 1990 OR m.mov_year > 2000 ORDER BY m.mov_year;"
