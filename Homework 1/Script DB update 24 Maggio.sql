drop database MarketView;
create database MarketView;
use MarketView;

create table utente(
	codice_utente integer primary key auto_increment,
  nome varchar(255), 
  email varchar(255),
  psw varchar(255),
  tipo varchar(255)
)Engine = 'InnoDB';

create table catena_negozi(
	codice_cat integer primary key auto_increment,
  nome varchar(255) ,
  tipo varchar(255),
  immagine varchar(255),
  descrizione varchar(255),
  num_negozi integer
)Engine = 'InnoDB';
	
create table negozio(
	codice_neg integer primary key auto_increment,
  nome varchar(255) ,
  catena_app integer,
  nome_catena_app  varchar(255),
	luogo varchar(255),
  index idx_cod_neg(codice_neg),
  foreign key (catena_app) references catena_negozi(codice_cat)
)Engine = 'InnoDB';

create table articolo(
	codice_art integer ,
  negozio_app integer,
  nome_neg_app varchar(255),
	nome varchar(255),
  prezzo float,
  tipo varchar(255),
    immagine varchar(255),
  descrizione varchar(255),
  casa_prod varchar(255),
  num_pagine integer,
  autore varchar(255),
  index idx_cod_art(codice_art),
  foreign key (negozio_app) references negozio(codice_neg),
  primary key(codice_art,negozio_app)
	)Engine = 'InnoDB';

create table dipendente(
	codice_dip integer primary key auto_increment, 
  nome varchar(255),
  data_nascita date,
  telefono varchar(255),
  email varchar(255),
	psw varchar(255),
  stipendio float,
  bonus integer default 0
)Engine = 'InnoDB';

create table area(
	codice_area integer primary key,
  nome varchar(255)
)Engine = 'InnoDB';

create table appartiene(
	negozio integer,
	articolo integer,
	area integer,
	index idx_neg(negozio),
	index idx_art(articolo),
  foreign key (negozio,articolo) references articolo(negozio_app,codice_art),
	index idx_area(area),
  foreign key (area) references area(codice_area),
  primary key (articolo,area)
)Engine = 'InnoDB';

create table lavora(
	id integer primary key, 
  negozio integer,
	area integer,
  dipendente integer,
  data_inizio date,
	index idx_neg(negozio),
  foreign key (negozio) references negozio(codice_neg),
	index idx_area(area),
  foreign key (area) references area(codice_area),
	index idx_dip(dipendente),
  foreign key (dipendente) references dipendente(codice_dip)
)Engine = 'InnoDB';

 
create table lavoro_presente(
	lavoro_id integer primary key,
  index idx_lavoro_pres(lavoro_id),
  foreign key (lavoro_id) references lavora(id)
)Engine = 'InnoDB';

create table lavoro_passato(
	lavoro_id integer primary key,
  data_fine date,
  index idx_lavoro_pass(lavoro_id),
  foreign key (lavoro_id) references lavora(id)
)Engine = 'InnoDB';
/*
 create table catenePref(
	codice_utente_pref integer,
  codice_cat_pref integer ,
	index idx_cod_utente(codice_utente_pref),
  foreign key (codice_utente_pref) references utente(codice_utente),
	foreign key (codice_cat_pref) references catena_negozi(codice_cat),
	primary key(codice_utente_pref,codice_cat_pref)
 )Engine = 'InnoDB';
  drop table catenePref;

  create table negoziPref(
	codice_utente_pref integer,
  codice_neg_pref integer ,
	index idx_cod_utente(codice_utente_pref),
  foreign key (codice_utente_pref) references utente(codice_utente),
	foreign key (codice_neg_pref) references negozio(codice_neg),
	primary key (codice_utente_pref,codice_neg_pref)
 )Engine = 'InnoDB';
 
   create table articoliPref(
	codice_utente_pref integer,
  codice_art_pref integer ,
	index idx_cod_utente(codice_utente_pref),
  foreign key (codice_art_pref) references articolo(codice_art),
	foreign key (codice_utente_pref) references utente(codice_utente),
	primary key (codice_utente_pref,codice_art_pref)
 )Engine = 'InnoDB';
 */
 	create table pref_cat(
	codice integer ,
 nome varchar(255),
  email varchar(255),
 catena varchar(255),
 	primary key (codice,catena)
 )Engine = 'InnoDB';
 
 
	create table pref_neg(
	codice integer ,
	nome varchar(255),
  email varchar(255),
	negozio varchar(255),
 	primary key (codice,negozio)
 )Engine = 'InnoDB';
 
	create table pref_art(
	codice integer ,
	nome varchar(255),
  email varchar(255),
	articolo varchar(255) ,
 	primary key (codice,articolo)
 )Engine = 'InnoDB';
 
