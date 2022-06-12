use imdb; 
show tables; 



ALTER table actors  add primary key (id);
ALTER table directors  add primary key (id);
ALTER table movies  add primary key (id);
ALTER table roles add primary key (id);


alter table movies_directors 
add foreign key (movie_id) references movies(id) ,
add foreign key (director_id) references directors (id);

ALTER table roles 
add foreign key roles (movie_id) references movies (id) ,
add foreign key roles (actor_id) references actors  (id);


ALTER table directors_genres 
add foreign key directors_genres (director_id) references directors (id);

ALTER table movies_genres 
add foreign  key movies_genres (movie_id) references movies (id) ;

ALTER table actors drop column film_count;

SELECT * from directors_genres dg ;

SELECT * from movies_genres mg  ;
