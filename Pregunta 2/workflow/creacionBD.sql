create table estudiante(
	ci integer primary key,
	nombre varchar(255),
	apellidos varchar(255)
);

create table materia(
	id integer primary key,
	nombre varchar(100),
	sigla varchar(10),
	semestre int
);

create table inscrito(
	ci integer,
	id integer,
	foreign key (id) references materia(id),
	foreign key (ci) references estudiante(ci),
	primary key (ci, id)
);

insert into estudiante(ci,nombre,apellidos)values
(1,"user1", "user11"),
(2,"user2", "user22"),
(3,"user3", "user33");

insert into materia(id, nombre, sigla, semestre) values
(1, "Analsis matematico", "mat-115",1),
(2, "Matematica discreta", "mat-114",1),
(3, "Intro. a la programacion", "inf-111",1),
(4, "Laboratorio de inf-111", "lab-111",1),
(5, "Linguistica", "mat-116",1),
(6, "Logica de progrmacion", "mat-112",1);

insert into inscrito values
(1,1),
(1,5),
(2,1),
(3,2),
(3,6);



create table proceso(
	codFlujo varchar(5),
	codProceso varchar(5),
	codProcesoSiguiente varchar(5),
	tipo varchar(5),
	rol varchar(5),
	pantalla varchar(255)
);



insert into proceso(codFlujo,codProceso,codProcesoSiguiente,tipo,rol,pantalla)values 

("F1", "P1", "P2", "I", "E", "documentos.php"), 
("F1", "P2", "P3", "P", "E", "regdoc.php"), 
("F1", "P3", "P4", "p", "E", "selecsemestre.php"),
("F1", "P4", "P5", "p", "E", "semins.php"),
("F1", "P5", "P6", "P", "E", "selecmaterias.php"),
("F1", "P6", "P7", "P", "E", "matins.php"),
("F1", "P7", "P8", "P", "E", "inscribir.php"),
("F1", "P8", "P9", "C", "E", "mensaje.php"),
("F1", "P9", null, "P", "E", "materias_docs.php");

("F1", "P1", "P2", "I", "E", "documentos.php"), 
("F1", "P2", "P3", "p", "E", "selecsemestre.php"),
("F1", "P3", "P4", "P", "E", "selecmaterias.php"),
("F1", "P4", "P5", "P", "E", "inscribir.php"),
("F1", "P5", "P6", "C", "E", "mensaje.php");
("F1", "P6", null, "P", "E", "materias_docs.php");



create table seguimiento
(
nroTramite	varchar(10),
codFlujo varchar(3),
codProceso varchar(3),
estudiante varchar(20),
fechaini date,
fechafin date
);

insert into seguimiento values('10','F1','P1',"user1",'2018-04-01','2018-04-10');
insert into seguimiento values('20','F1','P2',"user2",'2018-04-03',null);
insert into seguimiento values('30','F2','P1',"user3",'2019-04-01',null);

create table semestre(
	id integer,
    semestre varchar(15)
);
insert into semestre values(1,"1er Sermestre");

create table documentos (
id int,
nomdoc varchar(30),
);

insert into documentos values(1,"CI");
insert into documentos values(2,"Diploma de Bachiller");
insert into documentos values(3,"Certificado de Habilitacion");
insert into documentos values(4,"Certificado de Nac");
insert into documentos values(5,"Deposito");

create table registroDoc(
	ciEst int,
	idDoc int
);


create table Iniciales
(
tipo varchar(20),
valor int
)

insert into iniciales VALUES('nrotramite', 101);