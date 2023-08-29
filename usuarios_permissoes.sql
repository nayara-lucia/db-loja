-- Criação de permissão
create role gerente;
create role estagiario;

grant select, insert on bairro,cliente,complemento,fornecedor,municipio,nacionalidade,pedido,pedido_produto,profissao, transportadora,uf,vendedor
to gerente with grant option;

grant select on produto_fornecedor, base_clientes to estagiario;

-- Criação de usuarios que estarão ligados as permissões. Ex: pode existir mais de 1 estagiario e gerentes

create role nayara login password '123' in role estagiario;
create role fernanda login password '321' in role gerente;
