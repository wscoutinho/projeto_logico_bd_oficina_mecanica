-- persistência de dados para testes
use dboficina;

-- cliente_PJ
insert into cliente_PJ (idCliente_PJ, Razao_social, Nome_fantasia, CNPJ, Contato, Telefone, Email, Endereco) values
	(1,'Fornecimento Ilimitado Ltda','Ilimitado','10152325000115','Janderson Moreira','32988887777','contato@ilimitado.com.br',NULL),
	(2,'Eletronicos Brasil SA.','Brasa Eletronicos','51258659000132','Lorena Gonçalves Pinto','32955667788','contato@brasaeletronico.com.br',NULL),
	(3,'Moveis do Brasil Ltda','Movil Moveis','26159847000119','Marilza Aparecida Nepomoceno','32998654589','contato@movilmoveis.com',NULL),
	(4,'Celulares e Comunicação Ltda','CelCom Brasil','95259132000120','Ivanildo da Silva','32999882312','contato@celcom.com.br',NULL);

-- cliente_PF
insert into cliente_PF (idCliente_PF, Nome_completo, CPF, Data_nascimento, Telefone, Email, Endereco) values
	(1, 'Augusto da Silva Filho','02545678955','1987-10-05','11998985544','aug_sf01@gmail.com','Rua das Palmeiras, 315, São Paulo-SP'),
	(2, 'Cesar Pereira Nicodemos','05898764999','1991-01-02','11955996677','nicodemos_cesarp@gmail.com','Rua Tiradentes, 220, São Paulo-SP'),
	(3, 'Maria Fernanda Marques Souza','12345678999','1975-09-08','11965498875','mfms_1995@gmail.com','Av. Alameda 13, 1055, São Paulo-SP'),
	(4, 'Isabela de Oliveira Silva','45678925877','1982-12-03','11988568942','isa_oliveira01@gmail.com','Rua Treze de Maio, 55, São Paulo-SP'),		
	(5, 'Maria Lídia da Fonseca','15935745687','1969-05-20','11988652323','marialidia_fonseca@gmail.com','Rua Sete de Setembro, 120, São Paulo-SP'),	
	(6, 'Alberto César Ramos','65432198725','1984-12-01','11989554569','alberto_tasmania@gmail.com','Rua Tasmânia, 315, São Paulo-SP');	

-- cliente
insert into cliente (idCliente, idCliente_PF, idCliente_PJ) values
	(1, 1, NULL),
	(2, 2, NULL),
	(3, 3, NULL),
	(4, 4, NULL),
	(5, NULL, 1),
	(6, NULL, 2),
	(7, NULL, 3),
	(8, NULL, 4),		
	(9, 5, NULL),
	(10, 6, NULL);	

-- veiculo
insert into veiculo (idVeiculo, idCliente, Placa, Marca, Modelo, Ano_fabricacao) values
	(1, 1, 'HEV4578', 'Chevrolet', 'Active 2019', '2018'),
	(2, 2, 'GHY6589', 'Chevrolet', 'Sport', '2017'),	
	(3, 3, 'HQR4278', 'GM', 'Highline', '2018'),
	(4, 4, 'OLP8945', 'Toyota', 'XTreme', '2020'),
	(5, 5, 'NUM5245', 'Fiat', 'Django', '2021'),
	(6, 6, 'REQ9632', 'GM', 'Adventure', '2011'),
	(7, 7, 'AFG7856', 'Fiat', 'Dualógic', '2014'),
	(8, 8, 'GMV4679', 'Fiat', 'Sporting', '2021'),
	(9, 9, 'QRT5678', 'Toyota', 'Classic', '2008'),
	(10, 10, 'LPM2223', 'Hyundai', 'Xe', '2022');
	
-- pedido
insert into pedido (idPedido, idCliente, Numero, Liberado, Data_pedido, Valor_orcado) values
	(1, 1, '100001',1,'2022-10-05', 0.00),
	(2, 2, '100002',1,'2022-10-07', 0.00),
	(3, 3, '100003',1,'2022-10-12', 0.00),
	(4, 4, '100004',0,'2022-10-13', 0.00),
	(5, 5, '100005',1,'2022-09-29', 0.00),
	(6, 6, '100006',1,'2022-10-16', 0.00),
	(7, 7, '100007',1,'2022-10-17', 0.00),
	(8, 8, '100008',1,'2022-09-13', 0.00),
	(9, 9, '100009',0,'2022-09-22', 0.00),
	(10, 10, '100010',0,'2022-08-21', 0.00);

