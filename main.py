from flask import Flask, jsonify, request
import mysql.connector 

app = Flask(__name__)

mydb = mysql.connector.connect(host="localhost", user="root", password="", database="bdetecapi2")
mycursor = mydb.cursor()

@app.route('/', methods=['GET'])
def index():
    geral = "<h1>Consultas</h1>"
    return (geral)

@app.route('/consulta', methods=['GET'])
def consulta_geral():
    mycursor.execute("SELECT * FROM tbpedido")