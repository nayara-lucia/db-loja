-- Funções
-- Função que pega os valores de uma coluna e edita suas casas decimais e acrescenta uma concatenação 'R$'
select valor, concat('R$', round(cast(valor as numeric),2)) from pedido 
--round define casas decimais
--cast converte double precision para numeric

create function formata_moeda(valor float) returns varchar(20) language plpgsql as
$$
begin
	return concat('R$', round(cast(valor as numeric),2));
end;
$$;
-- Chamada da função
select valor, formata_moeda(valor) from pedido
select valor, formata_moeda(valor) from produto
select formata_moeda(max(valor)) from pedido


-- Função que pega o id do cliente e trás o nome (podemos usar uma view ou criar a função abaixo)

create function get_nome_by_id(idc integer) returns varchar(50) language plpgsql as
$$
declare r varchar(50);
begin
	select nome into r -- Criação de variavel
	from cliente where idcliente = idc;
	return r;
end;
$$;

select data_pedido, valor, idcliente, get_nome_by_id(idcliente) from pedido
select get_nome_by_id(idcliente), genero from cliente

-- Função que pega o id do cliente e trás a nacionalidade

create function get_nac_by_id(nac integer) returns varchar(50) language plpgsql as
$$
declare n varchar(50);
begin
	select nome into n -- Criação de variavel
	from nacionalidade where idnacionalidade = nac;
	return n;
end;
$$;

select get_nome_by_id(idcliente), get_nac_by_id(idnacionalidade), genero from cliente

-- Função que recebe como parametro id do pedido e retorna o valor total do pedido 

create or replace function get_id_valor(idp integer) returns varchar(50) language plpgsql as
$$
begin
	return (select formata_moeda(valor) from pedido where idpedido = idp);
end;
$$;

select get_id_valor(idpedido) from pedido

