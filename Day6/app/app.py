from flask import Flask, jsonify, request
import os
import pyodbc

app = Flask(__name__)


def get_connection():
    server = os.environ["SQL_SERVER"]
    database = os.environ["SQL_DATABASE"]
    username = os.environ["SQL_USERNAME"]
    password = os.environ["SQL_PASSWORD"]

    connection_string = (
        "DRIVER={ODBC Driver 18 for SQL Server};"
        f"SERVER={server};"
        f"DATABASE={database};"
        f"UID={username};"
        f"PWD={password};"
        "Encrypt=yes;"
        "TrustServerCertificate=no;"
        "Connection Timeout=30;"
    )

    return pyodbc.connect(connection_string)


@app.route("/")
def home():
    return "Day 6 Flask API is running!"


@app.route("/init", methods=["POST"])
def init_database():
    connection = get_connection()
    cursor = connection.cursor()

    cursor.execute("""
        IF NOT EXISTS (
            SELECT * FROM sysobjects
            WHERE name='students' AND xtype='U'
        )
        CREATE TABLE students (
            id INT IDENTITY(1,1) PRIMARY KEY,
            name NVARCHAR(100) NOT NULL,
            email NVARCHAR(150) NOT NULL
        )
    """)

    connection.commit()
    cursor.close()
    connection.close()

    return jsonify({"message": "Students table is ready"})


@app.route("/add", methods=["POST"])
def add_student():
    data = request.get_json()

    name = data["name"]
    email = data["email"]

    connection = get_connection()
    cursor = connection.cursor()

    cursor.execute(
        "INSERT INTO students (name, email) VALUES (?, ?)",
        name,
        email
    )

    connection.commit()
    cursor.close()
    connection.close()

    return jsonify({"message": "Student added successfully"}), 201


@app.route("/students", methods=["GET"])
def get_students():
    connection = get_connection()
    cursor = connection.cursor()

    cursor.execute(
        "SELECT id, name, email FROM students ORDER BY id"
    )

    students = []

    for row in cursor.fetchall():
        students.append({
            "id": row.id,
            "name": row.name,
            "email": row.email
        })

    cursor.close()
    connection.close()

    return jsonify(students)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)