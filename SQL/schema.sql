-- Tipos personalizados
-- 1) ENUM para el sexo del estudiante
CREATE TYPE sexo_tipo AS ENUM ('M', 'F', 'Otro');

-- 2) DOMAIN para el código interno de la carrera (formato C-1234)
CREATE DOMAIN codigo_interno_domain AS VARCHAR(6)
  CHECK (VALUE ~ '^C-\d{4}$');


-- Tabla: Carrera
CREATE TABLE Carrera (
  id                  BIGSERIAL PRIMARY KEY,
  nombre              VARCHAR(100) NOT NULL,
  facultad            VARCHAR(100) NOT NULL,
  codigo_interno      codigo_interno_domain NOT NULL UNIQUE
);



-- Tabla: Estudiante
CREATE TABLE Estudiante (
  id                  BIGSERIAL PRIMARY KEY,
  nombre              VARCHAR(100) NOT NULL,
  email               VARCHAR(150) NOT NULL UNIQUE,
  fecha_nacimiento    DATE NOT NULL,
  sexo                sexo_tipo NOT NULL,
  carrera_id          BIGINT NOT NULL,
  CONSTRAINT fk_estudiante_carrera
    FOREIGN KEY (carrera_id)
    REFERENCES Carrera(id)
    ON DELETE RESTRICT
);



-- Tabla: Curso
CREATE TABLE Curso (
  id                  BIGSERIAL PRIMARY KEY,
  nombre              VARCHAR(100) NOT NULL,
  codigo              VARCHAR(20) NOT NULL UNIQUE,
  creditos            SMALLINT NOT NULL CHECK (creditos > 0),
  semestre            SMALLINT NOT NULL CHECK (semestre BETWEEN 1 AND 12)
);



-- Tabla intermedia: Inscripcion 
CREATE TABLE Inscripcion (
  id                  BIGSERIAL PRIMARY KEY,
  estudiante_id       BIGINT NOT NULL,
  curso_id            BIGINT NOT NULL,
  fecha_inscripcion   TIMESTAMP NOT NULL DEFAULT NOW(),
  nota_final          NUMERIC(5,2) CHECK (nota_final BETWEEN 0 AND 100),

  CONSTRAINT fk_insc_estudiante
    FOREIGN KEY (estudiante_id)
    REFERENCES Estudiante(id)
    ON DELETE CASCADE,

  CONSTRAINT fk_insc_curso
    FOREIGN KEY (curso_id)
    REFERENCES Curso(id)
    ON DELETE CASCADE,

  CONSTRAINT uq_insc_estudiante_curso UNIQUE (estudiante_id, curso_id)
);


--VISTA
CREATE OR REPLACE VIEW vista_estudiantes_cursos AS
SELECT 
  e.id AS estudiante_id,
  e.nombre AS estudiante,
  e.email,
  c.nombre AS carrera,
  crs.nombre AS curso,
  i.nota_final,
  i.fecha_inscripcion
FROM estudiante e
JOIN carrera c ON e.carrera_id = c.id
JOIN inscripcion i ON e.id = i.estudiante_id
JOIN curso crs ON i.curso_id = crs.id;