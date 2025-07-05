--INTERMEDIO
--¿Cuál es la nacionalidad con más artistas?
select nationality, count (nationality)as numero_veces from artists group by nationality order by numero_veces desc limit 1;

--¿Cuál es el estilo más frecuente por nacionalidad del artista?
SELECT nationality,style, numero_veces_estilo
FROM (
  SELECT 
    artists.nationality,
    paintings.style,
    COUNT(paintings.style) AS numero_veces_estilo,
    ROW_NUMBER() OVER (PARTITION BY artists.nationality ORDER BY COUNT(paintings.style) DESC) AS fila
  FROM 
    artists
  JOIN 
    paintings ON artists.artist_id = paintings.artist_id
  GROUP BY 
    artists.nationality, paintings.style
) AS subconsulta 
WHERE 
  fila = 1;

--¿Qué artistas nacieron antes del año 1800?
select full_name, birth from artists 
where birth < 1800
order by birth DESC

--¿Qué museos tienen pinturas solo de artistas franceses?
select museums.name, museums.city, museums.country, count (paintings.name) as numero_pinturas_francesas
from museums 
JOIN paintings  ON museums.museum_id = paintings.museum_id
JOIN artists ON paintings.artist_id = artists.artist_id
group by museums.museum_id, museums.name, museums.city, museums.country
HAVING 
  COUNT(DISTINCT CASE WHEN artists.nationality != 'French' THEN paintings.artist_id END) = 0;

--¿Qué estilos se encuentran en más de un museo?
select style, count(style) as esta_en_museos 
from paintings join museums on paintings.museum_id = museums.museum_id
group by style
having count (DISTINCT paintings.museum_id) > 1

--¿Qué museo tiene la mayor diversidad de estilos artísticos?
select m.name, count(style) as estilos 
from museums m join paintings p  on m.museum_id = p.museum_id
group by m.museum_id, m.name
order by estilos DESC 

--¿Qué artistas han pintado en más de un estilo?
SELECT 
  a.full_name, 
  COUNT(DISTINCT p.style) AS estilos
FROM 
  artists a 
JOIN 
  paintings p ON a.artist_id = p.artist_id
GROUP BY 
  a.full_name
HAVING 
  COUNT(DISTINCT p.style) > 1
ORDER BY 
  estilos DESC;


--¿Qué ciudades tienen más de un museo en la base de datos?
select city, count(name) as numero_museos from museums m 
group by city
order by numero_museos desc

--¿Cuáles son los estilos más comunes en el siglo XIX (1800–1899)?
select p.style, count(p.style) as numero_veces from 
paintings p join artists a on p.artist_id = a.artist_id
WHERE a.death BETWEEN 1801 AND 1900
GROUP BY p.style
ORDER BY numero_veces DESC;


--¿Qué artista vivió más tiempo?
SELECT 
  full_name,
  death - birth AS edad
FROM 
  artists
WHERE 
  birth IS NOT NULL AND death IS NOT NULL
ORDER BY 
  edad DESC
LIMIT 5;