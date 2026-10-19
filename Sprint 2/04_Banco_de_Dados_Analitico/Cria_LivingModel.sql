SET FOREIGN_KEY_CHECKS = 0;
CREATE SCHEMA IF NOT EXISTS living_model DEFAULT CHARACTER SET utf8mb4;

USE living_model;

-- Tabela Cliente
DROP TABLE IF EXISTS cliente;

CREATE TABLE IF NOT EXISTS cliente (
    id_cliente INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NULL,
    telefone VARCHAR(20) NULL,
    PRIMARY KEY (id_cliente)
) ENGINE = InnoDB;

-- Tabela Usuario
DROP TABLE IF EXISTS usuario;

CREATE TABLE IF NOT EXISTS usuario (
    id_usuario INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    perfil VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_usuario)
) ENGINE = InnoDB;

-- Tabela Imovel
DROP TABLE IF EXISTS imovel;

CREATE TABLE IF NOT EXISTS imovel (
    id_imovel INT NOT NULL,
    endereco VARCHAR(150) NOT NULL,
    tipo VARCHAR(50) NULL,
    area DECIMAL(10,2) NULL,
    PRIMARY KEY (id_imovel)
) ENGINE = InnoDB;

-- Tabela Servico
DROP TABLE IF EXISTS servico;

CREATE TABLE IF NOT EXISTS servico (
    id_servico INT NOT NULL,
    descricao VARCHAR(150) NOT NULL,
    valor DECIMAL(10,2) NULL,
    PRIMARY KEY (id_servico)
) ENGINE = InnoDB;

-- Tabela Protocolo
DROP TABLE IF EXISTS protocolo;

CREATE TABLE IF NOT EXISTS protocolo (
    id_protocolo INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_protocolo)
) ENGINE = InnoDB;

-- Tabela Proposta
DROP TABLE IF EXISTS proposta;

CREATE TABLE IF NOT EXISTS proposta (
    id_proposta INT NOT NULL,
    data_emissao DATE NULL,
    validade DATE NULL,
    status VARCHAR(50) NULL,
    PRIMARY KEY (id_proposta)
) ENGINE = InnoDB;

-- Tabela Projeto
DROP TABLE IF EXISTS projeto;

CREATE TABLE IF NOT EXISTS projeto (
    id_projeto INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    status VARCHAR(50) NULL,
    data_criacao DATE NULL,
    id_cliente INT NOT NULL,
    id_imovel INT NOT NULL,

    PRIMARY KEY (id_projeto),

    CONSTRAINT projeto_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES cliente (id_cliente),

    CONSTRAINT projeto_imovel
        FOREIGN KEY (id_imovel)
        REFERENCES imovel (id_imovel)
) ENGINE = InnoDB;

-- Tabela Ambiente
DROP TABLE IF EXISTS ambiente;

CREATE TABLE IF NOT EXISTS ambiente (
    id_ambiente INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NULL,
    id_imovel INT NOT NULL,

    PRIMARY KEY (id_ambiente),

    CONSTRAINT ambiente_imovel
        FOREIGN KEY (id_imovel)
        REFERENCES imovel (id_imovel)
) ENGINE = InnoDB;

-- Tabela Dispositivo
DROP TABLE IF EXISTS dispositivo;

CREATE TABLE IF NOT EXISTS dispositivo (
    id_dispositivo INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    modelo VARCHAR(100) NULL,
    valor DECIMAL(10,2) NULL,
    id_ambiente INT NOT NULL,

    PRIMARY KEY (id_dispositivo),

    CONSTRAINT dispositivo_ambiente
        FOREIGN KEY (id_ambiente)
        REFERENCES ambiente (id_ambiente)
) ENGINE = InnoDB;

-- Tabela Orcamento
DROP TABLE IF EXISTS orcamento;

CREATE TABLE IF NOT EXISTS orcamento (
    id_orcamento INT NOT NULL,
    valor_total DECIMAL(10,2) NULL,
    data_orcamento DATE NULL,
    status VARCHAR(50) NULL,
    id_projeto INT NOT NULL,

    PRIMARY KEY (id_orcamento),

    CONSTRAINT orcamento_projeto
        FOREIGN KEY (id_projeto)
        REFERENCES projeto (id_projeto)
) ENGINE = InnoDB;

-- Relacionar Proposta com Orcamento
ALTER TABLE proposta
    ADD COLUMN id_orcamento INT NOT NULL,
    ADD CONSTRAINT proposta_orcamento_unique
        UNIQUE (id_orcamento),
    ADD CONSTRAINT proposta_orcamento
        FOREIGN KEY (id_orcamento)
        REFERENCES orcamento (id_orcamento);
        
-- Tabela Projeto_Servico
DROP TABLE IF EXISTS projeto_servico;

CREATE TABLE IF NOT EXISTS projeto_servico (
    id_projeto INT NOT NULL,
    id_servico INT NOT NULL,

    PRIMARY KEY (id_projeto, id_servico),

    CONSTRAINT projeto_servico_projeto
        FOREIGN KEY (id_projeto)
        REFERENCES projeto (id_projeto),

    CONSTRAINT projeto_servico_servico
        FOREIGN KEY (id_servico)
        REFERENCES servico (id_servico)
) ENGINE = InnoDB;

-- Tabela Usuario_Projeto
DROP TABLE IF EXISTS usuario_projeto;

CREATE TABLE IF NOT EXISTS usuario_projeto (
    id_usuario INT NOT NULL,
    id_projeto INT NOT NULL,

    PRIMARY KEY (id_usuario, id_projeto),

    CONSTRAINT usuario_projeto_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario (id_usuario),

    CONSTRAINT usuario_projeto_projeto
        FOREIGN KEY (id_projeto)
        REFERENCES projeto (id_projeto)
) ENGINE = InnoDB;

-- Tabela Dispositivo_Protocolo
DROP TABLE IF EXISTS dispositivo_protocolo;

CREATE TABLE IF NOT EXISTS dispositivo_protocolo (
    id_dispositivo INT NOT NULL,
    id_protocolo INT NOT NULL,

    PRIMARY KEY (id_dispositivo, id_protocolo),

    CONSTRAINT dispositivo_protocolo_dispositivo
        FOREIGN KEY (id_dispositivo)
        REFERENCES dispositivo (id_dispositivo),

    CONSTRAINT dispositivo_protocolo_protocolo
        FOREIGN KEY (id_protocolo)
        REFERENCES protocolo (id_protocolo)
) ENGINE = InnoDB;
SET FOREIGN_KEY_CHECKS = 1;