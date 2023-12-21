create table usuario(
	idusuario		serial			primary key,
	nome			varchar(150)	not null,
	email			varchar(100)	not null unique,
	senha			varchar(40)		not null);
	
create table conta(
	idconta			serial			primary key,
	nome			varchar(100)	not null,
	data			date			not null,
	valor			integer			not null,
	descricao		varchar(500)	not null,
	tipo			integer			not null check(tipo in (1,2)),
	idusuario		integer			not null,
	foreign key(idusuario) references usuario(idusuario)
);