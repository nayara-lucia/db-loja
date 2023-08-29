-- Cliente
select max(idcliente) + 1 from cliente
create sequence cliente_id_seq minvalue 16
alter table cliente alter idcliente set default nextval('cliente_id_seq')
alter sequence cliente_id_seq owned by cliente.idcliente
insert into cliente (nome,genero) values ('Teste sequência','F')
select * from cliente

-- Complemento
select max(idcomplemento) + 1 from complemento
create sequence complemento_id_seq minvalue 3
alter table complemento alter idcomplemento set default nextval('complemento_id_seq')
alter sequence complemento_id_seq owned by complemento.idcomplemento
insert into complemento (nome) values ('Teste sequência')
select * from complemento

-- Fornecedor
select max(idfornecedor) + 1 from fornecedor
create sequence fornecedor_id_seq minvalue 4
alter table fornecedor alter idfornecedor set default nextval('fornecedor_id_seq')
alter sequence fornecedor_id_seq owned by fornecedor.idfornecedor
insert into fornecedor (nome) values ('Teste sequência')
select * from fornecedor

-- Município
select max(idmunicipio) + 1 from municipio
create sequence municipio_id_seq minvalue 10
alter table municipio alter idmunicipio set default nextval('municipio_id_seq')
alter sequence municipio_id_seq owned by municipio.idmunicipio
insert into municipio (nome, iduf) values ('Teste sequência', 1)
select * from municipio

-- Nacionalidade
select max(idnacionalidade) + 1 from nacionalidade
create sequence nacionalidade_id_seq minvalue 5 
alter table nacionalidade alter idnacionalidade set default nextval('nacionalidade_id_seq')
alter sequence nacionalidade_id_seq owned by nacionalidade.idnacionalidade
insert into nacionalidade (nome) values ('Teste sequência')
select * from nacionalidade

-- Pedido
select max(idpedido) + 1 from pedido
create sequence pedido_id_seq minvalue 16
alter table pedido alter idpedido set default nextval('pedido_id_seq')
alter sequence pedido_id_seq owned by pedido.idpedido
insert into pedido (data_pedido, valor, idcliente, idvendedor)
values (current_date, 130, 1, 1)
select * from pedido

-- Pedido produto

-- Profissao
select max(idprofissao) + 1 from profissao
create sequence profissao_id_seq minvalue 6
alter table profissao alter idprofissao set default nextval('profissao_id_seq')
alter sequence profissao_id_seq owned by profissao.idprofissao
insert into profissao (nome) values ('Teste sequência')
select * from profissao

-- Transportadora
select max(idtransportadora) + 1 from transportadora
create sequence transportadora_id_seq minvalue 3
alter table transportadora alter idtransportadora set default nextval('transportadora_id_seq')
alter sequence transportadora_id_seq owned by transportadora.idtransportadora
insert into transportadora (nome) values ('Teste sequência')
select * from transportadora

-- UF
select max(iduf) + 1 from uf
create sequence uf_id_seq minvalue 7
alter table uf alter iduf set default nextval('uf_id_seq')
alter sequence uf_id_seq owned by uf.iduf
insert into uf (nome, sigla) values ('Teste sequência', 'TE')
select * from uf

-- Vendedor
select max(idvendedor) + 1 from vendedor
create sequence vendedor_id_seq minvalue 9
alter table vendedor alter idvendedor set default nextval('vendedor_id_seq')
alter sequence vendedor_id_seq owned by vendedor.idvendedor
insert into vendedor (nome) values ('Teste sequência')
select * from vendedor

-- Produto
select max(idproduto) + 1 from produto
create sequence produto_id_seq minvalue 8
alter table produto alter idproduto set default nextval('produto_id_seq')
alter sequence produto_id_seq owned by produto.idproduto

alter table pedido alter column data_pedido set default current_date;
alter table pedido alter column valor set default 0;
insert into pedido (idcliente, idvendedor) values (1, 1);
insert into pedido (idcliente, idvendedor, data_pedido, valor) 
values (1, 1, '2022-10-10', 234);