--------------------------------------------- DATI ------------------------------------------------

insert into `catena_negozi`( `nome`, `tipo`,`immagine`,`num_negozi`)
values ('Yamaha Corporation','musicale',"./img/yamaha.jpeg",2),
			 ('Rode Microphones','musicale',"./img/rode1.jpeg",2),
       ('Ibanez Company', 'musicale',"./img/ibanez.jpeg",1),
       ('Gibson Company', 'musicale',"./img/gibson.jpeg",1),
       ('Biasin Musical Instruments','musicale',"./img/biasin.jpeg",1),
       ('Fender Company','musicale',"./img/fender.jpeg",1),
       ('Presonus Corporation','musicale',"./img/presonus.jpeg",2),
       ('Acus Sound','musicale',"./img/acus.jpeg",2),
       ('Dynaudio Corporation','musicale',"./img/dynaudio3.jpeg",1),
       ('Audix Company','musicale',"./img/audix.jpeg",2);
       
insert into `catena_negozi`( `nome`, `tipo`,`num_negozi`)
values ('H&M Corporation','abbigliamento',5),
('Zara Corporation','abbigliamento',2),
 ('Animal Pet Company','abbigliamento',1);

insert into `negozio`(`nome`, `catena_app`) 
values ( 'Musicando',1),
			 ('Tutto Musica',1),
       ('Ishibashi Music',2),
       ('Keymusic',00003),
       ( 'Carter Vintage Guitars',2),
       ('Mixsound',00007),
       ('MusicalStore2000',5),
       ('Pentagramma',4),
       ('Music City',10),
       ('Santoro Strumenti',10),
			 ('Chopin Shop',6),
			 ('De Santis Shop',7),
			 ('Sicilia Strumenti',8),
			 ('Sound Shop',8),
			 ('Your Music',9);
       
insert into `articolo`(`codice_art`,`negozio_app`,`nome`,`prezzo`,`tipo`,`immagine`,`casa_prod`,`num_pagine`,`autore`)
values (1,1,'Chitarra S300 Black',108,'strumento','./img/chitarra_S300_Black.jpeg','Eko',null,null);

