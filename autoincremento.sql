create table exemplo (
        idexemplo serial not null,
        nome varchar(50) not null,

        constraint pk_exemplo_idexemplo primary key (idexemplo)

)

insert into exemplo (nome) values ('Exemplo 1');
insert into exemplo (nome) values ('Exemplo 2');
insert into exemplo (nome) values ('Exemplo 3');
insert into exemplo (nome) values ('Exemplo 4');

select * from exemplo
------------

select max(idbairro) + 1 from bairro -- Descobrimos a última chave primaria inserida

create sequence bairro_id_seq minvalue 5 -- Criação da sequencia com o valor minimo

alter table bairro alter idbairro set default nextval('bairro_id_seq') -- Altera o tipo do id da tabela

alter sequence bairro_id_seq owned by bairro.idbairro -- Atribuimos a sequencia a tabela
