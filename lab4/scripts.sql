select  * from actors;
select * from directors;
select * from movies;
select * from movies2actors;
select * from movies2directors;
select * from u2bAse limit 5;
select * from users;
select COUNT(*) from actors;
select COUNT(*) from directors;
select COUNT(*) from movies;
select COUNT(*) from movies2actors;
select COUNT(*) from movies2directors;
select COUNT(*) from u2bAse;
select COUNT(*) from users;

select count(*) from u2bAse where rating is null;



--4.1average rating of all movies
create view avg_rating As
(
	select avg(cast(rating as integer)) from u2bAse
);

select * from avg_rating ;


--4.2 number of actors in each movie
create view no_of_actors As
(
	select 
    movieid,
    COUNT(actorid) As total_actors
    from
    movies2actors
    group by movieid
);

select * from no_of_actors;


--4.3number of rating for each movie
create view movie_rating As
(
	select 
    movieid, COUNT(rating) As total_rating
    from u2bAse
    group by movieid
);
select * from movie_rating;


--4.4number of rating by each user
create view user_ratings As
(
	select
	userid,	COUNT (rating) as total_rating 
	from u2bAse
	group by userid
	order by total_rating desc
);

select * from user_ratings;


--_____________________________________________________________________________________


--5.Find the number of users who have rated at leAst one movie.
create view user_rates as
( 
select count(*) 
from 
(select * from users where users.userid  in (select distinct userid from u2base)
) as rated
);

select * from user_rates ;



--6.Find the number of unrated movie
create view unrated As
( 
select count(*) 
from 
(select * from movies where movies.movieid not in (select distinct movieid from u2base)
) as not_rated
);

select * from unrated ;




--7.Find top 10 highest rated movies and the actors who played in those movies.
select movieid, actorid from
(select movieid , avg(cast(rating as integer)) as avg_rating from u2base
group by movieid 
order by avg_rating desc 
limit 10) as top_ten
natural join movies2actors;










