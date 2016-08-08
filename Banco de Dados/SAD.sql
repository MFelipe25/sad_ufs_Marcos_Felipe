CREATE TABLE genero (
  cod_genero INTEGER NOT NULL,
  desc_genero VARCHAR(20) NOT NULL,
  PRIMARY KEY(cod_genero)
)
;

CREATE TABLE midia (
  tipo_midia INTEGER NOT NULL,
  desc_midia VARCHAR(15) NOT NULL,
  fator_mult FLOAT NOT NULL,
  PRIMARY KEY(tipo_midia)
)
;

CREATE TABLE valorlocacao (
  titulo_status VARCHAR(10) NOT NULL,
  valor FLOAT NOT NULL,
  PRIMARY KEY(titulo_status)
)
;

CREATE TABLE dependente (
  cd_dependente INTEGER NOT NULL,
  nome_dependente VARCHAR(50) NOT NULL,
  data_cadastro DATE NOT NULL,
  limite_titulos INTEGER NOT NULL,
  PRIMARY KEY(cd_dependente)
)
;

CREATE TABLE cliente (
  cod_cliente INTEGER NOT NULL,
  nome VARCHAR(50) NOT NULL,
  endereco VARCHAR(80) NOT NULL,
  telefone VARCHAR(15) NOT NULL,
  CPF VARCHAR(11) NOT NULL,
  flag_depend INTEGER NOT NULL,
  data_cadastro DATE NOT NULL,
  PRIMARY KEY(cod_cliente)
)
;

CREATE TABLE cliente_dependente (
  cod_cliente INTEGER NOT NULL,
  cd_dependente INTEGER NOT NULL,
  PRIMARY KEY(cod_cliente, cd_dependente),
  FOREIGN KEY(cod_cliente)
    REFERENCES cliente(cod_cliente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(cd_dependente)
    REFERENCES dependente(cd_dependente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
)
;

CREATE TABLE titulo (
  cod_titulo INTEGER NOT NULL,
  cod_genero INTEGER NOT NULL,
  titulo_status VARCHAR(10) NOT NULL,
  tipo_midia INTEGER NOT NULL,
  ano INTEGER NOT NULL,
  produtor VARCHAR(50) NOT NULL,
  diretor VARCHAR(50) NOT NULL,
  elenco TEXT NOT NULL,
  pais VARCHAR(30) NOT NULL,
  sinopse TEXT NOT NULL,
  qtde_copias INTEGER NOT NULL,
  data_cadastro DATE NOT NULL,
  nome_original VARCHAR(30) NOT NULL,
  nome_portugues VARCHAR(30) NOT NULL,
  distribuidora VARCHAR(20) NOT NULL,
  censura INTEGER NOT NULL,
  PRIMARY KEY(cod_titulo),
  FOREIGN KEY(tipo_midia)
    REFERENCES midia(tipo_midia)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(titulo_status)
    REFERENCES valorlocacao(titulo_status)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(cod_genero)
    REFERENCES genero(cod_genero)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
)
;

CREATE TABLE debitocliente (
  cod_titulo INTEGER NOT NULL,
  cod_cliente INTEGER NOT NULL,
  data_emprestimo DATE NOT NULL,
  data_devolucao DATE NOT NULL,
  total FLOAT NOT NULL,
  PRIMARY KEY(cod_titulo, cod_cliente),
  FOREIGN KEY(cod_cliente)
    REFERENCES cliente(cod_cliente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(cod_titulo)
    REFERENCES titulo(cod_titulo)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
)
;