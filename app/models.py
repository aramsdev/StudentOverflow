from datetime import datetime
from app import db
from flask_login import UserMixin

# Modelo Usuario
class Usuario(db.Model, UserMixin):
    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(100), nullable=False)
    correo_electronico = db.Column(db.String(120), unique=True, nullable=False)
    contrasena = db.Column(db.String(255), nullable=False)
    fecha_creacion = db.Column(db.DateTime, default=datetime.utcnow)

# Modelo Pregunta
class Pregunta(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    titulo = db.Column(db.String(255), nullable=False)
    cuerpo = db.Column(db.Text, nullable=False)
    fecha_publicacion = db.Column(db.DateTime, default=datetime.utcnow)
    id_usuario = db.Column(db.Integer, db.ForeignKey('usuario.id'), nullable=False)
    respuestas = db.relationship('Respuesta', backref='pregunta_asociada', lazy=True)
    usuario = db.relationship('Usuario', backref='preguntas', lazy=True)
    
    def get_formatted_date(self):
        return self.fecha_publicacion.strftime('%Y-%m-%d')

# Modelo Respuesta
class Respuesta(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    contenido = db.Column(db.Text, nullable=False)
    fecha_creacion = db.Column(db.DateTime, default=datetime.utcnow)
    id_usuario = db.Column(db.Integer, db.ForeignKey('usuario.id'), nullable=False)
    usuario = db.relationship('Usuario', backref='respuestas', lazy=True)
    id_pregunta = db.Column(db.Integer, db.ForeignKey('pregunta.id'), nullable=False)