
-- Habilita trabajo con llaves foráneas
PRAGMA foreign_keys = ON;

-- Tabla Pelicula
CREATE TABLE IF NOT EXISTS pelicula(
  id_pelicula INTEGER PRIMARY KEY,
  titulo TEXT NOT NULL,
  descripcion TEXT,
  genero TEXT NOT NULL,
  fecha TEXT NOT NULL
);

-- Tabla Actor
CREATE TABLE IF NOT EXISTS actor(
  id_actor INTEGER PRIMARY KEY,
  nombre TEXT NOT NULL,
  apellido TEXT NOT NULL,
  nacionalidad TEXT NOT NULL
);

-- Tabla pelicula - actor
CREATE TABLE IF NOT EXISTS pelicula_actor(
  pelicula_id INTEGER NOT NULL,
  actor_id INTEGER NOT NULL,
  FOREIGN KEY(pelicula_id) REFERENCES pelicula(id_pelicula),
  FOREIGN KEY(actor_id) REFERENCES actor(id_actor),
  PRIMARY KEY(pelicula_id, actor_id)
);

-- Insertar peliculas

INSERT INTO pelicula(
  titulo,
  descripcion,
  genero,
  fecha
)
VALUES(
  'Iron Man',
  'Historia de Tony Stark',
  'Accion',
  '02-05-2008'
);

INSERT INTO pelicula(
  titulo,
  descripcion,
  genero,
  fecha
)
VALUES(
  'Avengers Endgame',
  'Los vengadores enfrentan a Thanos',
  'Accion',
  '26-04-2019'
);

INSERT INTO pelicula(
  titulo,
  descripcion,
  genero,
  fecha
)
VALUES(
  'Capitan America El primer vengador',
  'Origen del Capitan America',
  'Accion',
  '22-07-2011'
);

INSERT INTO pelicula(
  titulo,
  descripcion,
  genero,
  fecha
)
VALUES(
  'Black Widow',
  'Historia de Natasha Romanoff',
  'Accion',
  '09-07-2021'
);

INSERT INTO pelicula(
  titulo,
  descripcion,
  genero,
  fecha
)
VALUES(
  'Spider-Man No Way Home',
  'Peter Parker enfrenta problemas del multiverso',
  'Accion',
  '17-12-2021'
);

-- Insertar actores

INSERT INTO actor(nombre, apellido, nacionalidad)
VALUES('Robert', 'Downey Jr.', 'Estadounidense');

INSERT INTO actor(nombre, apellido, nacionalidad)
VALUES('Chris', 'Evans', 'Estadounidense');

INSERT INTO actor(nombre, apellido, nacionalidad)
VALUES('Scarlett', 'Johansson', 'Estadounidense');

INSERT INTO actor(nombre, apellido, nacionalidad)
VALUES('Tom', 'Holland', 'Britanica');

INSERT INTO actor(nombre, apellido, nacionalidad)
VALUES('Benedict', 'Cumberbatch', 'Britanica');

-- Insertar Pelicula / Actor

INSERT INTO pelicula_actor(pelicula_id, actor_id)
VALUES(1, 1);

INSERT INTO pelicula_actor(pelicula_id, actor_id)
VALUES(2, 1);

INSERT INTO pelicula_actor(pelicula_id, actor_id)
VALUES(2, 2);

INSERT INTO pelicula_actor(pelicula_id, actor_id)
VALUES(2, 3);

INSERT INTO pelicula_actor(pelicula_id, actor_id)
VALUES(2, 4);

INSERT INTO pelicula_actor(pelicula_id, actor_id)
VALUES(2, 5);

INSERT INTO pelicula_actor(pelicula_id, actor_id)
VALUES(3, 2);

INSERT INTO pelicula_actor(pelicula_id, actor_id)
VALUES(4, 3);

INSERT INTO pelicula_actor(pelicula_id, actor_id)
VALUES(5, 4);

INSERT INTO pelicula_actor(pelicula_id, actor_id)
VALUES(5, 5);

-- Consultar peliculas y actores con INNER JOIN

SELECT
  nombre,
  apellido,
  titulo AS 'pelicula'
FROM pelicula_actor
  INNER JOIN actor ON
    pelicula_actor.actor_id = actor.id_actor
  INNER JOIN pelicula ON
    pelicula_actor.pelicula_id = pelicula.id_pelicula;