insert into `articolo`(`codice_art`,`negozio_app`,`nome`,`prezzo`,`tipo`,`immagine`,`casa_prod`,`num_pagine`,`autore`)
	values (2,1,'Chitarra GRG140 WH White',185,'strumento','./img/Chitarra_GRG140_WH_White.jpeg','IBANEZ',null,null),
       (3,10,'Chitarra CG102',189,'strumento','./img/Chitarra_CG102.jpeg','YAMAH',null,null),
       (4,2,'Pianoforte PX770 Black',699,'strumento','./img/Pianoforte_PX770_Black.jpeg','CASIO',null,null),
       (5,3,'Pianoforte AP710 Celviano',1539,'strumento','./img/casioap710celviano.jpeg','CASIO',null,null),
       (6,11,'Microfono SV100', 35,'strumento','./img/microfono_sv100_shure.jpeg','SHURE',null,null),
       (7,5,'Violino V5SC',415,'strumento','./img/Violino_V5SC.jpeg','YAMAHA',null,null),
       (8,12,' Microfono PD70',129,'strumento','./img/Microfono_PD70_presonus.jpeg','PRESONUS',null,null),
       (9,4,' Tecnica Pianistica Vol.1', 10.90,'libro','./img/Tecnica_Pianistica_Vol.1.jpeg','giunti',30,'Alessandro LONGO'),
       (10,12,'Czerny 70 esercizi progressivi',12.70,'libro','./img/Czerny_70_esercizi_progressivi.jpeg','giunti',50,'CZERNY'),
       (11,6,'Pozzoli 16 studi',10.70,'libro','./img/Pozzoli_16_studi.jpeg','Bompiani',15,'Ernesto Pozzoli'),
       (12,7,'30 Studi a corde doppie vol.2',10.50,'libro','./img/30_Studi_a_corde_doppie_vol.2.jpeg','Adelphi',17,'Armando Polo'),
       (13,9,'Beyer - Op.101', 9, 'libro','./img/Beyer_Op.101.jpeg','Bompiani',25,'Beyer'),
       (14,10,'Leggio RSM300',9.90,'accessorio','./img/Leggio_RSM300.jpeg','PROEL' ,null,null),
       (15,13,'Leggio in legno MS332',39,'accessorio','./img/Leggio_in_legno_MS332.jpeg','QUIKLOK',null,null),
       (16,14,'Accordatore CA2 Chromatic Tuner',15,'accessorio','./img/Accordatore_CA2.jpeg','KORG',null,null),
       (17,15,'Batteria  Roadshow RS525SC/C',499,'strumento','./img/Batteria_Roadshow.jpeg','PEARL',null,null),
       (18,10,'Sassofono YAS280',975,'strumento','./img/Sassofono_YAS280.jpeg','YAMAHA ',null,null),
       (19,8,'Poggiapiede FC600',9.50,'accessorio', './img/Poggiapiede_FC600.jpeg',' PROEL',null,null),
       (20,9,'Plettri  B1000PG30G',6,'accessorio','./img/Plettri_B1000PG30G.jpeg','IBANEZ',null,null),
			 (21,9,'Tecnica Pianistica Vol.1', 10.90,'libro','./img/Tecnica_Pianistica_Vol.1.jpeg','giunti',14,'Alessandro LONGO'),
			 (22,1,'Tecnica Pianistica Vol.2', 10, 'libro','./img/Tecnica_Pianistica_Vol.2.jpeg','giunti',27,'Alessandro LONGO'),
			 (23,10,'Tecnica Pianistica Vol.3', 11, 'libro','./img/Tecnica_Pianistica_Vol.3.jpeg','giunti',20,'Alessandro LONGO'),
			 (24,10,'Tecnica Pianistica Vol.4', 12, 'libro','./img/Tecnica_Pianistica_Vol.4.jpeg','giunti',25,'Alessandro LONGO');
		-- sistema queste giu
    
insert into `articolo`(`codice_art`,`negozio_app`,`nome`,`prezzo`,`tipo`,`immagine`,`casa_prod`,`num_pagine`,`autore`)
values(27,12,'Microfono PD70',100,'strumento','./img/Microfono_PD70_presonus.jpeg','PRESONUS',null,null),
			 (28,14,'Accordatore CA2 Chromatic Tuner',10,'accessorio','./img/Accordatore_CA2.jpeg','KORG',null,null),
       (29,11,'Microfono SV100', 25,'strumento','./img/microfono_sv100_shure.jpeg','SHURE',null,null),
			 (30,7,'30 Studi a corde doppie vol.1',7.5,'libro','./img/30_Studi_a_corde_doppie_vol.1.jpeg','Adelphi',19,'Armando Polo'),
				(17,2,'Batteria Roadshow RS525SC/C',499,'strumento','./img/Batteria_Roadshow.jpeg','PEARL',null,null),
       (25,7,'30 Studi a corde doppie vol.1',12,'libro','./img/30_Studi_a_corde_doppie_vol.1.jpeg','Adelphi',19,'Armando Polo'),
			 (26,7,'30 Studi a corde doppie + Accompagnamento',19,'libro','./img/30_Studi_a_corde_doppie_Accompagnamento.jpeg','Adelphi',30,'Armando Polo'),
   		(27,12,'Microfono PD70',100,'strumento','./img/Microfono_PD70_presonus.jpeg','PRESONUS',null,null),
			 (28,14,'Accordatore CA2 Chromatic Tuner',10,'accessorio','./img/Accordatore_CA2.jpeg','KORG',null,null),
       (29,11,'Microfono SV100', 25,'strumento','./img/microfono_sv100_shure.jpeg','SHURE',null,null),
			 (30,7,'30 Studi a corde doppie vol.1',7.5,'libro','./img/30_Studi_a_corde_doppie_vol.1.jpeg','Adelphi',19,'Armando Polo');
				
              
       /* -- ATT:
       un libro è identificato univocamente dal codice_articolo di quel negozio e 
       il codice_negozio di appartenenza QUINDI:
        quindi se vi sono più copie del libro nello stesso negozio 
        non avranno lo stesso codice, bensi probabilmente lo stesso titolo
       */
														-- aggiungi pass 
