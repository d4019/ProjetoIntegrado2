USE living_model;

-- Carregar Cliente
INSERT INTO cliente (id_cliente, nome, email, telefone)
VALUES (1, 'Joao Silva', 'joao@email.com', '11999990001');

INSERT INTO cliente (id_cliente, nome, email, telefone)
VALUES (2, 'Maria Souza', 'maria@email.com', '11999990002');

INSERT INTO cliente (id_cliente, nome, email, telefone)
VALUES (3, 'Carlos Lima', 'carlos@email.com', '11999990003');

-- Carregar Usuario
INSERT INTO usuario (id_usuario, nome, email, perfil)
VALUES (1, 'Pedro Martins', 'pedro@livingmodel.com', 'Consultor Comercial');

INSERT INTO usuario (id_usuario, nome, email, perfil)
VALUES (2, 'Ana Costa', 'ana@livingmodel.com', 'Arquiteto');

INSERT INTO usuario (id_usuario, nome, email, perfil)
VALUES (3, 'Lucas Rocha', 'lucas@livingmodel.com', 'Tecnico Instalador');

-- Carregar Imovel
INSERT INTO imovel (id_imovel, endereco, tipo, area)
VALUES (1, 'Rua das Flores, 120 - Sao Paulo', 'Apartamento', 180.00);

INSERT INTO imovel (id_imovel, endereco, tipo, area)
VALUES (2, 'Alameda Santos, 850 - Sao Paulo', 'Casa', 320.00);

INSERT INTO imovel (id_imovel, endereco, tipo, area)
VALUES (3, 'Av. Brigadeiro Faria Lima, 1500 - Sao Paulo', 'Escritorio', 250.00);

-- Carregar Servico
INSERT INTO servico (id_servico, descricao, valor)
VALUES (1, 'Instalacao de iluminacao inteligente', 1500.00);

INSERT INTO servico (id_servico, descricao, valor)
VALUES (2, 'Automacao de persianas', 1200.00);

INSERT INTO servico (id_servico, descricao, valor)
VALUES (3, 'Configuracao de climatizacao', 1800.00);

-- Carregar Protocolo
INSERT INTO protocolo (id_protocolo, nome)
VALUES (1, 'Wi-Fi');

INSERT INTO protocolo (id_protocolo, nome)
VALUES (2, 'Zigbee');

INSERT INTO protocolo (id_protocolo, nome)
VALUES (3, 'Z-Wave');

-- Carregar Projeto
INSERT INTO projeto (id_projeto, nome, status, data_criacao, id_cliente, id_imovel)
VALUES (1, 'Automacao Apartamento Joao', 'Em andamento', '2026-10-01', 1, 1);

INSERT INTO projeto (id_projeto, nome, status, data_criacao, id_cliente, id_imovel)
VALUES (2, 'Casa Inteligente Maria', 'Planejamento', '2026-10-05', 2, 2);

INSERT INTO projeto (id_projeto, nome, status, data_criacao, id_cliente, id_imovel)
VALUES (3, 'Automacao Escritorio Carlos', 'Orcamento', '2026-10-10', 3, 3);

-- Carregar Ambiente
INSERT INTO ambiente (id_ambiente, nome, tipo, id_imovel)
VALUES (1, 'Sala de Estar', 'Social', 1);

INSERT INTO ambiente (id_ambiente, nome, tipo, id_imovel)
VALUES (2, 'Quarto Principal', 'Privativo', 2);

INSERT INTO ambiente (id_ambiente, nome, tipo, id_imovel)
VALUES (3, 'Sala de Reuniao', 'Corporativo', 3);

-- Carregar Dispositivo
INSERT INTO dispositivo (id_dispositivo, nome, modelo, valor, id_ambiente)
VALUES (1, 'Dimmer Inteligente', 'DIM-402', 850.00, 1);

INSERT INTO dispositivo (id_dispositivo, nome, modelo, valor, id_ambiente)
VALUES (2, 'Termostato Smart', 'FX-FC2', 1200.00, 2);

INSERT INTO dispositivo (id_dispositivo, nome, modelo, valor, id_ambiente)
VALUES (3, 'Sensor de Presenca', 'MIR360', 450.00, 3);

-- Carregar Orcamento
INSERT INTO orcamento (id_orcamento, valor_total, data_orcamento, status, id_projeto)
VALUES (1, 8500.00, '2026-10-12', 'Em analise', 1);

INSERT INTO orcamento (id_orcamento, valor_total, data_orcamento, status, id_projeto)
VALUES (2, 12500.00, '2026-10-13', 'Aprovado', 2);

INSERT INTO orcamento (id_orcamento, valor_total, data_orcamento, status, id_projeto)
VALUES (3, 9800.00, '2026-10-14', 'Pendente', 3);

-- Carregar Proposta
INSERT INTO proposta (id_proposta, data_emissao, validade, status, id_orcamento)
VALUES (1, '2026-10-13', '2026-11-13', 'Enviada', 1);

INSERT INTO proposta (id_proposta, data_emissao, validade, status, id_orcamento)
VALUES (2, '2026-10-14', '2026-11-14', 'Aprovada', 2);

INSERT INTO proposta (id_proposta, data_emissao, validade, status, id_orcamento)
VALUES (3, '2026-10-15', '2026-11-15', 'Pendente', 3);

-- Carregar Projeto_Servico
INSERT INTO projeto_servico (id_projeto, id_servico)
VALUES (1, 1);

INSERT INTO projeto_servico (id_projeto, id_servico)
VALUES (2, 2);

INSERT INTO projeto_servico (id_projeto, id_servico)
VALUES (3, 3);

-- Carregar Usuario_Projeto
INSERT INTO usuario_projeto (id_usuario, id_projeto)
VALUES (1, 1);

INSERT INTO usuario_projeto (id_usuario, id_projeto)
VALUES (2, 2);

INSERT INTO usuario_projeto (id_usuario, id_projeto)
VALUES (3, 3);

-- Carregar Dispositivo_Protocolo
INSERT INTO dispositivo_protocolo (id_dispositivo, id_protocolo)
VALUES (1, 1);

INSERT INTO dispositivo_protocolo (id_dispositivo, id_protocolo)
VALUES (2, 2);

INSERT INTO dispositivo_protocolo (id_dispositivo, id_protocolo)
VALUES (3, 3);