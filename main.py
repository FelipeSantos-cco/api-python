from flask import Flask, jsonify, request
import mysql.connector 

app = Flask(__name__)

mydb = mysql.connector.connect(host="localhost", user="root", password="", database="bdetecapi2")
mycursor = mydb.cursor()

@app.route('/', methods=['GET'])
def index():
    geral = "<h1>Consultas</h1>"
    return (geral)

#=============== GET ==================

@app.route('/consulta', methods=['GET'])
def consulta_geral():
    mycursor.execute("SELECT * FROM tbpedido")
    pedidos = mycursor.fetchall()
    return jsonify(pedidos)

@app.route('/consulta/<int:id>', methods=['GET'])
def consulta_id(id):
    id = str(id)
    mycursor.execute("SELECT idPedido, periodo, curso, lab, computador, titulo, descPedido, nomeProf, nomeAluno	FROM tbPedido WHERE idPedido = "+id)
    pedidos = mycursor.fetchall()
    return jsonify(pedidos)

#============== POST ================

@app.route('/cadastro', methods=['POST'])
def cadastro_pedido():

    request_data = request.get_json()

    periodo = request_data["periodo"]
    curso = request_data["curso"]
    lab = request_data["lab"]
    computador = request_data["computador"]
    titulo = request_data["titulo"]
    descPedido = request_data["descPedido"]
    nomeProf = request_data["nomeProf"]
    nomeAluno = request_data["nomeAluno"]
    turma =  request_data["turma"]

    mycursor.execute("INSERT INTO tbpedido (periodo, curso, lab, computador, titulo, descPedido, nomeProf, nomeAluno, turma) VALUES('"+periodo+"', '"+curso+"', '"+lab+"', '"+computador+"', '"+titulo+"', '"+descPedido+"','"+nomeProf+"','"+nomeAluno+"', '"+turma+"' );")
    cadastro = mycursor.fetchall()
    ok = "ok"
    return jsonify(ok, cadastro)







app.run(port=8000,host='localhost',debug=True)