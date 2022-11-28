use dboficina;

-- Quais os veiculos de cada cliente (marca, modelo, placa)?
select case when c.idCliente_PF is not null then nome_completo else  razao_social end as Cliente,
	case when c.idCliente_PF is not null then 'PF' else 'PJ' end as Tipo_Cliente,
	case when c.idCliente_PF is not null then 
		CONCAT(SUBSTR(pf.CPF, 1, 3),'.',SUBSTR(pf.CPF, 4, 3),'.', SUBSTR(pf.CPF, 7, 3),'-',SUBSTR(pf.CPF, 10, 2))        
	else CONCAT(SUBSTR(pj.CNPJ, 1, 2),'.',SUBSTR(pj.CNPJ, 3, 3),'.',SUBSTR(pj.CNPJ, 6, 3),'/',
				SUBSTR(pj.CNPJ, 9, 4),'-',SUBSTR(pj.CNPJ, 11, 2)) end as Documento,        
	Marca, Modelo, Placa
    from veiculo v
	left join cliente c on v.idCliente = c.idCliente    
	left join cliente_pf pf on c.idCliente_PF = pf.idCliente_PF
	left join cliente_pj pj on c.idCliente_PJ = pj.idCliente_PJ
	order by Cliente;

-- Quais as peças e respectivas quantidades e valores no estoque?
select Descricao, Quantidade, Valor_unitario, Round((Quantidade * Valor_unitario),2) as Valor_estoque
	from estoque_pecas
	order by Descricao;

-- Qual o total de Ordens de Serviço (OS) por status?
select Status, count(*) as Qnt_OS
	from ordem_servico
	group by Status;

-- Para cada OS, informe o cliente, o número do pedido e dados da OS
select case when c.idCliente_PF is not null then nome_completo else  razao_social end as Cliente,
	case when c.idCliente_PF is not null then 'PF' else 'PJ' end as Tipo_Cliente,   
	p.Numero as Numero_Pedido, os.Numero as Numero_OS, os.Data_OS, os.Valor as Valor_OS, os.Status
    from ordem_servico os
    left join pedido p on os.idPedido = p.idPedido
	left join cliente c on p.idCliente = c.idCliente    
	left join cliente_pf pf on c.idCliente_PF = pf.idCliente_PF
	left join cliente_pj pj on c.idCliente_PJ = pj.idCliente_PJ
	order by Cliente, os.Data_OS;        

-- Qual a equipe a que se vincula cada funcionário?;
select f.Codigo, f.Nome_completo, e.idEquipe as Equipe
	from funcionarios f
    left join equipes e on f.idEquipe = e.idEquipe;

-- Quais as OS válidas (não canceladas) executadas por cada equipe?
select e.idEquipe as Equipe, e.Responsavel, os.Numero as Numero_OS, os.Valor as Valor_OS 
	from equipes e 
	inner join ordem_servico os on e.idEquipe = os.idEquipe
    where os.Status <> 'Cancelada';

-- Dentre as OS concluídas, qual o tempo de execução de cada uma? (variável derivada, incluindo o dia da emissão)
select os.Numero as Numero_OS, os.Data_OS as Emissao, os.Data_conclusao as Conclusao, os.Valor as Valor_OS,
    datediff(os.Data_conclusao, os.data_OS) + 1 as Tempo_Execucao
    from ordem_servico os
    where os.Data_conclusao is not null
	order by os.Numero;