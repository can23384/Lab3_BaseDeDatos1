INSERT INTO Carrera (nombre, facultad, codigo_interno) VALUES
  ('Ingeniería en Sistemas',        'Facultad de Ingeniería',               'C-1001'),
  ('Ingeniería Industrial',         'Facultad de Ingeniería',               'C-1002'),
  ('Ciencias de la Comunicación',   'Facultad de Humanidades',               'C-2001'),
  ('Economía',                      'Facultad de Ciencias Económicas',       'C-3001'),
  ('Psicología',                    'Facultad de Humanidades',               'C-2002');

INSERT INTO Curso (nombre, codigo, creditos, semestre) VALUES
  ('Algoritmos',                   'CS101', 4, 1),
  ('Estructuras de Datos',         'CS102', 4, 2),
  ('Bases de Datos',               'CS201', 3, 3),
  ('Cálculo I',                    'MATH101', 5, 1),
  ('Cálculo II',                   'MATH102', 5, 2),
  ('Estadística',                  'STAT101', 3, 1),
  ('Física I',                     'PHYS101', 4, 1),
  ('Física II',                    'PHYS102', 4, 2),
  ('Química General',              'CHEM101', 4, 1),
  ('Introducción a la Psicología', 'PSY101', 3, 1),
  ('Economía I',                   'ECON101', 3, 1),
  ('Comunicación Oral',            'COM101', 2, 1);

INSERT INTO Estudiante (nombre, email, fecha_nacimiento, sexo, carrera_id) VALUES
  ('Juan Pérez',       'juan.perez@uni.gt',      '2000-01-15', 'M', 1),
  ('María López',      'maria.lopez@uni.gt',     '1999-11-03', 'F', 1),
  ('Carlos García',    'carlos.garcia@uni.gt',   '2001-05-22', 'M', 2),
  ('Ana Martínez',     'ana.martinez@uni.gt',    '2000-07-30', 'F', 2),
  ('Luis Rodríguez',   'luis.rodriguez@uni.gt',  '1998-12-11', 'M', 3),
  ('Sofía Hernández',  'sofia.hernandez@uni.gt', '2001-02-27', 'F', 3),
  ('Jorge González',   'jorge.gonzalez@uni.gt',  '1999-08-19', 'M', 4),
  ('Laura Sánchez',    'laura.sanchez@uni.gt',   '2000-04-05', 'F', 4),
  ('Diego Ramírez',    'diego.ramirez@uni.gt',   '2001-10-12', 'M', 5),
  ('Elena Torres',     'elena.torres@uni.gt',    '1998-06-21', 'F', 5),
  ('Pedro Flores',     'pedro.flores@uni.gt',    '1999-09-09', 'M', 1),
  ('Camila Jiménez',   'camila.jimenez@uni.gt',  '2000-03-14', 'F', 2),
  ('Andrés Morales',   'andres.morales@uni.gt',  '2001-01-08', 'M', 3),
  ('Daniela Ruiz',     'daniela.ruiz@uni.gt',    '1998-07-17', 'F', 4),
  ('Ricardo Díaz',     'ricardo.diaz@uni.gt',    '1999-05-29', 'M', 5),
  ('Paula Gómez',      'paula.gomez@uni.gt',     '2000-11-23', 'F', 1),
  ('Javier Castro',    'javier.castro@uni.gt',   '2001-12-02', 'M', 2),
  ('Valeria Ortiz',    'valeria.ortiz@uni.gt',   '1998-02-16', 'F', 3),
  ('Manuel Vega',      'manuel.vega@uni.gt',     '1999-04-28', 'M', 4),
  ('Andrea Fuentes',   'andrea.fuentes@uni.gt',  '2000-09-05', 'F', 5);


INSERT INTO Inscripcion (estudiante_id, curso_id, fecha_inscripcion, nota_final) VALUES
  (1,  1, '2025-02-01',  88.50),
  (1,  4, '2025-02-01',  92.00),

  (2,  1, '2025-02-03',  75.25),
  (2,  5, '2025-02-03',  81.00),

  (3,  2, '2025-02-05',  67.75),
  (3,  6, '2025-02-05',  72.50),

  (4,  2, '2025-02-07',  90.00),
  (4,  7, '2025-02-07',  85.00),

  (5,  3, '2025-01-15',  78.00),
  (5,  8, '2025-01-15',  82.25),

  (6,  3, '2025-01-17',  94.00),
  (6,  9, '2025-01-17',  88.75),

  (7,  4, '2025-01-20',  69.50),
  (7, 10, '2025-01-20',  73.00),

  (8,  5, '2025-01-22',  87.00),
  (8, 11, '2025-01-22',  79.50),

  (9,  6, '2025-01-25',  91.25),
  (9, 12, '2025-01-25',  84.00),

  (10, 7, '2025-01-28',  76.00),
  (10,12, '2025-01-28',  80.75),

  (11, 1, '2025-03-01',  89.00),
  (11, 2, '2025-03-01',  92.50),

  (12, 3, '2025-03-03',  95.00),
  (12, 4, '2025-03-03',  88.00),

  (13, 5, '2025-03-05',  82.00),
  (13, 6, '2025-03-05',  77.75),

  (14, 7, '2025-03-07',  91.00),
  (14, 8, '2025-03-07',  85.50),

  (15, 9, '2025-03-10',  68.25),
  (15,10, '2025-03-10',  74.00),

  (16,11, '2025-03-12',  88.25),
  (16,12, '2025-03-12',  90.00),

  (17, 1, '2025-04-01',  79.50),
  (17, 5, '2025-04-01',  83.00),

  (18, 2, '2025-04-03',  94.00),
  (18, 6, '2025-04-03',  89.75),

  (19, 3, '2025-04-05',  72.00),
  (19, 7, '2025-04-05',  78.50),

  (20, 4, '2025-04-07',  85.25),
  (20, 8, '2025-04-07',  91.00);
