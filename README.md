# SQL_museum_artists
# 🎨 SQL Art Gallery Project

Este proyecto consiste en un análisis exploratorio de una base de datos relacional sobre obras de arte, artistas y museos utilizando SQL. Ha sido complementado con visualizaciones interactivas desarrolladas en Python. Es uno de mis primeros proyectos aplicando SQL de forma práctica, con el objetivo de consolidar mis habilidades en análisis de datos y bases relacionales, además de conectar la lógica de datos con herramientas de visualización modernas.

## 📁 Estructura de la base de datos

La base de datos contiene tres tablas principales:
- `artists`: información de artistas (nombre, nacionalidad, fechas de vida)
- `paintings`: información de obras (nombre, estilo, artista, museo)
- `museums`: información sobre museos (nombre, país)

## 🎯 Objetivos del proyecto

- Explorar la base de datos y responder preguntas clave sobre arte, artistas y museos.
- Aplicar consultas SQL de tipo JOIN, GROUP BY, HAVING, subconsultas y agregaciones.
- Plantear preguntas complejas con lógica condicional y análisis más profundo.
- Visualizar los resultados más relevantes con Python (Pandas + Plotly).


## 🗃️ Esquema de tablas

| Campo       | Tipo    | Descripción                 |
| ----------- | ------- | --------------------------- |
| artist\_id  | INTEGER | Clave primaria              |
| full\_name  | TEXT    | Nombre completo del artista |
| nationality | TEXT    | Nacionalidad                |
| birth       | INTEGER | Año de nacimiento           |
| death       | INTEGER | Año de fallecimiento        |


| Campo        | Tipo    | Descripción            |
| ------------ | ------- | ---------------------- |
| painting\_id | INTEGER | Clave primaria         |
| name         | TEXT    | Nombre de la obra      |
| style        | TEXT    | Estilo artístico       |
| artist\_id   | INTEGER | Relación con `artists` |
| museum\_id   | INTEGER | Relación con `museums` |


| Campo      | Tipo    | Descripción      |
| ---------- | ------- | ---------------- |
| museum\_id | INTEGER | Clave primaria   |
| name       | TEXT    | Nombre del museo |
| city       | TEXT    | Ciudad           |
| country    | TEXT    | País             |


## 🧠 Consultas destacadas

- ¿Qué estilos fueron más comunes en el siglo XIX?
- ¿Qué artista produjo más obras por año de vida?
- ¿Qué artistas tienen pinturas en museos fuera de su país?
- ¿Qué estilos están presentes en más de 3 museos distintos?


## 📁 Estructura del repositorio
├── queries/
│   ├── Consultas Avanzadas.sql          
│   ├── Consultas Faciles.sql       
│   └── Consultas Intermedias.sql   
├── data/
│   └── artist.cvs 
│   └── museum.cvs
│   └── work.cvs 
├── Visualizacion_python/
│   └── archivo ipynb/ 
│     └── Visualizaciones_SQL 
 
├── README.md


