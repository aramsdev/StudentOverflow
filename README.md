# Proyecto de Gestión de Preguntas y Respuestas

Este proyecto es una aplicación web desarrollada con **Flask** y **SQLAlchemy** que permite a los usuarios registrar cuentas, iniciar sesión, publicar preguntas y respuestas, y administrar sus interacciones.

## **Requisitos**

Antes de ejecutar el proyecto, asegúrate de tener las siguientes herramientas instaladas:

- Python 3.8+
- pip (administrador de paquetes de Python)
- Un entorno virtual como `venv`
- Una base de datos SQLite (o cualquier otra compatible con SQLAlchemy)

## **Paqueterías necesarias**

Las dependencias necesarias están definidas en el archivo `requirements.txt`. Puedes instalarlas ejecutando:

```bash
pip install -r requirements.txt
```

1. Clona este repositorio

```bash
git clone https://github.com/TU_USUARIO/nombre-del-repositorio.git
cd nombre-del-repositorio
```

2. Crea un entorno virtual
```bash
python -m venv venv
source venv/bin/activate        # En Linux/Mac
venv\Scripts\activate           # En Windows
```

3. Instala las dependencias
```bash
pip install -r requirements.txt
```
Descarga el archivo de la base de datos que se encuentra en entregables/documentacion/bd/archivo.sql e instalalo.

4. Ejecuta la aplicacion
```bash
python3 run.py
```

Tu aplicación estará corriendo en http://127.0.0.1:5050/