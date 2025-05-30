from sqlalchemy import Column, Integer, String, Date, Enum, ForeignKey, CheckConstraint, UniqueConstraint, Numeric, TIMESTAMP, Table
from sqlalchemy.orm import relationship
from database import Base
import enum

# Tipo ENUM personalizado
class SexoEnum(enum.Enum):
    M = "M"
    F = "F"
    Otro = "Otro"

# Tabla intermedia: inscripción
class Inscripcion(Base):
    __tablename__ = "inscripcion"
    id = Column(Integer, primary_key=True)
    estudiante_id = Column(Integer, ForeignKey("estudiante.id"), nullable=False)
    curso_id = Column(Integer, ForeignKey("curso.id"), nullable=False)
    fecha_inscripcion = Column(TIMESTAMP, nullable=False)
    nota_final = Column(Numeric(5, 2), CheckConstraint('nota_final >= 0 AND nota_final <= 100'))

    __table_args__ = (UniqueConstraint('estudiante_id', 'curso_id', name='uq_insc_estudiante_curso'),)

# Carrera
class Carrera(Base):
    __tablename__ = "carrera"
    id = Column(Integer, primary_key=True)
    nombre = Column(String, nullable=False)
    facultad = Column(String, nullable=False)
    codigo_interno = Column(String(6), nullable=False, unique=True)

# Curso
class Curso(Base):
    __tablename__ = "curso"
    id = Column(Integer, primary_key=True)
    nombre = Column(String, nullable=False)
    codigo = Column(String, nullable=False, unique=True)
    creditos = Column(Integer, CheckConstraint('creditos > 0'), nullable=False)
    semestre = Column(Integer, CheckConstraint('semestre BETWEEN 1 AND 12'), nullable=False)

# Estudiante
class Estudiante(Base):
    __tablename__ = "estudiante"
    id = Column(Integer, primary_key=True)
    nombre = Column(String, nullable=False)
    email = Column(String, nullable=False, unique=True)
    fecha_nacimiento = Column(Date, nullable=False)
    sexo = Column(Enum(SexoEnum), nullable=False)
    carrera_id = Column(Integer, ForeignKey("carrera.id"), nullable=False)

    carrera = relationship("Carrera")
    cursos = relationship("Inscripcion", backref="estudiante")
