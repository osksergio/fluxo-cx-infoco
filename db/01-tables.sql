create table contas(
	id_conta integer not null primary key,
	descricao varchar(80) not null unique,
	banco varchar(20)
	agencia varchar(15)
	conta varchar(15)
);

create table planos(
	id_plano integer not null primary key,
	descricao varchar(80) not null unique,
	tipo char(1)
);

create table lancamentos(	
	conta integer not null,
	id_lancamento integer not null,
	data_movimento date not null,
	plano integer not null,
	descricao varchar(80),
	valor numeric(15,2)
	primary key(conta, id_lancamento)
);

/* É INTERESSANTE DEFINIR COMENTÁRIOS PARA TODAS AS COLUNAS, EXEMPLO: */
ALTER TABLE lancamentos MODIFY COLUMN conta integer COMMENT 'Código da conta (FK)';
ALTER TABLE lancamentos MODIFY COLUMN id_lancamento integer COMMENT 'Código do lançamento';
ALTER TABLE lancamentos MODIFY COLUMN descricao varchar(8) COMMENT 'Descrição do lançamento';