insert into `dipendente`(`nome`,`data_nascita`,`telefono`,`email`,`psw`,`stipendio`)
values('Elio','1997-10-20','3332637498','eliovinci@gmail.com','passwordelio',500),
				('Barbara','1996-06-04','3336427498','barbara774@gmail.com','',370),
      ('Concetta','1998-09-22','3382345498','conny98@gmail.com','',500), 
      ('Agatino','1996-07-02','3332637990','agatino002@gmail.com','',200),
      ('Francesco','1998-05-13','3452757498','melifrancesco@gmail.com','',300),
      ('Alessio','1999-08-09','3457129837','alamarino@gmail.com','',590),
      ('Vincenzo','1999-08-24','3428765037','vincenzo93@gmail.com','',0),
      ('Marta','2001-10-13','3332637000','marta777@gmail.com','',0),
      ('Mario','2001-01-24','3332637666','mariorossi@gmail.com','',0),
			('Giada','1952-10-11','3332637000','giada52@gmail.com','',450);

      
select * from dipendente;
insert into `area`(`codice_area`, `nome`)
values (00001,'Area Accessori'),
			 (00002,'Area Strumenti'),
       (00003,'Area Libri'),
       (4, 'Area Sconti');
       
insert into `lavora`(`id`,`negozio`,`area`,`dipendente`,`data_inizio`)
values (12345,00001,00001,00001,'2010-01-01'),
	     (66789,00001,00002,00002,'2010-01-02'),
		   (96738,00001,00003,00003,'2017-01-03'),
       (59844,00002,00001,00007,'2019-07-22'),
       (57325,00003,00003,00006,'2010-05-19'),
       (98462,00003,00002,00005,'2019-02-17'),
       (93383,00005,00002,00004,'2013-03-07'),
			 (00343,00002,00002,00004,'2008-01-06'),
			 (00738,00010,00003,00003,'2008-11-17'),
       (00345,00007,00001,00001,'2003-09-26'),
       (00789,00005,00002,00002,'2005-06-07'),
       (00462,00003,00002,00005,'2004-12-03'),
				(7326,1,1,8, '1995-01-03' ),
				(7366,1,4,9, '2001-03-02' ),
				(7369,1,4,10, '2007-04-05' );

insert into `lavoro_presente`(`lavoro_id`)
values (12345),
	     (66789),
		   (96738),
       (59844),
       (57325),
       (98462),
       (93383),
       (7326),
       (7366), 
       (7369);
       

insert into `lavoro_passato`(`lavoro_id`,`data_fine`)
values (00343,'2008-06-06'),
			 (00738,'2008-12-17'),
       (00345,'2003-12-26'),
       (00789,'2005-11-07'),
       (00462,'2007-12-03');


insert into `appartiene`(`negozio`,`articolo`,`area`)
values (1,1,2),
			 (1,2,2),
       (10,3,2),
       (2,4,2),
       (3,5,2),
			 (11,6,2),
			 (5,7,2),
			 (12,8,2),
			 (4,9,3)
			 (12,10,3),
       (6,11,3),
       (7,12,3),
       (9,13,3),
       (10,14,1),
       (13,15,1),
       (14,16,1),
       (15,17,2),
       (10,18,2),
       (8,19,1),
       (9,20,1),
       (9,21,3),
        (1,22,3),
				(10,23,3),
        (10,24,3),
         (7,25,3),
         (7,26,3),
        (12,27,4),
        (14,28,4),
        (11,29,4),
        (7,30,4),
        (2,17,4);
								
insert into `utente`(`nome`,`email`,`psw`,`tipo`)
values ('Luisa','luisasantoro98@gmail.com','marketview','manager'),
('Cristian','cri@gmail.com','cri123','cliente'),
('Alessio','marino@gmail.com','1234','cliente'),
 ('Salvo','salvo@gmail.com','1234','manager'),
('Cristian','cri@gmail.com','1234','cliente');


drop table lavora;

-- ------------------------------------ OPERAZIONI ---------------------------------------------------------

  -- Implementazione della vista per visualzzare il nome dei negozi che appartengono ad una catena

drop view VistaCatenaNegozi;
create view VistaCatenaNegozi as 
select catena_negozi.codice_cat as CODICE_CATENA,catena_negozi.nome as NOME_CATENA, 
			 negozio.nome as NOME_NEGOZIO,negozio.codice_neg as CODICE_NEGOZIO
