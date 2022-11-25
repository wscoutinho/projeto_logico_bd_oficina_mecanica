-- criação do banco de dados para o cenário de Oficina Mecânica
create database dboficina;
use dboficina;

-- cliente_PJ
create table cliente_PJ(
	idCliente_PJ int auto_increment primary key,
	Razao_social varchar(45) not null,
	Nome_fantasia varchar(45) not null,
	CNPJ char(14) not null,
	Contato varchar(45) not null,
	Telefone char(11) not null,	
	Email varchar(45) not null,
	Endereco varchar(90),
	constraint unique_cliente_PJ_cnpj unique (CNPJ)		
);

-- cliente_PF
create table cliente_PF(
	idCliente_PF int auto_increment primary key,
	Nome_completo varchar(45) not null,
	CPF char(11) not null,
	Data_nascimento date not null,
	Telefone char(11) not null,	
	Email varchar(45) not null,
	Endereco varchar(90),
	constraint unique_cliente_PF_cpf unique (CPF)	
);

-- cliente
create table cliente(
	idCliente int auto_increment primary key,
	idCliente_PF int,
	idCliente_PJ int,
	constraint fk_cliente_clientePF foreign key (idCliente_PF) references cliente_PF(idCliente_PF),
	constraint fk_cliente_clientePJ foreign key (idCliente_PJ) references cliente_PJ(idCliente_PJ)
);

-- veiculo
create table veiculo(
	idVeiculo int auto_increment primary key,
	idCliente int not null,
	Placa char(7) not null,
	Marca varchar(45) not null,
	Modelo varchar(45) not null,	
	Ano_fabricacao char(4) not null,
	constraint unique_veiculo_placa unique (Placa),
	constraint fk_veiculo_cliente foreign key (idCliente) references cliente(idCliente)
);

-- pedido
create table pedido(
	idPedido int auto_increment primary key,
	idCliente int not null,
	Numero varchar(45) not null,
	Liberado tinyint not null,
	Data_pedido date not null,
	Valor_orcado float,
	constraint fk_pedido_cliente foreign key (idCliente) references cliente(idCliente)
);

-- Tabela_precos
create table tabela_precos(
	idTabela_precos int auto_increment primary key,
	Categoria varchar(45) not null,
	Especificacao varchar(45) not null,
	Valor float not null	
);

-- pedido_tabela_precos
create table pedido_tabela_precos(
	idPedido int,
	idTabela_precos int,
	primary key (idPedido, idTabela_precos),
	constraint fk_pedido_tabela_precos_pedido foreign key (idPedido) references pedido(idPedido),
	constraint fk_pedido_tabela_precos_tabela foreign key (idTabela_precos) references tabela_precos(idTabela_precos)
);

-- equipe
create table equipes(
	idEquipe int auto_increment primary key,
	Responsavel varchar(45) not null	
);

-- funcionarios
create table funcionarios(
	idFuncionario int auto_increment primary key,
	idEquipe int not null,
	Codigo char(6) not null,
	Nome_completo varchar(45) not null,
	CPF char(11) not null,
	Data_nascimento date not null,
	Endereco varchar(90) not null,
	Telefone char(11) not null,		
	constraint unique_funcionarios_codigo unique (Codigo),
	constraint fk_funcionarios_equipe foreign key (idEquipe) references equipes(idEquipe)	
);

-- ordem_servico
create table ordem_servico(
	idOrdem_servico int auto_increment primary key,
	idPedido int not null,
	idVeiculo int,
	idEquipe int,
	Numero char(8) not null,
	Data_os date not null,
	Valor float,	
	Status varchar(45) not null default 'Em Execução',
	Data_conclusao date,
	constraint fk_ordem_servico_pedido foreign key (idPedido) references pedido(idPedido),
	constraint fk_ordem_servico_veiculo foreign key (idVeiculo) references veiculo(idVeiculo),
	constraint fk_ordem_servico_equipe foreign key (idEquipe) references equipes(idEquipe)		
);

-- estoque_pecas
create table estoque_pecas(
	idEstoque_pecas int auto_increment primary key,
	Descricao varchar(90) not null,
	Quantidade float not null default 0.00,
	Valor_unitario float not null default 0.00	
);

-- ordem_servico_pecas
create table ordem_servico_pecas(
	idEstoque_pecas int,
	idOrdem_servico int,
	Quantidade float not null default 0.00,
	primary key (idEstoque_pecas, idOrdem_servico),
	constraint fk_ordem_servico_pecas_estoque foreign key (idEstoque_pecas) references estoque_pecas(idEstoque_pecas),
	constraint fk_ordem_servico_pecas_os foreign key (idOrdem_servico) references ordem_servico(idOrdem_servico)
);