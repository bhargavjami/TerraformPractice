from flask import Flask, render_template, request
import pyodbc
import struct
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient

app = Flask(__name__)
credential = DefaultAzureCredential()

key_vault_url = "https://bhargav-day3-kv-2026.vault.azure.net/"

secret_client = SecretClient(
    vault_url=key_vault_url,
    credential=credential
)

def get_db_connection():
    credential = DefaultAzureCredential()

    token = credential.get_token(
        "https://database.windows.net/.default"
    )

    connection_string = (
        "Driver={ODBC Driver 18 for SQL Server};"
        "Server=tcp:bhargav-day3-sql-2026.database.windows.net,1433;"
        "Database=student-registration-db;"
        "Encrypt=yes;"
        "TrustServerCertificate=no;"
    )

    token_bytes = token.token.encode("utf-16-le")
    token_struct = struct.pack("=i", len(token_bytes)) + token_bytes

    connection = pyodbc.connect(
        connection_string,
        attrs_before={
            1256: token_struct
        }
    )

    return connection


@app.route("/")
def home():
    return render_template("index.html")


@app.route("/register", methods=["POST"])
def register():
    name = request.form["name"]
    email = request.form["email"]
    course = request.form["course"]
    
    secret = secret_client.get_secret("FLASK-SECRET-KEY")

    connection = get_db_connection()
    cursor = connection.cursor()

    cursor.execute(
        """
        INSERT INTO dbo.students (name, email, course)
        VALUES (?, ?, ?)
        """,
        name,
        email,
        course
    )

    connection.commit()

    cursor.close()
    connection.close()

    return f"Student {name} registered successfully!"


if __name__ == "__main__":
    app.run()
