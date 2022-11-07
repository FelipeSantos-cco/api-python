# API Python para projeto da ETEC
# tbAluno = Consultar, Cadastrar, Inserir e excluir
# tbProf = Consultar, Cadastrar, Inserir e excluir
# tbLab = Consultar, Cadastrar, Inserir e excluir
# tbPedMnt = Consultar, Cadastrar, Inserir e excluir
# tbRespMnt = Consultar, Cadastrar, Inserir e excluir
from flask import Flask, jsonify, request
import mysql.connector 

app = Flask(__name__)

mydb = mysql.connector.connect(host="localhost", user="root", password="", database="bdetecapi")
mycursor = mydb.cursor()

# ------ TB ALUNOS -----------

# Consultar TODOS OS ALUNOS
@app.route('/alunos', methods=['GET'])
def consultar_alunos():
    mycursor.execute("SELECT * FROM tbAluno")
    alunos = mycursor.fetchall()
    return jsonify(alunos)


# ------ TB PROF -----------

# Consultar TODOS OS PROFESSORES
@app.route('/professores', methods=['GET'])
def consultar_prefessores():
    mycursor.execute("SELECT * FROM tbProf")
    profs = mycursor.fetchall()
    return jsonify(profs)




app.run(port=8000,host='localhost',debug=True)