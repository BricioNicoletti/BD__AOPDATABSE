use aopdados;
create table Endereco(
	enderecoID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    bairro VARCHAR(20) NOT NULL,
    cidade varchar(20) NOT NULL,
    estado VARCHAR(15)
);

create table Telefone(
    telefoneID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    DDD INT (2),
    Numero int(9)
);

create table Posto(
	postoID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    telefoneID int,
    enderecoID int,
	FOREIGN KEY (telefoneID) REFERENCES Telefone(telefoneID),
	FOREIGN KEY (enderecoID) REFERENCES Endereco(enderecoID)
);

create table Combustivel(
	ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    postoID int,
    FOREIGN KEY (postoID) REFERENCES Posto(postoID),
    combustivel_name varchar(25) NOT NULL,
    preco double(3,2)
);

create table Combustivel_historico(
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_combustivel varchar(50),
    preco_combustivel double(3,2),
    operacao varchar(10),
    data_modificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER after_combustiveis_insert
AFTER INSERT ON Combustivel
FOR EACH ROW
BEGIN
    INSERT INTO combustivel_historico (nome_combustivel, operacao)
    VALUES (NEW.combustivel_name, 'INSERT');
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER after_combustiveis_update
AFTER UPDATE ON Combustivel
FOR EACH ROW
BEGIN
    INSERT INTO combustivel_historico (nome_combustivel, operacao)
    VALUES (NEW.combustivel_name, 'UPDATE');
END;
//

DELIMITER ;

INSERT INTO Endereco(rua, numero, bairro, cidade, estado)
VALUES ('Rod. do Sol', '2777', 'Portal de Anchieta', 'Anchieta', 'ES');

INSERT INTO Endereco(rua, numero, bairro, cidade, estado)
VALUES('Av. Zumira Rosa Antunes', '455', 'Justiça I', 'Anchieta', 'ES');

INSERT INTO Endereco(rua, numero, bairro, cidade, estado)
VALUES('Rod. do Sol', 'S/N', 'Iriri', 'Anchieta', 'ES');

INSERT INTO Telefone(DDD, Numero)
VALUES(28, 99928-6013);

INSERT INTO Telefone(DDD, Numero)
VALUES(28, 99979-6501);

INSERT INTO Telefone(DDD, Numero)
VALUES(28, 3534-1154);

select * from Endereco; 

INSERT INTO Posto(Nome, telefoneID, enderecoID)
VALUES('Caravelas', 1, 1);

select * from Posto; 

INSERT INTO Posto(Nome, telefoneID, enderecoID)
VALUES('Shell', 2, 2);

INSERT INTO Posto(Nome, telefoneID, enderecoID)
VALUES('Albatroz', 3, 3);

INSERT INTO Combustivel(postoID, combustivel_name, preco)
VALUES(1, 'Gasolina', 6.25);

select * from combustivel;

INSERT INTO Combustivel(postoID, combustivel_name, preco)
VALUES(1, 'Gasolina Aditivada', 6.45);

INSERT INTO Combustivel(postoID, combustivel_name, preco)
VALUES(1, 'Etanol', 4.79);

INSERT INTO Combustivel(postoID, combustivel_name, preco)
VALUES(1, 'Diesel', 6.17);


INSERT INTO Combustivel(postoID, combustivel_name, preco)
VALUES(2, 'Gasolina', 6.25);

INSERT INTO Combustivel(postoID, combustivel_name, preco)
VALUES(2, 'Gasolina Aditivada', 6.55);

INSERT INTO Combustivel(postoID, combustivel_name, preco)
VALUES(2, 'Etanol', 4.87);

INSERT INTO Combustivel(postoID, combustivel_name, preco)
VALUES(2, 'Diesel', 5.99);

INSERT INTO Combustivel(postoID, combustivel_name, preco)
VALUES(3, 'Gasolina', 6.27);

INSERT INTO Combustivel(postoID, combustivel_name, preco)
VALUES(3, 'Gasolina Aditivada', 6.51);

INSERT INTO Combustivel(postoID, combustivel_name, preco)
VALUES(3, 'Etanol', 4.83);

INSERT INTO Combustivel(postoID, combustivel_name, preco)
VALUES(3, 'Diesel', 6.07);

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.25, 'insert');

select * from combustivel_historico;

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.25, 'insert');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.27, 'insert');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.45, 'insert');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.55, 'insert');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.51, 'insert');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.79, 'insert');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.87, 'insert');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.83, 'insert');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 6.17, 'insert');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 5.99, 'insert');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 6.07, 'insert');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.25, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.27, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.45, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.55, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.51, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.79, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.87, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.83, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 6.17, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 5.99, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 6.07, 'update'); -

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.25, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.25, 'update');


INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.27, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.45, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.55, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.51, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.79, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.87, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.83, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 6.17, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 5.99, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 6.07, 'update'); 

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.25, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.25, 'update');


INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.27, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.45, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.55, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.51, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.79, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.87, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.83, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 6.17, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 5.99, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 6.07, 'update'); 

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.25, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.25, 'update');


INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.27, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.45, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.55, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.51, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.79, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.87, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.83, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 6.17, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 5.99, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 6.07, 'update'); 

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.25, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.25, 'update');


INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.27, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.45, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.55, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.51, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.79, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.87, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.83, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 6.17, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 5.99, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 6.07, 'update'); 

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.25, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.25, 'update');


INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.27, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.45, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.55, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.51, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.79, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.87, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.83, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 6.17, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 5.99, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 6.07, 'update'); 

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.25, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.25, 'update');


INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.27, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.45, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.55, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.51, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.79, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.87, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.83, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 6.17, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 5.99, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 6.07, 'update'); 

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.25, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.25, 'update');


INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.27, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.45, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.55, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.51, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.79, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.87, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.83, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 6.17, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 5.99, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 6.07, 'update'); 

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.20, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.20, 'update');


INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina', 6.19, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.44, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.51, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Gasolina Aditivada', 6.47, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.77, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.85, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Etanol', 4.81, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 6.14, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 5.95, 'update');

INSERT INTO combustivel_historico(nome_combustivel, preco_combustivel, operacao)
VALUES('Diesel', 6.04, 'update'); 









 