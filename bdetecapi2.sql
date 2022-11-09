CREATE TABLE IF NOT EXISTS tbPedido(
	idPedido INT PRIMARY KEY AUTO_INCREMENT
    , periodo VARCHAR(15) NOT NULL 
    , curso VARCHAR(50) NOT NULL
    , lab VARCHAR(5) NOT NULL
    , computador VARCHAR(50) NOT NULL
    , titulo VARCHAR(50)
    , descPedido TEXT NOT NULL
    , nomeProf TEXT 
    , nomeAluno TEXT
);

CREATE TABLE IF NOT EXISTS tbAdm(
	idAdm INT PRIMARY KEY AUTO_INCREMENT
    , userAdm VARCHAR(64) NOT NULL
    , emailAdm VARCHAR(64) NOT NULL
    , senhaAdm VARCHAR(64) NOT NULL
);