from catena_negozi  join negozio  on codice_cat = catena_app;
select * from VistaCatenaNegozi;


-- Implementazione della vista per visualzzare quali dipendendi 
-- lavorano in una determinata area di un negozio

drop view VistaLavora;
 
create view VistaLavora as 
	select dipendente.nome as DIPENDENTE, lavora.negozio as COD_NEGOZIO, negozio.nome as NOME_NEGOZIO,
  lavora.area as COD_area, area.nome as NOME_area,lavora.data_inizio as DATA_INIZIO_LAVORO, lavora.id as ID_LAVORA
				, lavoro_passato.data_fine as DA_FINE_LAVORO_PASSATO
  from lavora left join lavoro_passato on id = lavoro_id 
 join dipendente on codice_dip = dipendente 
  join negozio on codice_neg = negozio
  join area on codice_area = area;

select * from VistaLavora;

/* 
------------- OPERAZIONE 1---------------
" Trovare tramite il codice di un negozio, i libri che costano meno di 20 euro e 
che hanno più di 15 pagine,raggruppandoli per nome       */
  

drop procedure RicercaArticolo;
delimiter // 
create procedure RicercaArticolo(in codice_in integer)
begin
	drop temporary table if exists tmp;
  create temporary table tmp(
    TITOLO varchar(255),
    PREZZO float,
    PAGINE varchar(255)
    );
    insert into tmp 
			select  articolo.nome as TITOLO,articolo.prezzo as PREZZO,articolo.num_pagine as PAGINE
      from articolo
      where articolo.negozio_app = codice_in
						and articolo.tipo like 'libro'
            group by nome
           having num_pagine > 15 and prezzo < 20;
			select * from tmp ;
    END // 
		delimiter ;
select * from articolo;
call RicercaArticolo(7); 




 /*--
 ---- OPERAZIONE 2 ------
	"Visualizzare tramite il codice di un dipendente quanto tempo (anni) un dipendente 
   ha trascorso in un area del negozio " */ 

drop procedure Anni_Lavoro;
delimiter // 
create procedure Anni_Lavoro(in codice_dip integer)
begin
	drop temporary table if exists dipendente_out;
  create temporary table dipendente_out(
    TEMPO_TRASCORSO double,
    CODICE_AREA integer,
    LAVORO_ID integer
    );
    insert into dipendente_out 
    select DATEDIFF(dipendente.tempo,dipendente.data_inizio)/365 as TEMPO_TRASCORSO, dipendente.area as CODICE_AREA,dipendente.id as LAVORO_ID
    from (select lavora.*,
					(CASE 
						when lavoro_passato.data_fine is null
            then current_date()
            else lavoro_passato.data_fine
						END		)
            as tempo
					from lavora left join lavoro_passato on id = lavoro_passato.lavoro_id 
							left join lavoro_presente on id = lavoro_presente.lavoro_id
					where lavora.dipendente = codice_dip ) as dipendente;
          select * from dipendente_out ;
    END // 
    delimiter ;

call Anni_Lavoro(1); 
select * from dipendente;

/* TRIGGER PER ALLINEARE ATTRIB. RIDONDNDEA DELLA SCRITTURA*/
/* 


/* -- trigger per attributo eta' 
drop trigger eta_dipendente;

delimiter //
 create trigger eta_dipendente
 before insert on dipendente 
  for each row
  begin 
    set new.eta = (DATEDIFF(current_date(),new.data_nascita)/365);
end //
    
/* --  altro caso  delimiter //
  */
    -- trigger per num_negozi 
    delimiter //
create trigger numero_negozi
	after insert on negozio
  for each row
  begin 
				if exists (select * 
									 from negozio
									 where codice_neg = new.codice_neg)
				then
					update catena_negozi
							set num_negozi = num_negozi + 1
				where codice_cat = new.catena_app;
          else
             signal sqlstate '45000'
            set message_text = ' Si è verificato un errore durante inserimento dati';
  end if;
end //
delimiter ;

