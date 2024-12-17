from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
from config import Config  # Asegúrate de importar la clase Config desde config.py

db = SQLAlchemy()

def create_app():
    app = Flask(__name__)

    app.secret_key = 'aramsdev'
    # Cargar la configuración desde el archivo config.py
    app.config.from_object(Config)  # Aquí estamos cargando la clase Config desde config.py
    
    db.init_app(app)

    # Importar rutas y registrar los blueprints
    from app.routes import main

    app.register_blueprint(main)

    return app
