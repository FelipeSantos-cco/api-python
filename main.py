from flask import Flask, jsonify, request
import mysql.connector 

app = Flask(__name__)

try: 
    mydb = mysql.connector.connect(host="localhost", user="root", password="", database="bdetecapi2")
    cursor = mydb.cursor()

    print("Conexão com o banco OK\n\n\n")
except:
    print("\nErro na conexão com o Banco\n")
    exit()

@app.route('/', methods=['GET'])
def index():
    geral = """
            <h1>Consultas</h1>
            <table>
                <tr><td>GET</td> <td>/consulta</td></tr>
                <tr><td>GET</td> <td>/consulta/[id]</td></tr>
                <tr><td>POST</td> <td>/cadastro</td></tr>
                <tr><td>PUT</td> <td>/alterar</td></tr>
                <tr><td>DELETE</td> <td>/deletar/[id]</td></tr>
            </table>
            """
    return (geral)

#=============== GET ==================

@app.route('/consulta', methods=['GET'])
def consulta_geral():
    cursor.execute("SELECT * FROM tbpedido")
    pedidos = cursor.fetchall()
    return jsonify(pedidos)

@app.route('/consulta/<int:id>', methods=['GET'])
def consulta_id(id):
    id = str(id)
    cursor.execute("SELECT idPedido, periodo, curso, lab, computador, titulo, descPedido, nomeProf, nomeAluno	FROM tbPedido WHERE idPedido = "+id)
    pedidos = cursor.fetchall()
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

    insert = "INSERT INTO tbpedido (periodo, curso, lab, computador, titulo, descPedido, nomeProf, nomeAluno, turma) VALUES('"+periodo+"', '"+curso+"', '"+lab+"', '"+computador+"', '"+titulo+"', '"+descPedido+"','"+nomeProf+"','"+nomeAluno+"', '"+turma+"' );"
    
    cursor.execute(insert)
    mydb.commit()
    
    #Verificação no Aplicativo
    ok = "ok"

    return jsonify(ok)

# ======== DELETE ============

@app.route('/deletar/<int:id>', methods=['DELETE'])
def deletar_pedido(id):
    id = str(id)
    delete = "DELETE FROM tbpedido WHERE idPedido = "+id
    cursor.execute(delete)
    mydb.commit()

    ok = "ok"
    return jsonify(ok)

# ======== PUT ===============

@app.route('/alterar/<int:id>', methods=['PUT'])
def alterar_pedido(id):
    id = str(id)

    request_data = request.get_json()

    titulo = request_data["titulo"]
    lab = request_data["lab"]
    computador = request_data["computador"]
    descPedido = request_data["descPedido"]
    ok = "ok"

    try:
        alterar = "UPDATE tbpedido SET tbpedido.titulo = '"+titulo+"', tbpedido.lab = '"+lab+"', tbpedido.computador = '"+computador+"', tbpedido.descPedido = '"+descPedido+"' WHERE tbpedido.idPedido = "+id+";"
        cursor.execute(alterar)
        mydb.commit()

        return jsonify(ok)

    except:
        print("A alteração deu errado")


# Rodar o servidor
app.run(port=80, host='localhost',debug=True)