/* Op3:  " Tramite l'inserimento del codice,modificare il bonus annuale di un dipendente in base all'età e al suo stipendio:
					- se ha meno di 20 anni e guadagna meno di 300€ riceverà un bonus di 300 €
          - se ha meno di 30 anni e guadagna meno di 500€ riceverà un bonus di 500€
          - se ha più di 50 anni e guadagna meno di 700€  riceverà un bonus di 1000€ */ 
/* 
OP 4: Tramite l'inserimento del codice di una catena, 
trovare una catena di negozi che ha più di due negozi al suo interno raggruppandole per tipo 'musicale' " 

drop procedure Conta_Negozi;
delimiter // 
create procedure Conta_Negozi(in codice_catena integer)
begin
		drop temporary table if exists tmp;
    create temporary table tmp(
		nome_catena varchar(255),
		num_negozi integer
    );
    insert into tmp
			select distinct catena_negozi.nome as CATENA, catena_negozi.num_negozi as NUMERO_NEGOZI
			from catena_negozi join negozio on codice_cat = catena_app
	      group by tipo = 'musicale' 
      having num_negozi > 1 ;
  --  select * from tmp;
end // 

call Conta_Negozi(1);
select * from catena_negozi;
*/

drop procedure Bonus;
delimiter // 
create procedure Bonus(in codice_inserito integer)
    begin 
		update dipendente
			set  bonus = 
      ( case 
					when (DATEDIFF(current_date(),data_nascita)/365) <= 20  and stipendio < 300 then  300
          when (DATEDIFF(current_date(),data_nascita)/365) <= 30  and stipendio < 500 then  500
					when (DATEDIFF(current_date(),data_nascita)/365) >= 50  and stipendio < 700 then 1000
          else 0 
					end)
       where codice_inserito  = codice_dip;
		 end //
	delimiter ;
			
call Bonus(9); 
select * from dipendente;


/* -----------id--------------- OPERAZIONE 4 ----------------------------
		Trovare i nomi delle catene di negozi che hanno più di numero di negozi negozi, 
    dove il numero di negozi è inserito dall'utente   */

drop procedure Conta_Negozi;
delimiter // 
create procedure Conta_Negozi(in numero_input integer)
begin
		drop temporary table if exists tmp;
    create temporary table tmp(
		nome_catena varchar(255),
		num_negoz integer
    );
    insert into tmp
			select distinct nome as catena, num_negozi 
			from catena_negozi 
      where num_negozi > numero_input;
    select * from tmp;
end // 
delimiter ;

call Conta_Negozi(1);
select * from catena_negozi;


/*  Business Rule: Ogni dipendente deve essere maggiorenne  */

drop trigger MaggioreEta;
delimiter // 
create trigger MaggioreEta
before insert on dipendente 
for each row
begin 
	if ((DATEDIFF(current_date(),new.data_nascita)/365)< 18 )
            then 
            signal sqlstate '45000'
            set message_text = ' Il dipendente inserito non puo essere minorenne ';
	end if;
end //
delimiter ;


/* query prova - ripasso 

use NegozioMusicale;

select * from catena_negozi;
select * from negozio;
select * from dipendente;
select * from area;
select * from articolo;
select * from lavora;


/* query1: conta il numero medio di negozi che sono posseguti dalle catene */

select avg(num_negozi) as num_medio
from catena_negozi;



/* query 2: creare una vista da cui si ottengono le informazioni dell'area, 
						dell'articolo e del negozio a cui appartiene che abbiano un 
            prezzo minore di 1000 € e che sono di tipo diverso */
            
		drop view Info;
	create view Info as
  select articolo.nome as NOME_ARTICOLO, articolo.prezzo as PREZZO,
				 area.nome as NEGOZIO_AREA,
         negozio.nome as NOME_NEGOZIO
  from articolo join negozio on negozio_app = codice_neg
			join appartiene on codice_art = articolo
      join area on codice_area = area
  where prezzo < 1000 
	group by tipo;
  
  select * from Info;  
  select * from negozio;
  select * from articolo;
  
  
/* query 3: selezionare tutti i libri che hanno un numero di pagine maggiore di 15 
						e il cui negozio appartenga ad una catena che possiede almeno due negozi */
            
            
					select articolo.nome as NOME, articolo.num_pagine as NUM_PAGINE,
          catena_negozi.num_negozi as NUM_NEGOZI_CATENA
          from articolo join appartiene on codice_art = articolo
								join negozio on codice_neg = negozio
                join catena_negozi on codice_cat = catena_app
          where  articolo.tipo like 'libro' and articolo.num_pagine > 15 
								 and catena_negozi.num_negozi > 1;
			