-- Tabela_precos
insert into tabela_precos (idTabela_precos, Categoria, Especificacao, Valor) values
	(1, 'Motor','Oleo','24.90'),
	(2, 'Motor','Correia dentada','60.59'),
	(3, 'Motor','Bico Injetor','47.90'),
	(4, 'Motor','Bomba de Direção Hidraulica','220.60'),
	(5, 'Suspensão','Mola','237.00'),
	(6, 'Suspensão','Amortecedor','589.90'),
	(7, 'Suspensão','Braços','130.90'),
	(8, 'Suspensão','Barra estabilizadora','130.90'),
	(9, 'Carroceria','Coletor de escape','186.50'),
	(10, 'Carroceria','Silenciador','98.30'),
	(11, 'Carroceria','Catalisador','200.10'),
	(12, 'Eletrica','Motor de arranque','137.90'),
	(13, 'Eletrica','Alternador','213.50'),
	(14, 'Eletrica','Distribuidor','156.45'),
	(15, 'Hora Técnica','Hora Técnica I','100.00'),
	(16, 'Hora Técnica','Hora Técnica II','120.00');

-- pedido_tabela_precos
insert into pedido_tabela_precos (idPedido, idTabela_precos) values
	(1,1),
	(1,2),
	(1,15),
	(2,5),
	(2,6),
	(2,15),
	(3,9),
	(3,10),
	(3,15),
	(4,1),
	(4,15),
	(5,1),
	(5,15),
	(6,5),
	(6,6),
	(6,7),
	(6,8),
	(6,16),
	(7,1),
	(7,15),
	(8,1),
	(8,2),
	(8,15),		
	(9,9),
	(9,15),
	(10,12),
	(10,13),
	(10,14),
	(10,16);		

-- equipe
insert into equipes (idEquipe, Responsavel) values
	(1,'João Silva'),
	(2,'Thiago Menezes'),
	(3,'Alfredo Pereira');

-- funcionarios
insert into funcionarios (idFuncionario,idEquipe,Codigo,Nome_completo,CPF,Data_nascimento,Endereco,Telefone) values 
	(1, 1,'100010','João Silva','11122233344','1975-10-25','Rua Jaracatiá','41999859741'),
	(2, 1,'100020','Pedro Souza','11125634587','1980-09-15','Rua São João Evangelista','41985487485'),
	(3, 1,'100030','Matheus Henrique','11155599988','1988-01-13','Rua Maximiliano Boscardin','41958745896'),
	(4, 2,'100040','José Flores','22255588874','1995-06-27','Rua Andrea Zílio','41958745896'),
	(5, 2,'100050','Victor Nascimento','33366655587','1997-08-30','Rua Ângelo Cretã','51975876598'),
	(6, 2,'200010','Thiago Menezes','15948755854','1984-02-28','Rua Isaulino Francisco Brito','12848547592'),
	(7, 3,'200020','Théo Soares','11555522248','1990-10-11','Praça Kelly Elizabette da Silva','22902485290');

-- ordem_servico
insert into ordem_servico (idOrdem_servico, idPedido, idVeiculo, idEquipe, Numero, Data_os, Valor, Status, Data_conclusao) values
	(1, 1, 1, 1,'10000010','2022-01-16','204.5','Concluida','2022-01-17'),
	(2, 2, 2, 2,'10000011','2022-01-28','332.08','Cancelada', null),
	(3, 3, 3, 3,'10000012','2022-02-20','372.09','Concluida','2022-02-28'),
	(4, 4, 4, 1,'10000013','2022-02-25','590.40','Concluida','2022-02-26'),
	(5, 5, 5, 1,'10000014','2022-03-15','957.00','Concluida','2022-03-18'),
	(6, 6, 6, 2,'10000015','2022-03-28','1070.70','Concluida','2022-04-03'),
	(7, 7, 7, 1,'10000016','2022-05-04','852.50','Em Execução',null),
	(8, 8, 8, 3,'10000017','2022-05-10','491.70','Em Execução',null),
	(9, 9, 9, 3,'10000018','2022-05-21','286.40','Em Execução',null),
	(10, 10, 10, 3,'10000019','2022-05-21','745.90','Em Execução',null);

-- estoque_pecas
insert into estoque_pecas (idEstoque_pecas, Descricao, Quantidade, Valor_unitario) values
	(1, 'Oleo', 15.00, 24.90),
	(2, 'Correia dentada', 12.00, 60.59),
	(3, 'Bico Injetor', 12.00, 47.90),
	(4, 'Bomba de Direção Hidraulica', 8.00, 220.60),
	(5, 'Mola', 21.00, 237.00),
	(6, 'Amortecedor', 5.00, 589.90),
	(7, 'Braços', 6.00, 130.90),
	(8, 'Barra estabilizadora', 6.00, 130.90),
	(9, 'Coletor de escape', 8.00, 186.50),
	(10, 'Silenciador', 14.00, 98.30),
	(11, 'Catalisador', 5.00, 200.10),
	(12, 'Motor de arranque', 2.00, 137.90),
	(13, 'Alternador', 9.00, 213.50),
	(14, 'Distribuidor', 11.00, 156.45);

-- ordem_servico_pecas
insert into ordem_servico_pecas (idOrdem_servico, idEstoque_pecas) values
	(1,1),
	(1,2),
	(2,5),
	(2,6),
	(3,9),
	(3,10),
	(4,1),
	(5,1),
	(6,5),
	(6,6),
	(6,7),
	(6,8),
	(7,1),
	(8,1),
	(8,2),
	(9,9),
	(10,12),
	(10,13),
	(10,14);