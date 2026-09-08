-- Criação das Tabelas
CREATE TABLE categorias (
	id_categoria SERIAL PRIMARY KEY,
	nome_categoria VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE produtos (
	id_produto SERIAL PRIMARY KEY,
	nome_produto VARCHAR(100) NOT NULL UNIQUE,
	valor_produto NUMERIC(10,2) NOT NULL CHECK (valor_produto >0),
	qnt_produto INT NOT NULL DEFAULT 0 CHECK (qnt_produto>=0),
	id_categoria INT REFERENCES categorias (id_categoria)	
);

CREATE TABLE clientes (
    id_cliente     SERIAL PRIMARY KEY,
    nome_cliente   VARCHAR(100) NOT NULL,
    email_cliente  VARCHAR(100) NOT NULL UNIQUE,
    tel_cliente    VARCHAR(20),
    cidade_cliente VARCHAR(50),
    uf_cliente     VARCHAR(2),
    cpf_cliente    VARCHAR(14) NOT NULL UNIQUE
);

CREATE TABLE funcionarios (
    id_funcionario     SERIAL PRIMARY KEY,
    nome_funcionario   VARCHAR(100) NOT NULL,
    email_funcionario  VARCHAR(100) NOT NULL UNIQUE,
    cargo_funcionario  VARCHAR(20),
    cpf_funcionario    VARCHAR(14) NOT NULL UNIQUE
);

CREATE TABLE pedidos (
    id_pedido      SERIAL PRIMARY KEY,
    data_pedido    DATE NOT NULL DEFAULT CURRENT_DATE,
    status_pedido  VARCHAR(20) NOT NULL DEFAULT 'Pendente'
                   CHECK (status_pedido IN ('Pendente','Pago','Enviado','Cancelado')),
    id_cliente     INT NOT NULL REFERENCES clientes(id_cliente),
    id_funcionario INT NOT NULL REFERENCES funcionarios(id_funcionario)
);

CREATE TABLE itens_pedidos (
    id_item        SERIAL PRIMARY KEY,
    valoruni_item  NUMERIC(10,2) NOT NULL,
    qnt_item       INT NOT NULL CHECK (qnt_item > 0),
    id_pedido      INT NOT NULL REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
    id_produto     INT NOT NULL REFERENCES produtos(id_produto),
    UNIQUE (id_pedido, id_produto)
);

CREATE TABLE pagamentos (
    id_pagamento     SERIAL PRIMARY KEY,
    valor_pagamento  NUMERIC(10,2) NOT NULL,
    forma_pagamento  VARCHAR(20) NOT NULL CHECK (forma_pagamento IN ('Cartão','Boleto','Pix','Dinheiro')),
    data_pagamento   DATE,
    status_pagamento VARCHAR(20) NOT NULL DEFAULT 'Pendente'
                     CHECK (status_pagamento IN ('Pendente','Pago','Estornado')),
    id_pedido        INT NOT NULL UNIQUE REFERENCES pedidos(id_pedido)
);

-- Inserção de dados

INSERT INTO categorias (nome_categoria) VALUES
('Notebooks'),
('Monitores'),
('Periféricos'),
('Smartphones'),
('Áudio');

INSERT INTO produtos (nome_produto, valor_produto, qnt_produto, id_categoria) VALUES
('Notebook Gamer X', 6547.10, 6, 1),
('Notebook Ultrafino S', 7241.54, 20, 1),
('Notebook Office Pro', 3716.83, 52, 1),
('Notebook Workstation W', 2895.97, 52, 1),
('Notebook 2 em 1 Flip', 8265.82, 10, 1),
('Notebook Slim Z', 6214.35, 7, 1),
('Notebook Business Elite', 2401.62, 18, 1),
('Notebook Estudante E', 3781.09, 43, 1),
('Notebook Criativo Design', 2379.44, 17, 1),
('Notebook Gamer Pro Max', 7067.93, 49, 1),
('Notebook Compacto Air', 5904.60, 19, 1),
('Notebook Robusto Rugged', 5253.62, 22, 1),
('Notebook Premium Titanium', 7703.13, 5, 1),
('Monitor 24" Full HD', 2799.54, 15, 2),
('Monitor 27" 144Hz', 2623.60, 26, 2),
('Monitor Ultrawide 34"', 1404.83, 18, 2),
('Monitor 4K 32"', 3374.92, 26, 2),
('Monitor Curvo 27"', 895.41, 29, 2),
('Monitor Gamer 240Hz', 879.48, 59, 2),
('Monitor IPS 22"', 1596.47, 21, 2),
('Monitor Portátil 15"', 2939.67, 51, 2),
('Monitor Profissional 27"', 1931.33, 12, 2),
('Monitor Vertical 24"', 3421.04, 29, 2),
('Monitor Duplo Kit 24"', 827.52, 23, 2),
('Monitor OLED 27"', 3004.27, 44, 2),
('Monitor Básico 21"', 3166.81, 28, 2),
('Teclado Mecânico RGB', 482.39, 50, 3),
('Mouse Sem Fio', 102.00, 47, 3),
('Headset Gamer 7.1', 220.62, 23, 3),
('Webcam Full HD', 787.93, 59, 3),
('Mousepad XL', 224.28, 11, 3),
('Teclado Compacto BT', 334.65, 34, 3),
('Mouse Gamer Pro', 526.09, 28, 3),
('Hub USB-C 7 Portas', 171.74, 27, 3),
('Suporte para Notebook', 206.84, 22, 3),
('Cadeira Gamer Básica', 575.63, 48, 3),
('Controle Sem Fio', 535.34, 43, 3),
('Microfone Condensador', 525.56, 39, 3),
('Caixa de Som para PC', 596.09, 15, 3),
('Smartphone Galaxy A54', 3718.79, 22, 4),
('Smartphone iPhone 13', 6935.09, 45, 4),
('Smartphone Moto G84', 5096.79, 19, 4),
('Smartphone Redmi Note 12', 5075.15, 58, 4),
('Smartphone Galaxy S23', 5585.71, 8, 4),
('Smartphone iPhone 14', 2296.19, 7, 4),
('Smartphone Poco X5', 5809.78, 30, 4),
('Smartphone Galaxy A34', 2532.22, 18, 4),
('Smartphone Moto Edge 40', 6469.13, 41, 4),
('Smartphone iPhone SE', 6244.84, 25, 4),
('Smartphone Redmi 12', 2196.02, 36, 4),
('Smartphone Galaxy M54', 3312.35, 46, 4),
('Smartphone Moto G54', 3698.00, 21, 4),
('Fone Bluetooth ANC', 267.33, 52, 5),
('Caixa de Som Bluetooth', 773.04, 21, 5),
('Fone Gamer com Fio', 995.64, 32, 5),
('Fone Intra-auricular TWS', 1176.48, 30, 5),
('Soundbar Compacta', 533.97, 13, 5),
('Fone Over-ear Studio', 710.87, 10, 5),
('Caixa de Som Portátil Mini', 1006.16, 60, 5),
('Fone Esportivo BT', 231.38, 45, 5),
('Amplificador de Som Bluetooth', 291.73, 48, 5),
('Fone Gamer Wireless', 606.11, 9, 5),
('Caixa de Som Torre', 561.27, 43, 5),
('Fone com Cancelamento Ativo Pro', 1294.35, 38, 5),
('Microfone de Lapela BT', 401.37, 40, 5);

INSERT INTO clientes (nome_cliente, email_cliente, tel_cliente, cidade_cliente, uf_cliente, cpf_cliente) VALUES
('Ana Rocha', 'ana.rocha1@email.com', '35999990001', 'Niterói', 'RJ', '100.200.300-00'),
('Ingrid Ramos', 'ingrid.ramos2@email.com', '35999990002', 'Ribeirão Preto', 'SP', '101.201.301-01'),
('Patricia Pereira', 'patricia.pereira3@email.com', '35999990003', 'Pouso Alegre', 'MG', '102.202.302-02'),
('Sabrina Cardoso', 'sabrina.cardoso4@email.com', '35999990004', 'Varginha', 'MG', '103.203.303-03'),
('Daniel Souza', 'daniel.souza5@email.com', '35999990005', 'Uberlândia', 'MG', '104.204.304-04'),
('Ubirajara Ramos', 'ubirajara.ramos6@email.com', '35999990006', 'Poços de Caldas', 'MG', '105.205.305-05'),
('William Martins', 'william.martins7@email.com', '35999990007', 'Poços de Caldas', 'MG', '106.206.306-06'),
('Gabriela Silva', 'gabriela.silva8@email.com', '35999990008', 'Volta Redonda', 'RJ', '107.207.307-07'),
('Otavio Ribeiro', 'otavio.ribeiro9@email.com', '35999990009', 'Santos', 'SP', '108.208.308-08'),
('Mariana Torres', 'mariana.torres10@email.com', '35999990010', 'Campinas', 'SP', '109.209.309-09'),
('Ingrid Ribeiro', 'ingrid.ribeiro11@email.com', '35999990011', 'Brasília', 'DF', '110.210.310-10'),
('Ana Nascimento', 'ana.nascimento12@email.com', '35999990012', 'Campinas', 'SP', '111.211.311-11'),
('Fabio Souza', 'fabio.souza13@email.com', '35999990013', 'Pouso Alegre', 'MG', '112.212.312-12'),
('Ximena Silva', 'ximena.silva14@email.com', '35999990014', 'Belo Horizonte', 'MG', '113.213.313-13'),
('Diego Costa', 'diego.costa15@email.com', '35999990015', 'Brasília', 'DF', '114.214.314-14'),
('Kelly Dias', 'kelly.dias16@email.com', '35999990016', 'Pouso Alegre', 'MG', '115.215.315-15'),
('Ubirajara Gomes', 'ubirajara.gomes17@email.com', '35999990017', 'Volta Redonda', 'RJ', '116.216.316-16'),
('Elaine Carvalho', 'elaine.carvalho18@email.com', '35999990018', 'Ribeirão Preto', 'SP', '117.217.317-17'),
('Isabela Torres', 'isabela.torres19@email.com', '35999990019', 'Niterói', 'RJ', '118.218.318-18'),
('Eduarda Carvalho', 'eduarda.carvalho20@email.com', '35999990020', 'Varginha', 'MG', '119.219.319-19'),
('Quesia Ribeiro', 'quesia.ribeiro21@email.com', '35999990021', 'Volta Redonda', 'RJ', '120.220.320-20'),
('Marina Cardoso', 'marina.cardoso22@email.com', '35999990022', 'Belo Horizonte', 'MG', '121.221.321-21'),
('Ingrid Alves', 'ingrid.alves23@email.com', '35999990023', 'Uberlândia', 'MG', '122.222.322-22'),
('Thiago Barbosa', 'thiago.barbosa24@email.com', '35999990024', 'Niterói', 'RJ', '123.223.323-23'),
('Patricia Fernandes', 'patricia.fernandes25@email.com', '35999990025', 'Juiz de Fora', 'MG', '124.224.324-24'),
('Hugo Teixeira', 'hugo.teixeira26@email.com', '35999990026', 'Pouso Alegre', 'MG', '125.225.325-25'),
('Pedro Costa', 'pedro.costa27@email.com', '35999990027', 'Pouso Alegre', 'MG', '126.226.326-26'),
('Vinicius Souza', 'vinicius.souza28@email.com', '35999990028', 'Santos', 'SP', '127.227.327-27'),
('Julio Costa', 'julio.costa29@email.com', '35999990029', 'Santos', 'SP', '128.228.328-28'),
('Olivia Souza', 'olivia.souza30@email.com', '35999990030', 'Pouso Alegre', 'MG', '129.229.329-29'),
('Tatiane Lima', 'tatiane.lima31@email.com', '35999990031', 'Belo Horizonte', 'MG', '130.230.330-30'),
('Elaine Lima', 'elaine.lima32@email.com', '35999990032', 'Volta Redonda', 'RJ', '131.231.331-31'),
('Vinicius Dias', 'vinicius.dias33@email.com', '35999990033', 'Poços de Caldas', 'MG', '132.232.332-32'),
('Pedro Ramos', 'pedro.ramos34@email.com', '35999990034', 'Niterói', 'RJ', '133.233.333-33'),
('Fabio Alves', 'fabio.alves35@email.com', '35999990035', 'Poços de Caldas', 'MG', '134.234.334-34'),
('Isabela Araujo', 'isabela.araujo36@email.com', '35999990036', 'Santos', 'SP', '135.235.335-35'),
('Eduarda Costa', 'eduarda.costa37@email.com', '35999990037', 'Ribeirão Preto', 'SP', '136.236.336-36'),
('Eduarda Cardoso', 'eduarda.cardoso38@email.com', '35999990038', 'Belo Horizonte', 'MG', '137.237.337-37'),
('Gabriela Rocha', 'gabriela.rocha39@email.com', '35999990039', 'Niterói', 'RJ', '138.238.338-38'),
('Bernardo Fernandes', 'bernardo.fernandes40@email.com', '35999990040', 'Rio de Janeiro', 'RJ', '139.239.339-39'),
('Aline Teixeira', 'aline.teixeira41@email.com', '35999990041', 'Volta Redonda', 'RJ', '140.240.340-40'),
('Ubirajara Lima', 'ubirajara.lima42@email.com', '35999990042', 'Niterói', 'RJ', '141.241.341-41'),
('Patricia Rocha', 'patricia.rocha43@email.com', '35999990043', 'Itajubá', 'MG', '142.242.342-42'),
('Zeca Pereira', 'zeca.pereira44@email.com', '35999990044', 'Ribeirão Preto', 'SP', '143.243.343-43'),
('Gabriela Costa', 'gabriela.costa45@email.com', '35999990045', 'Belo Horizonte', 'MG', '144.244.344-44'),
('Mariana Carvalho', 'mariana.carvalho46@email.com', '35999990046', 'Juiz de Fora', 'MG', '145.245.345-45'),
('Isabela Cardoso', 'isabela.cardoso47@email.com', '35999990047', 'Varginha', 'MG', '146.246.346-46'),
('Rafael Teixeira', 'rafael.teixeira48@email.com', '35999990048', 'Belo Horizonte', 'MG', '147.247.347-47'),
('Elaine Teixeira', 'elaine.teixeira49@email.com', '35999990049', 'Ribeirão Preto', 'SP', '148.248.348-48'),
('Julio Rocha', 'julio.rocha50@email.com', '35999990050', 'Itajubá', 'MG', '149.249.349-49');

INSERT INTO funcionarios (nome_funcionario, email_funcionario, cargo_funcionario, cpf_funcionario) VALUES
('Marcos Nogueira', 'marcos@loja.com', 'Vendedor','121.121.121-21'),
('Paula Mendes', 'paula@loja.com', 'Vendedor', '232.232.232-22'),
('Rafael Souza', 'rafael@loja.com', 'Vendedor', '343.343.343-23'),
('Juliana Prado', 'juliana@loja.com', 'Gerente de Vendas', '454.454.454-24'),
('Bianca Nogueira', 'bianca@loja.com', 'Vendedor', '565.565.565-25');

INSERT INTO pedidos (data_pedido, status_pedido, id_cliente, id_funcionario) VALUES
('2026-08-03', 'Cancelado', 32, 3),
('2026-08-03', 'Pago', 6, 4),
('2026-08-04', 'Enviado', 3, 1),
('2026-08-05', 'Pago', 50, 2),
('2026-08-07', 'Pago', 17, 2),
('2026-08-09', 'Pago', 29, 5),
('2026-08-11', 'Enviado', 28, 5),
('2026-08-11', 'Pago', 8, 1),
('2026-08-13', 'Pago', 10, 5),
('2026-08-13', 'Cancelado', 24, 5),
('2026-08-15', 'Cancelado', 10, 4),
('2026-08-15', 'Pago', 3, 3),
('2026-08-16', 'Pago', 3, 3),
('2026-08-16', 'Pago', 44, 2),
('2026-08-18', 'Pago', 7, 3),
('2026-08-20', 'Pago', 27, 5),
('2026-08-22', 'Pendente', 10, 2),
('2026-08-22', 'Enviado', 12, 4),
('2026-08-22', 'Pago', 12, 3),
('2026-08-23', 'Pendente', 43, 2),
('2026-08-24', 'Pago', 11, 1),
('2026-08-25', 'Enviado', 3, 4),
('2026-08-25', 'Enviado', 13, 4),
('2026-08-26', 'Enviado', 20, 2),
('2026-08-26', 'Pago', 2, 2),
('2026-08-27', 'Enviado', 22, 3),
('2026-08-27', 'Pago', 50, 3),
('2026-08-28', 'Pago', 42, 5),
('2026-09-01', 'Enviado', 44, 5),
('2026-09-02', 'Pago', 2, 1),
('2026-09-03', 'Pago', 12, 5),
('2026-09-04', 'Pendente', 3, 1),
('2026-09-06', 'Enviado', 28, 3),
('2026-09-08', 'Pago', 21, 4),
('2026-09-10', 'Enviado', 33, 1),
('2026-09-11', 'Pendente', 37, 2),
('2026-09-12', 'Pago', 3, 4),
('2026-09-12', 'Enviado', 34, 5),
('2026-09-14', 'Pago', 47, 2),
('2026-09-15', 'Pago', 28, 1),
('2026-09-17', 'Pago', 22, 5),
('2026-09-18', 'Cancelado', 43, 1),
('2026-09-20', 'Enviado', 20, 5),
('2026-09-21', 'Enviado', 43, 4),
('2026-09-22', 'Enviado', 26, 3),
('2026-09-24', 'Enviado', 9, 2);

INSERT INTO itens_pedidos (valoruni_item, qnt_item, id_pedido, id_produto) VALUES
(6244.84, 3, 1, 49),
(3421.04, 3, 1, 23),
(3698.00, 3, 2, 52),
(6547.10, 2, 2, 1),
(535.34, 1, 2, 37),
(5096.79, 2, 3, 42),
(533.97, 2, 3, 57),
(291.73, 3, 4, 61),
(1931.33, 3, 4, 22),
(5904.60, 2, 4, 11),
(5075.15, 1, 5, 43),
(224.28, 3, 5, 31),
(3718.79, 1, 5, 40),
(879.48, 1, 6, 19),
(6214.35, 1, 6, 6),
(291.73, 3, 6, 61),
(7067.93, 2, 6, 10),
(3004.27, 3, 7, 25),
(2196.02, 2, 7, 50),
(879.48, 3, 8, 19),
(6547.10, 1, 8, 1),
(220.62, 1, 9, 29),
(231.38, 1, 9, 60),
(334.65, 1, 9, 32),
(231.38, 3, 10, 60),
(6935.09, 2, 10, 41),
(401.37, 2, 11, 65),
(710.87, 1, 11, 58),
(291.73, 2, 11, 61),
(334.65, 3, 12, 32),
(575.63, 3, 12, 36),
(224.28, 2, 13, 31),
(533.97, 1, 13, 57),
(224.28, 2, 14, 31),
(5075.15, 2, 14, 43),
(5904.60, 1, 14, 11),
(2196.02, 3, 15, 50),
(1596.47, 3, 15, 20),
(773.04, 2, 16, 54),
(5075.15, 3, 16, 43),
(3781.09, 1, 17, 8),
(773.04, 2, 17, 54),
(3716.83, 3, 18, 3),
(6244.84, 2, 18, 49),
(6547.10, 2, 18, 1),
(596.09, 2, 18, 39),
(773.04, 3, 19, 54),
(220.62, 2, 19, 29),
(206.84, 2, 19, 35),
(561.27, 1, 19, 63),
(3698.00, 3, 20, 52),
(1931.33, 2, 20, 22),
(2895.97, 2, 21, 4),
(5904.60, 3, 21, 11),
(995.64, 1, 21, 55),
(231.38, 1, 21, 60),
(6244.84, 2, 22, 49),
(5096.79, 2, 23, 42),
(6244.84, 2, 23, 49),
(773.04, 2, 24, 54),
(5904.60, 2, 24, 11),
(3716.83, 3, 24, 3),
(2296.19, 1, 25, 45),
(2379.44, 3, 25, 9),
(6214.35, 1, 25, 6),
(3166.81, 1, 26, 26),
(1596.47, 1, 26, 20),
(3374.92, 2, 26, 17),
(2623.60, 3, 26, 15),
(231.38, 3, 27, 60),
(526.09, 2, 27, 33),
(1931.33, 3, 27, 22),
(2623.60, 1, 27, 15),
(2799.54, 3, 28, 14),
(2895.97, 2, 28, 4),
(6244.84, 2, 28, 49),
(3166.81, 1, 28, 26),
(334.65, 1, 29, 32),
(596.09, 3, 29, 39),
(1404.83, 3, 29, 16),
(2296.19, 3, 30, 45),
(995.64, 3, 30, 55),
(6469.13, 1, 30, 48),
(5585.71, 1, 31, 44),
(773.04, 2, 31, 54),
(2799.54, 2, 31, 14),
(1006.16, 3, 32, 59),
(1596.47, 2, 32, 20),
(3421.04, 3, 32, 23),
(206.84, 3, 32, 35),
(606.11, 2, 33, 62),
(1176.48, 3, 33, 56),
(206.84, 2, 33, 35),
(334.65, 1, 33, 32),
(710.87, 1, 34, 58),
(231.38, 3, 34, 60),
(6244.84, 2, 35, 49),
(2895.97, 2, 35, 4),
(5096.79, 1, 35, 42),
(5809.78, 2, 36, 46),
(5585.71, 2, 36, 44),
(575.63, 3, 37, 36),
(7241.54, 3, 37, 2),
(3004.27, 1, 37, 25),
(224.28, 3, 37, 31),
(224.28, 3, 38, 31),
(291.73, 3, 38, 61),
(710.87, 1, 39, 58),
(5253.62, 2, 39, 12),
(220.62, 2, 39, 29),
(3718.79, 3, 40, 40),
(6469.13, 2, 40, 48),
(2296.19, 2, 40, 45),
(5075.15, 2, 41, 43),
(1006.16, 2, 41, 59),
(3718.79, 2, 41, 40),
(787.93, 1, 41, 30),
(6935.09, 1, 42, 41),
(827.52, 1, 42, 24),
(102.00, 3, 42, 28),
(535.34, 1, 43, 37),
(3004.27, 2, 43, 25),
(3421.04, 2, 44, 23),
(7241.54, 3, 44, 2),
(575.63, 1, 45, 36),
(2401.62, 3, 45, 7),
(525.56, 3, 45, 38),
(561.27, 1, 46, 63),
(7241.54, 3, 46, 2),
(535.34, 2, 46, 37),
(606.11, 2, 46, 62);

INSERT INTO pagamentos (valor_pagamento, forma_pagamento, data_pagamento, status_pagamento, id_pedido) VALUES
(24723.54, 'Pix', '2026-08-03', 'Pago', 2),
(11261.52, 'Boleto', '2026-08-04', 'Pago', 3),
(18478.38, 'Cartão', '2026-08-05', 'Pago', 4),
(9466.78, 'Pix', '2026-08-07', 'Pago', 5),
(22104.88, 'Dinheiro', '2026-08-09', 'Pago', 6),
(13404.85, 'Cartão', '2026-08-11', 'Pago', 7),
(9185.54, 'Cartão', '2026-08-11', 'Pago', 8),
(786.65, 'Dinheiro', '2026-08-13', 'Pago', 9),
(2730.84, 'Dinheiro', '2026-08-15', 'Pago', 12),
(982.53, 'Cartão', '2026-08-16', 'Pago', 13),
(16503.46, 'Cartão', '2026-08-16', 'Pago', 14),
(11377.47, 'Boleto', '2026-08-18', 'Pago', 15),
(16771.53, 'Boleto', '2026-08-20', 'Pago', 16),
(37926.55, 'Pix', '2026-08-22', 'Pago', 18),
(3735.31, 'Cartão', '2026-08-22', 'Pago', 19),
(24732.76, 'Boleto', '2026-08-24', 'Pago', 21),
(12489.68, 'Cartão', '2026-08-25', 'Pago', 22),
(22683.26, 'Dinheiro', '2026-08-25', 'Pago', 23),
(24505.77, 'Boleto', '2026-08-26', 'Pago', 24),
(15648.86, 'Dinheiro', '2026-08-26', 'Pago', 25),
(19383.92, 'Dinheiro', '2026-08-27', 'Pago', 26),
(10163.91, 'Dinheiro', '2026-08-27', 'Pago', 27),
(29847.05, 'Pix', '2026-08-28', 'Pago', 28),
(6337.41, 'Dinheiro', '2026-09-01', 'Pago', 29),
(16344.62, 'Pix', '2026-09-02', 'Pago', 30),
(12730.87, 'Cartão', '2026-09-03', 'Pago', 31),
(5489.99, 'Cartão', '2026-09-06', 'Pago', 33),
(1405.01, 'Boleto', '2026-09-08', 'Pago', 34),
(23378.41, 'Boleto', '2026-09-10', 'Pago', 35),
(27128.62, 'Pix', '2026-09-12', 'Pago', 37),
(1548.03, 'Cartão', '2026-09-12', 'Pago', 38),
(11659.35, 'Boleto', '2026-09-14', 'Pago', 39),
(28687.01, 'Boleto', '2026-09-15', 'Pago', 40),
(20388.13, 'Boleto', '2026-09-17', 'Pago', 41),
(6543.88, 'Cartão', '2026-09-20', 'Pago', 43),
(28566.70, 'Boleto', '2026-09-21', 'Pago', 44),
(9357.17, 'Cartão', '2026-09-22', 'Pago', 45),
(24568.79, 'Dinheiro', '2026-09-24', 'Pago', 46),
(5327.17, 'Boleto', NULL, 'Pendente', 17),
(14956.66, 'Pix', NULL, 'Pendente', 20),
(17095.06, 'Boleto', NULL, 'Pendente', 32),
(28997.64, 'Cartão', '2026-08-03', 'Estornado', 1),
(14564.32, 'Pix', '2026-08-13', 'Estornado', 10);

-- Consultas simples
--- Todos os clientes
SELECT * FROM clientes;

--- Produtos com valor acima de R$1000, do mais caro ao mais barato
SELECT nome_produto, valor_produto FROM produtos WHERE valor_produto > 1000 ORDER BY valor_produto DESC;

--- Produtos com valor acima de R$500, do mais barato ao mais caro
SELECT nome_produto, valor_produto FROM produtos WHERE valor_produto > 500 ORDER BY valor_produto ASC;

-- Pedidos ainda pendentes 
SELECT * FROM pedidos WHERE status_pedido = 'Pendente';

-- Pagamentos que estão estornados
SELECT * FROM pagamentos WHERE status_pagamento = 'Estornado';

-- Consultas com joins
--- Pedidos com nome do cliente e do funcionário responsável
SELECT pedidos.id_pedido, clientes.nome_cliente, funcionarios.nome_funcionario
FROM pedidos
JOIN clientes ON clientes.id_cliente = pedidos.id_pedido
JOIN funcionarios ON funcionarios.id_funcionario = pedidos.id_pedido

--- Itens de cada pedido, com nome do produto e categoria
SELECT itens_pedidos.id_pedido, produtos.nome_produto, categorias.nome_categoria,
       itens_pedidos.qnt_item, itens_pedidos.valoruni_item,
       (itens_pedidos.qnt_item * itens_pedidos.valoruni_item) AS subtotal
FROM itens_pedidos
JOIN produtos ON produtos.id_produto = itens_pedidos.id_produto
JOIN categorias ON categorias.id_categoria = produtos.id_categoria;

--- Pedidos com a forma e o status do pagamento correspondente
SELECT pedidos.id_pedido, pagamentos.forma_pagamento, pagamentos.status_pagamento
FROM pedidos
JOIN pagamentos ON pagamentos.id_pagamento = pedidos.id_pedido;

--- Pedidos e situação de pagamento (LEFT JOIN traz também pedidos sem pagamento)
SELECT pedidos.id_pedido, pedidos.status_pedido, pagamentos.forma_pagamento, pagamentos.status_pagamento, pagamentos.valor_pagamento
FROM pedidos
LEFT JOIN pagamentos ON pagamentos.id_pedido = pedidos.id_pedido;

-- Consultas com agrupamentos
--- Total vendido por categoria
SELECT categorias.nome_categoria, SUM(itens_pedidos.qnt_item * itens_pedidos.valoruni_item) AS total_vendido
FROM itens_pedidos
JOIN produtos ON produtos.id_produto = itens_pedidos.id_produto
JOIN categorias ON categorias.id_categoria = produtos.id_categoria
GROUP BY categorias.nome_categoria
ORDER BY total_vendido DESC;

--- Número de pedidos por funcionário, apenas quem atendeu mais de 1
SELECT funcionarios.nome_funcionario, COUNT(pedidos.id_pedido) AS qnt_pedidos
FROM funcionarios
JOIN pedidos ON pedidos.id_funcionario = funcionarios.id_funcionario
GROUP BY funcionarios.nome_funcionario
HAVING COUNT(pedidos.id_pedido) > 1;

--- Clientes que gastaram mais de R$2.000
SELECT clientes.nome_cliente, SUM(itens_pedidos.qnt_item*itens_pedidos.valoruni_item) as total_gasto
FROM clientes
JOIN pedidos ON pedidos.id_cliente = clientes.id_cliente
JOIN itens_pedidos ON itens_pedidos.id_pedido = pedidos.id_pedido
GROUP BY clientes.nome_cliente
HAVING SUM(itens_pedidos.qnt_item*itens_pedidos.valoruni_item) > 2000;

--- Ticket médio por cliente
SELECT clientes.nome_cliente, ROUND(SUM(itens_pedidos.qnt_item*itens_pedidos.valoruni_item)/ COUNT (DISTINCT pedidos.id_pedido), 2) AS ticket_medio
FROM clientes
JOIN pedidos ON pedidos.id_cliente = clientes.id_cliente
JOIN itens_pedidos ON itens_pedidos.id_pedido = pedidos.id_pedido
GROUP BY clientes.nome_cliente
ORDER BY ticket_medio DESC;

-- Subconsultas ou views
--- Clientes que nunca fizeram pedidos
SELECT nome_cliente
FROM clientes
WHERE id_cliente NOT IN(SELECT id_cliente FROM pedidos);

--- Clientes que já fizeram pedido
SELECT nome_cliente
FROM clientes
WHERE id_cliente IN (SELECT DISTINCT id_cliente FROM pedidos);

--- Produtos com o valor acima da média
SELECT nome_produto, valor_produto
FROM produtos
WHERE valor_produto > (SELECT AVG(valor_produto) FROM produtos)
ORDER BY valor_produto DESC;

--- Produtos com o valor abaixo da média
SELECT nome_produto, valor_produto
FROM produtos
WHERE valor_produto < (SELECT AVG(valor_produto) FROM produtos)
ORDER BY valor_produto ASC;

--- View: resumo de valor total por pedido, com forma de pagamento
CREATE VIEW view_resumo_pedidos AS
SELECT pedidos.id_pedido, clientes.nome_cliente AS cliente, pedidos.status_pedido, 
		SUM(itens_pedidos.qnt_item*itens_pedidos.valoruni_item) AS total_pedido, pagamentos.forma_pagamento
FROM pedidos
JOIN clientes ON clientes.id_cliente = pedidos.id_cliente
JOIN itens_pedidos ON itens_pedidos.id_pedido = pedidos.id_pedido
LEFT JOIN pagamentos ON pagamentos.id_pedido = pedidos.id_pedido
GROUP BY pedidos.id_pedido, clientes.nome_cliente, pedidos.status_pedido, pagamentos.forma_pagamento;

---- Visualizando o View
SELECT * FROM view_resumo_pedidos

-- Tópicos especiais

--- Uma função SQL
---- Função: Calculo de total por pedido
CREATE OR REPLACE FUNCTION calculo_totalpedido (id_pedido INT)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE
    total_pedido NUMERIC;
BEGIN
    SELECT SUM(qnt_item * valoruni_item) INTO total_pedido
    FROM itens_pedidos
    WHERE itens_pedidos.id_pedido = $1;
    RETURN total_pedido;
END;
$$;

SELECT calculo_totalpedido(1);

--- Uma stored procedure
--- Stored Procedure : Registro de venda
CREATE OR REPLACE PROCEDURE registrar_venda ( 
	id_cliente INT,
    id_funcionario INT,
    id_produto INT,
    qnt_item INT,
    valoruni_item NUMERIC
)
LANGUAGE plpgsql 
AS $$ 
DECLARE 
		novo_id_pedido INT;
BEGIN 
	INSERT INTO pedidos (id_cliente, id_funcionario)
	VALUES (id_cliente, id_funcionario)
	RETURNING id_pedido INTO novo_id_pedido;

	INSERT INTO itens_pedidos (valoruni_item, qnt_item, id_pedido, id_produto)
	VALUES (valoruni_item, qnt_item, novo_id_pedido, id_produto);
END;
$$;

CALL registrar_venda(2, 1, 5, 2, 899.00);

--- Stored Procedure : Registro de pagamento e atualização do status

CREATE OR REPLACE PROCEDURE registrar_pagamento (
	p_id_pedido INT,
	p_forma_pagamento VARCHAR,
	p_valor_pagamento NUMERIC
)
LANGUAGE plpgsql 
AS $$
BEGIN 
	INSERT INTO pagamentos (valor_pagamento, forma_pagamento, data_pagamento, status_pagamento, id_pedido)
	VALUES (p_valor_pagamento, p_forma_pagamento, CURRENT_DATE, 'Pago', p_id_pedido);

	UPDATE pedidos SET status_pedido = 'Pago' WHERE id_pedido = p_id_pedido;
END;
$$;

CALL registrar_pagamento (36, 'Boleto', 1899.00);

--  Uma trigger
--- Trigger: Dar baixa no estoque e bloqueio se não houver estoque 
CREATE OR REPLACE FUNCTION baixar_estoque()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF (SELECT qnt_produto FROM produtos WHERE id_produto = NEW.id_produto) < NEW.qnt_item THEN
        RAISE EXCEPTION 'Estoque insuficiente para o produto %', NEW.id_produto;
    END IF;

    UPDATE produtos
    SET qnt_produto = qnt_produto - NEW.qnt_item
    WHERE id_produto = NEW.id_produto;

    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_baixar_estoque
AFTER INSERT ON itens_pedidos
FOR EACH ROW
EXECUTE FUNCTION baixar_estoque();

-- Um exemplo de transação
BEGIN;

INSERT INTO pedidos (id_cliente, id_funcionario)
VALUES (2, 1)
RETURNING id_pedido;

INSERT INTO itens_pedidos (valoruni_item, qnt_item, id_pedido, id_produto)
VALUES (899.00, 2, 13, 5);

COMMIT;

-- Um exemplo de usuário ou permissão
--- Usuário de aplicação com acesso restrito (não pode apagar dados)
CREATE ROLE app_vendas WITH PASSWORD 'senha_forte_123';

GRANT SELECT, INSERT, UPDATE ON clientes, pedidos, itens_pedidos, pagamentos TO app_vendas;
GRANT SELECT ON produtos, categorias, funcionarios TO app_vendas;
REVOKE DELETE ON ALL TABLES IN SCHEMA public FROM app_vendas;

--- Usuário de relatórios, somente leitura
CREATE ROLE app_relatorios WITH LOGIN PASSWORD 'senha_forte_456';
GRANT SELECT ON ALL TABLES IN SCHEMA public TO app_relatorios;

-- Backup e restore
--- Backup completo 
pg_dump -U postgres -d Sistema_Vendas -F c -f backup_sistema_vendas.dump

--- Restore em um banco novo
createdb -U postgres Sistema_Vendas_restaurado
pg_restore -U postgres -d Sistema_Vendas_restaurado backup_sistema_vendas.dump

-- Álgebra relacional
--- Operação
SELECT nome_produto, valor_produto FROM produtos;
SELECT nome_cliente, email_cliente FROM clientes;

--- Seleção
SELECT*FROM produtos WHERE valor_produto>1000;
SELECT*FROM produtos WHERE valor_produto<500;

--- União
SELECT*FROM clientes WHERE uf_cliente='MG' UNION SELECT*FROM clientes WHERE uf_cliente='SP';
SELECT*FROM clientes WHERE cidade_cliente='Belo Horizonte' UNION SELECT*FROM clientes WHERE cidade_cliente='Campinas';

--- Intersecção
SELECT id_cliente FROM clientes WHERE uf_cliente='MG' INTERSECT SELECT id_cliente FROM pedidos;
SELECT id_cliente FROM clientes WHERE cidade_cliente='Belo Horizonte' INTERSECT SELECT id_cliente FROM pedidos;

--- Junção 
SELECT*FROM pedidos JOIN clientes ON clientes.id_cliente = pedidos.id_cliente;
SELECT*FROM pedidos JOIN funcionarios ON funcionarios.id_funcionario = pedidos.id_funcionario;

--- Agrupamento
SELECT id_categoria, SUM (qnt_item*valoruni_item) FROM itens_pedidos JOIN produtos USING (id_produto) GROUP BY id_categoria;

-- Perguntas de análise sugeridas
--- Quais registros estão cadastrados em cada entidade principal?
SELECT*FROM categorias;
SELECT*FROM produtos;
SELECT*FROM clientes;
SELECT*FROM funcionarios;
SELECT*FROM pedidos;

---  Quais entidades possuem relacionamento direto?
SELECT produtos.nome_produto, categorias.nome_categoria FROM produtos 
JOIN categorias ON categorias.id_categoria = produtos.id_categoria;

--- Quais registros atendem a determinada condição?
SELECT*FROM pedidos WHERE status_pedido='Enviado';
SELECT*FROM pagamentos WHERE status_pagamento = 'Estornado';
SELECT*FROM pagamentos WHERE status_pagamento = 'Pendente';

--- Qual é o resultado de uma consulta envolvendo duas ou mais tabelas?
SELECT clientes.nome_cliente, pedidos.id_pedido,  pedidos.status_pedido FROM
clientes JOIN pedidos ON pedidos.id_cliente = clientes.id_cliente;

---  Quais dados podem ser obtidos por meio de agrupamentos?
SELECT clientes.nome_cliente, SUM(qnt_item*valoruni_item) AS total_gasto
FROM clientes
JOIN pedidos ON pedidos.id_cliente = clientes.id_cliente
JOIN itens_pedidos ON itens_pedidos.id_pedido = pedidos.id_pedido
GROUP BY clientes.nome_cliente
ORDER BY total_gasto DESC;

SELECT funcionarios.nome_funcionario, SUM(qnt_item*valoruni_item) AS total_vendido
FROM funcionarios
JOIN pedidos ON pedidos.id_funcionario = funcionarios.id_funcionario
JOIN itens_pedidos ON itens_pedidos.id_pedido = pedidos.id_pedido
GROUP BY funcionarios.nome_funcionario
ORDER BY total_vendido DESC;

-- Regra de negócio automatizada com trigger
--- R: trigger trg_baixar_estoque automatiza a baixa de estoque

-- Operação transformada em função/procedure
--- R: Calcular_total_pedido(), registrar_pagamento() e registra_venda()

-- Transação evitando inconsistência
--- R: O pedido + item só se confirmam juntos ou nada é gravado

-- Permissões protegendo o acesso
--- R: app_vendas sem DELETE e o app_relatorios só leitura, por questão de segurança dos dados.

-- O modelo está normalizado corretamente?
--- R: explicação de 1FN, 2FN e 3FN no PDF