select * from lavora;
/* Query Elio */

/* Assumendo che un dipendende possa lavorare più volte in un negozio
	-> Trovare il dipendente che ha lavorato più volte nello stesso negozio
*/



-- ->	Trovare il numero medio di articoli per ogni area 

select * from lavora;
 select * from dipendente;
 
-- num di articoli per ogni area 
 drop view ArticoliTotArea;
 create view  ArticoliTotArea as
select count(distinct articolo) as num,area as cod_area
from appartiene
group by area;
-- la media di num di articoli per ogni area    
select avg(num),cod_area
from ArticoliTotArea
group by cod_area;
 
-- ->Trovare il negozio con il dipendente più giovane

select max(data_nascita)
	from dipendente;

select negozio as codice_negozio,dipendente as codice_dipendente, dipendente.nome as nome_dipendente 
from lavora join dipendente on dipendente = codice_dip
where data_nascita in (select max(data_nascita)
											from dipendente
										  );


/*
	 Immaginando di avere una 'quantita' in articolo
   se sono un dipendente compro l'oggetto quindi aggiorno il campo della quantità
   e nello stesso momento visualizzare lo sconto dipendente (cioè il prezzo già scontato) 
   (sono due query separate, si fa tramite procedura) 
*/
 use NegozioMusicale;
 
/*
		trovare gli articoli che sono presenti in un area in cui 
    lavorano dipendenti da più di x anni
*/

select * from vistalavora;
select * from lavora; 
delimiter //
-- codice- in = anni 

-- anni = datediff(current_date(),data_inizio)/365

create view anni_dip as
select  datediff(current_date(),data_inizio_lavoro)/365 as anni,dipendente as nome_dipendente
from vistalavora;

select * from anni_dip;


create procedure TrovaArticoli(in codice_in integer, in anni_dip)
drop temporary table if exists tmp;
create temporary table tmp(
  articoli integer,
  area integer,
  anni_d integer
)
insert into tmp
select articoli as codice_articolo, area as codice_area, anni_d as anni_dip
from vistalavora join anni_dip on dipendente = anni_dip
where codice_in = anni_dip
select * from tmp;
end // 

delimiter ;





-- operazione stipendio nuovi dipendenti
drop procedure SetStipendio;
delimiter // 
create procedure SetStipendio(in codicedip integer,in stip integer)
begin
UPDATE dipendente SET stipendio = stip WHERE codicedip = codice_dip;
    END // 
    delimiter ;

call SetStipendio(1,6000);
select * from dipendente;



-- op Elimina Dipendente
drop procedure EliminaDipendente;
delimiter // 
create procedure EliminaDipendente(in codicedip integer)
begin

DELETE from dipendente
WHERE codicedip = codice_dip;
END // 
delimiter ;

call EliminaDipendente(10);
select * from dipendente;

drop procedure EliminaDipendente;
-- MODIFICA COSTO DI UN ARTICOLO


drop procedure ModificaCosto;
delimiter // 
create procedure ModificaCosto(in codice_in integer,in new_prezzo integer)
begin
UPDATE articolo SET prezzo = new_prezzo WHERE codice_art= codice_in;
    END // 
    delimiter ;

call ModificaCosto(1,88);
select * from articolo;

-- AGGIUNTA PREFERITI  con email 

call ModificaCosto(1,88);
select * from articolo;


-- AGGIUNTA PREFERITI  con email 
drop procedure assNome;
delimiter // 
create procedure assNome(in email_in varchar,out nome_out varchar)
begin

SELECT nome,email from dipendente union select nome,email from utente;

    END // 
    delimiter ;


create view  assNomeEmail as
select nome,email from dipendente union select  nome,email from utente;

select * from assNomeEmail;

s

 -- trigger per nome/email 
    delimiter //
create trigger nomenome
after insert on preferiti
  for each row
  begin 
				if exists (select *
									 from assNomeEmail 
									where email = new.email)
				then
					update preferiti
							set nome_utente = nome;
          else
             signal sqlstate '45000'
            set message_text = ' Si è verificato un errore durante inserimento dati';
  end if;
end //
delimiter ;


-- ricorda operazione per tab ALTER TABLE dipendente AUTO_INCREMENT ì=12;
