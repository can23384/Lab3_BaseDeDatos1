from datetime import date, datetime
from database import SessionLocal, engine
from models import Base, Estudiante, Carrera, Curso, Inscripcion, SexoEnum

Base.metadata.create_all(bind=engine)

session = SessionLocal()

# CREAR ESTUDIANTE
def crear_estudiante(nombre, email, fecha_nac, sexo, carrera_id, cursos_ids):
    estudiante = Estudiante(
        nombre=nombre,
        email=email,
        fecha_nacimiento=fecha_nac,
        sexo=sexo,
        carrera_id=carrera_id
    )
    session.add(estudiante)
    session.commit()

    for curso_id in cursos_ids:
        insc = Inscripcion(
            estudiante_id=estudiante.id,
            curso_id=curso_id,
            fecha_inscripcion=datetime.now(),
            nota_final=85.0  
        )
        session.add(insc)

    session.commit()
    print(f" Estudiante '{nombre}' creado y asignado a cursos {cursos_ids}")



# LEER/LISTAR ESTUDIANTES
def listar_estudiantes():
    estudiantes = session.query(Estudiante).all()
    for est in estudiantes:
        print(f"[{est.id}] {est.nombre} - {est.email} - Carrera ID: {est.carrera_id}")


# EDITAR ESTUDIANTE
def editar_estudiante(estudiante_id, nuevo_nombre):
    est = session.query(Estudiante).filter_by(id=estudiante_id).first()
    if est:
        print(f" Estudiante anterior: {est.nombre}")
        est.nombre = nuevo_nombre
        session.commit()
        print(f" Nombre actualizado a: {nuevo_nombre}")
    else:
        print("Estudiante no encontrado")


# ELIMINAR ESTUDIANTE
def eliminar_estudiante(estudiante_id):
    est = session.query(Estudiante).filter_by(id=estudiante_id).first()
    if est:
        # Borrar inscripciones primero
        session.query(Inscripcion).filter_by(estudiante_id=estudiante_id).delete()
        session.delete(est)
        session.commit()
        print(f"Estudiante '{est.nombre}' y sus inscripciones fueron eliminados")
    else:
        print("Estudiante no encontrado")



# EJEMPLOS DE USO
#Crear estudiante
crear_estudiante(
    nombre="Carlos Tun",
    email="carlos.tun@uni.gt",
    fecha_nac=date(2002, 4, 23),
    sexo=SexoEnum.M,
    carrera_id=1,
    cursos_ids=[1, 2]
)

listar_estudiantes()

# Editar estudiante 
editar_estudiante(estudiante_id=1, nuevo_nombre="Carlos Ernesto Tun")

# Eliminar estudiante
eliminar_estudiante(estudiante_id=2)

# Ver todos los estudiantes de nuevo
listar_estudiantes()