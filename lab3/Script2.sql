use imdb;


-- Find the number of actors, movies, genres, and directors.
SELECT (SELECT count(*) from movies) as movie_count,
(SELECT count(*) from actors) as actor_count,
(SELECT count(DISTINCT genre) from directors_genres dg ) as directors_genres_count,
(SELECT count(DISTINCT genre) from movies_genres mg ) as movies_genres_count,
(SELECT count(*) from directors) as directors_count;



-- List the full name, and role of all actors who played in Titanic.
SELECT  concat(a.first_name, " ", a.last_name) as actor_name, r.role 
from roles as r inner join actors as a 
on a.id = r.actor_id 
inner join movies as m 
on m.id = r.movie_id
where m.name = 'Titanic';



-- Find the number of movies in all genres. 
SELECT mg.genre, count(m.name) as total_movies
from movies as m inner join movies_genres as mg
on mg.movie_id=m.id
group by mg.genre;



-- Find the average number of movies played by the actors.
SELECT avg(t.number_of_movies_played) as average_movies_played_by_an_actor from (SELECT
r.actor_id,
count(r.movie_id) as number_of_movies_played
from
roles as r
group by
r.actor_id) as t;



-- Find the average number of actors in a movie. 
SELECT avg(t.number_of_actors) as average_actors_in_a_movie
from (SELECT r.movie_id,count(r.actor_id) as number_of_actors from roles as r
group by r.movie_id) as t;



-- Find top 5 movies based on the rank. 
SELECT * from movies order by movies.`rank` DESC  limit 5;



-- Find 20 directors who have directed at least 2 movies. 
SELECT concat(d.first_name, " ", d.last_name) as name, 
count(md.movie_id) as number_of_movies_directed  
from movies_directors md inner join directors d on d.id=md.director_id
group by md.director_id
having number_of_movies_directed > 1
order by number_of_movies_directed DESC limit 20;



-- Find all movies played by Kevin Bacon. 
SELECT concat(a.first_name, " ", a.last_name) as name , m.name  as movie_name from roles as r
inner join actors as a on r.actor_id = a.id
inner join movies m on m.id=r.movie_id
where a.first_name = 'Kevin' AND a.last_name = 'Bacon';



-- Find all movies released from 1990 to 2000.
SELECT  year, name , m.`rank`  from movies m where year >= 1990 and year < 2000
order by year ;




