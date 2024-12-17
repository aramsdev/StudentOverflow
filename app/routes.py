from flask import render_template, request, redirect, url_for, flash
from app import db
from app.models import Pregunta, Usuario, Respuesta
from flask import Blueprint, session

main = Blueprint('main', __name__)

# Página de inicio
@main.route('/')
def home():
    preguntas = Pregunta.query.all()
    return render_template('index.html', preguntas=preguntas)

@main.route('/register', methods=['GET','POST'])
def register():
    if 'user_id' in session:
        return redirect(url_for('main.home'))
    if request.method == 'POST':
        nombre = request.form['nombre']
        correo_electronico = request.form['correo_electronico']
        contrasena = request.form['contrasena']
        
        # Verificar si el nombre de usuario o el email ya existen en la base de datos
        existing_user = Usuario.query.filter_by(nombre=nombre).first()
        if existing_user:
            flash('El nombre de usuario ya está registrado. Por favor, elige otro.')
            return redirect(url_for('main.register'))
        
        # Crear el nuevo usuario
        new_user = Usuario(nombre=nombre, correo_electronico=correo_electronico, contrasena=contrasena)

        # Añadir el usuario a la base de datos
        db.session.add(new_user)
        db.session.commit()

        flash('Cuenta creada exitosamente. Ahora puedes iniciar sesión.')
        return redirect(url_for('main.login'))

    return render_template('register.html')

# Login
@main.route('/login', methods=['GET', 'POST'])
def login():
    if 'user_id' in session:
        return redirect(url_for('main.home'))
    if request.method == 'POST':
        nombre = request.form['nombre']
        contrasena = request.form['contrasena']
        
        user = Usuario.query.filter_by(nombre=nombre).first()
        
        if user and contrasena == user.contrasena:
            session['logged_in'] = True
            session['user_id'] = user.id 
            return redirect(url_for('main.home')) 
        else:
            flash('Nombre de usuario o contraseña incorrectos.')
            return redirect(url_for('main.login'))

    
    return render_template('login.html')

@main.route('/preguntar', methods=['GET', 'POST'])
def preguntar():
    if 'user_id' not in session:
        return redirect(url_for('main.login'))
    if request.method == 'POST':
        titulo = request.form['titulo']
        cuerpo = request.form['cuerpo']
        
        pregunta = Pregunta(titulo=titulo, cuerpo=cuerpo, id_usuario = session.get('user_id'))
        db.session.add(pregunta)
        db.session.commit()
        
        return redirect(url_for('main.home')) 
    
    return render_template('preguntar.html')

@main.route('/pregunta-detalle/<int:id>', methods=['GET', 'POST'])
def pregunta_detalle(id):  
    pregunta = Pregunta.query.get(id)
    respuestas = pregunta.respuestas
    if request.method == 'POST':
        contenido = request.form['contenido']
        
        respuesta = Respuesta(contenido=contenido, id_usuario = session.get('user_id'), id_pregunta = id)
        db.session.add(respuesta)
        db.session.commit()
        
        return redirect(url_for('main.home')) 
    
    return render_template('pregunta_detalle.html', pregunta=pregunta, respuestas=respuestas)

@main.route('/cerrar_sesion')
def cerrar_sesion():
    if 'user_id' in session:
        session.pop('user_id', None) 
        session.pop('logged_in', None) 

    return redirect(url_for('main.home'))

