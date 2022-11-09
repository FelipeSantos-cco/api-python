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


# index
@app.route('/', methods=['GET'])
def index():
    geral = """
            /aluno/help         => Ajuda sobre TB aluno </br>
            /professores/help   => Ajuda sobre TB prof  </br>
            /labs/help          => Ajuda sobre TB labs  </br>
            /pedmnt/help        => Ajuda sobre TB PedMnt (Pedidos de Manutenção) </br>
            /respmnt/help       => Ajuda sobre TB RespMnt (Resposta de Manutenção)
            """
    return (geral)


# ------ TB ALUNOS -----------

# HELP
@app.route('/aluno/help', methods=['GET'])
def help_alunos():
    help = """
            /alunos = Consulta geral </br>
            /aluno/id = Consulta por ID do aluno </br>
            /aluno/cadastrar = Cadastro de aluno
            """
    return (help)


# Consultar TODOS OS ALUNOS
@app.route('/alunos', methods=['GET'])
def consultar_alunos():
    mycursor.execute("SELECT * FROM tbAluno")
    alunos = mycursor.fetchall()
    return jsonify(alunos)

# Consultar ALUNO PELO ID
@app.route('/aluno/<int:id>',methods=['GET'])
def consultar_aluno_id(id):
    id = str(id)
    mycursor.execute("SELECT idAluno, nomeAluno, rmAluno, turmaAluno, periodoAluno FROM tbAluno WHERE idAluno = " + id)
    aluno = mycursor.fetchall()
    return jsonify(aluno)

# CADASTRAR ALUNO
@app.route('/aluno/cadastrar',methods=[POST])
def cadastrar_aluno():
    mycursor.execute("SELECT * FROM tbProf")
    profs = mycursor.fetchall()



# ------ TB PROF -----------

# Consultar TODOS OS PROFESSORES
@app.route('/professores', methods=['GET'])
def consultar_prefessores():
    mycursor.execute("SELECT * FROM tbProf")
    profs = mycursor.fetchall()
    return jsonify(profs)




# ------ TB LABORATÓRIOS -----------

# Consultar TODOS OS LABS 
@app.route('/labs', methods=['GET'])
def consultar_labs():
    mycursor.execute("SELECT * FROM tbLab")
    labs = mycursor.fetchall()
    return jsonify(labs)


# ------ TB PEDMNT -----------

# Consultar TODOS OS PEDIDOS DE MANUTENÇÃO
@app.route('/pedmnt', methods=['GET'])
def consultar_pedmnt():
    mycursor.execute("SELECT * FROM tbpedmnt")
    pedidos = mycursor.fetchall()
    return jsonify(pedidos)


# ------ TB RESPMNT ----------- 

# Consultar TODOS AS RESPOSTAS DE MANUTENÇÃO
@app.route('/respmnt', methods=['GET'])
def consultar_respmnt():
    mycursor.execute("SELECT * FROM tbrespmnt")
    respostas = mycursor.fetchall()
    return jsonify(respostas)


# Rodar API
app.run(port=8000,host='localhost',debug=True)