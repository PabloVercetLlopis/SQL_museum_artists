--AVANZADO 
--¿Cuál es el promedio de pinturas por artista?
SELECT AVG(obras_por_artista) AS promedio_pinturas_por_artista
FROM (
  SELECT COUNT(p.artist_id ) AS obras_por_artista
  FROM artists a
  JOIN paintings p ON a.artist_id = p.artist_id
  GROUP BY a.artist_id
) sub;

--¿Cuál es el rango de años de nacimiento de los artistas por nacionalidad?
SELECT 
  nationality,
  MIN(birth) AS año_más_antiguo,
  MAX(birth) AS año_más_reciente
FROM artists
GROUP BY nationality;


--¿Qué museos tienen pinturas de artistas que murieron antes de 1850?
SELECT DISTINCT m.name AS museo, a.death
FROM museums m
JOIN paintings p ON m.museum_id = p.museum_id
JOIN artists a ON p.artist_id = a.artist_id
WHERE a.death < 1850
order by a.death DESC;

--¿Qué estilos tienen más de un artista, pero cada artista tiene solo una pintura?
SELECT p.style
FROM paintings p
JOIN (
    SELECT artist_id
    FROM paintings
    GROUP BY artist_id
    HAVING COUNT(*) = 1
) artistas_una_pintura ON p.artist_id = artistas_una_pintura.artist_id
GROUP BY p.style
HAVING COUNT(DISTINCT p.artist_id) > 1;


--¿Qué estilos de pintura están presentes en más de 3 museos diferentes?
SELECT style, COUNT(DISTINCT paintings.museum_id) AS numero_museos
FROM paintings
JOIN museums ON paintings.museum_id = museums.museum_id
GROUP BY style
HAVING COUNT(DISTINCT paintings.museum_id) > 3
order by numero_museos  DESC;

--¿Qué artistas tienen pinturas en museos fuera de su país de origen?
SELECT DISTINCT a.full_name, a.nationality, m.country AS museo_pais
FROM paintings p
JOIN artists a ON p.artist_id = a.artist_id
JOIN museums m ON p.museum_id = m.museum_id
WHERE a.nationality != m.country;

--¿Qué artistas vivieron en el mismo siglo pero usaron estilos diferentes?
SELECT 
    a.full_name,
    COUNT(DISTINCT p.style) AS numero_estilos,
    FLOOR(a.birth / 100) + 1 AS siglo
FROM artists a
JOIN paintings p ON a.artist_id = p.artist_id
GROUP BY a.full_name, FLOOR(a.birth / 100) + 1
HAVING COUNT(DISTINCT p.style) > 1
order by siglo;


--¿Qué artista produjo más obras por año de vida (pinturas / años vividos)?
SELECT 
    a.full_name,
    COUNT(p.artist_id ) * 1.0 / (a.death - a.birth) AS obras_por_año
FROM artists a
JOIN paintings p ON a.artist_id = p.artist_id
WHERE a.death IS NOT NULL AND a.birth IS NOT NULL AND a.death > a.birth
GROUP BY a.artist_id
ORDER BY obras_por_año DESC
LIMIT 1;

--¿Qué artistas han pintado en más de un país (basado en ubicación del museo)?
SELECT 
    a.full_name,
    COUNT(DISTINCT m.country) AS num_paises
FROM artists a
JOIN paintings p ON a.artist_id = p.artist_id
JOIN museums m ON p.museum_id = m.museum_id
GROUP BY a.artist_id, a.full_name
HAVING COUNT(DISTINCT m.country) > 1
order by num_paises DESC;

