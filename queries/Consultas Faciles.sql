-- Consultas fáciles
-- ¿Cuántas pinturas hay en total en la base de datos?
select COUNT(*) from PAINTINGS;

-- ¿Cuántos artistas diferentes hay?
select COUNT(distinct full_name) from ARTISTS;

-- ¿Qué museos hay en la base de datos y en qué ciudades están?
select NAME, CITY from MUSEUMS;

-- ¿Cuántas pinturas hay por cada artista?
select artist_id, count(artist_id) as Numero_pinturas from paintings group by artist_id order by numero_pinturas DESC;

-- ¿Qué estilos de pintura son los más frecuentes?
select distinct style, count(style) numero_estilos from paintings group by style order by numero_estilos DESC;

-- ¿Qué nacionalidades de artistas están presentes en la base de datos?
select nationality, count (nationality)as numero_veces from artists group by nationality order by numero_veces desc;

-- ¿Cuántas pinturas tiene cada museo?
select museums.museum_id, museums.name, count(paintings.name) as numero_pinturas 
from museums left join paintings on museums.museum_id=paintings.museum_id 
GROUP BY museums.museum_id, museums.name order by numero_pinturas DESC;
;
-- ¿Cuáles son los cinco artistas con más pinturas?
select full_name, count(paintings.name) as Numero_pinturas from artists join paintings on artists.artist_id=paintings.artist_id
group by full_name 
order by numero_pinturas DESC
limit 5;

-- ¿Qué artistas tienen exactamente una pintura?
select full_name, count(paintings.name) as numero_pinturas from artists join paintings on artists.artist_id=paintings.artist_id
group by full_name 
having 
COUNT(paintings.name) = 1
;

-- ¿Qué museos tienen más de 10 pinturas?
select museums.name, count(paintings.name) as numero_pinturas from museums join paintings on museums.museum_id=paintings.museum_id
group by museums.name
HAVING 
  COUNT(paintings.name) > 10
order by numero_pinturas DESC;
