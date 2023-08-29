-- Criação de tabela de log
create table bairro_auditoria (
	idbairro integer not null,
	data_criacao timestamp not null
)


-- Criação da função do trigger
create function bairro_log() returns trigger language plpgsql as
$$
begin
	insert into bairro_auditoria (idbairro, data_criacao) values (new.idbairro, current_timestamp);
	return new;
end;
$$;

-- Criação do trigger
create trigger log_bairro_trigger after insert on bairro for each row execute procedure bairro_log();

call insere_bairro ('Teste 10');
call insere_bairro ('Teste 20');
call insere_bairro ('Teste 30');
select * from bairro
select * from bairro_auditoria

--- EXERCICIO
-- Crie uma tabela de pedidos_apagados

create table pedidos_apagados (
	idpedido integer not null,
	idcliente integer not null,
	idtransportadora integer,
	idvendedor integer not null,
	data_pedido date not null,
	valor float not null,
	data_exclusao date not null
)

-- Faça uma trigger que quando um pedido for apagado, todos os seus dados devem ser copiados para a tabela PEDIDOS_APAGADOS
-- FUNÇÃO
create or replace function pedidos_log() returns trigger language plpgsql as
$$
begin
	insert into pedidos_apagados (idpedido, idcliente, idtransportadora, idvendedor, data_pedido, valor, data_exclusao) 
	values (old.idpedido, old.idcliente, old.idtransportadora, old.idvendedor, old.data_pedido, old.valor, current_timestamp);
	return old;
end;
$$;

-- TRIGGER
create trigger log_pedido_trigger before delete on pedido for each row execute procedure pedidos_log();

select idpedido from pedido where idpedido not in (select idpedido from pedido_produto)

delete from pedido where idpedido in (16,18)

select * from pedidos_apagados
