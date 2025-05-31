# Lab 3 - Tipos de datos personalizados y ORM.

Este laboratorio debe realizarse en grupos de 2 personas.
Deben usar un ORM (Object-Relational Mapping) de su elección (Eloquent, SQLAlchemy,
Sequelize, Prisma, etc.).
Deberán construir una aplicación CRUD completa para una entidad principal que tenga múl-
tiples elementos relacionados a través de una tabla intermedia.
La aplicación debe permitir crear, editar y eliminar registros, así como mostrar un índice
completo a través de una vista (VIEW) en la base de datos.

## 🔧 Requisitos

- Python 3.8 o superior
- PostgreSQL 
- Librerías de Python:
  ```bash
  pip install sqlalchemy psycopg2-binary
  ```

## 📁 Estructura del Proyecto

```
.
├── database.py       # Configuración de conexión a PostgreSQL
├── models.py         # Definición de tablas y relaciones con SQLAlchemy
├── main.py           # Lógica CRUD (crear, leer, actualizar, eliminar)
├── SQL/
│   ├── schema.sql        # Script DDL con tipos personalizados
│   └── data.sql          # Script de inserción de datos
└── README.md
```

## 🛠️ Configuración Inicial

1. **Crear base de datos** en PostgreSQL :
   ```sql
   CREATE DATABASE Lab3;
   ```

2. **Actualizar la cadena de conexión** en `database.py`:
   ```python
   DATABASE_URL = "postgresql+psycopg2://usuario:contraseña@localhost:5432/Lab3"
   ```

3. **Crear las tablas y tipos personalizados**:
   Ejecutar `schema.sql` desde pgAdmin4 o el Query Tool.

4. **Insertar datos de prueba**:
   Ejecutar `data.sql` en pgAdmin4 para poblar las tablas.

## ▶️ Ejecución del Programa

Desde terminal:

```bash
python main.py
```

Esto ejecutará ejemplos de:
- Crear estudiante y asociarlo a cursos
- Listar todos los estudiantes
- Editar un estudiante
- Eliminar un estudiante


## 🔍 Verificación en pgAdmin4

Desde pgAdmin se puede ejecutar estas consultas SQL para validar los resultados:

```sql
SELECT * FROM estudiante;
SELECT * FROM inscripcion;
SELECT * FROM vista_estudiantes_cursos;
```

## 👨‍💻 Autores

Eliazar José Pablo Canastuj Matías - 23384 

Pablo Andrés Cabrera Arguello – 231156 
