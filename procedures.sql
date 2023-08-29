create procedure insere_bairro(nome_bairro varchar(30)) language sql as
$$
	insert into bairro (nome) values (nome_bairro);
$$;

call insere_bairro('Teste procedure')

select * from bairro
-------------------------------
-- 1.	Crie uma stored procedure que receba como parÃ¢metro o ID do produto e o 
-- percentual de aumento, e reajuste o preÃ§o somente deste produto de acordo 
-- com o valor passado como parÃ¢metro
create procedure reajuste_preco(idp integer, percentual float) language sql as
$$
	update produto set valor = valor + ((valor * percentual) / 100) where idproduto = idp;
$$;
select * from produto
call reajuste_preco(3,50)

-- 2.	Crie uma stored procedure que receba como parÃ¢metro o ID do produto e 
-- exclua da base de dados somente o produto com o ID correspondente
create procedure deleta_produto(idp integer) language sql as
$$
	DELETE FROM produto WHERE idproduto = idp;
$$;
call deleta_produto(8)

select * from produto

