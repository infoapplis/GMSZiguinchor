/* création de la base de données */

drop database if exists gms_news_app;

create database gms_news_app;

use gms_news_app;

/* création des tables */

create table utilisateur(
					id_utilisateur int auto_increment,
					pseudo varchar(15),
					mail varchar(25),
					mot_passe varchar(8),
					id_profil int,
					heure_connexion varchar(30),
					date_connexion date,
					primary key(id_utilisateur)
				)engine='InnoDB';				

create table profil(
					 id_profil int auto_increment,
					 nom_profil varchar(50),					
					 primary key (id_profil)
					 )engine='InnoBD';
					 
create table article(
					 id_article int auto_increment,
					 titre varchar(250),
					 date_article date,
					 statut int,
					 image varchar(50),
					 description varchar(1000000),
					 lien_video varchar(250),
					 id_auteur int,
					 id_categorie int,
					 primary key (id_article)
					 )engine='InnoBD';		

create table auteur(
					 id_auteur int auto_increment,
					 auteur varchar(50),
					 primary key (id_auteur)
					 )engine='InnoBD';	

create table categorie(
					 id_categorie int auto_increment,
					 nom varchar(50),
					 image varchar(50),
					 statut int,
					 primary key (id_categorie)
					 )engine='InnoBD';		
					 
create table commentaire(
					 id_commentaire int auto_increment,
					 commentaire varchar(250),
					 date_commentaire date,
					 id_article int,
					 id_utilisateur int,
					 primary key (id_commentaire)
					 )engine='InnoBD';	

create table reglage(
					 id_reglage int auto_increment,
					 nom_app varchar(50),
					 logo varchar(50),
					 mail varchar(50),
					 site_web varchar(50),
					 description varchar(250),
					 primary key (id_reglage)
					 )engine='InnoBD';					 

/* ajout de contraintes */	


alter table article add constraint fk_auteur foreign key(id_auteur) references auteur(id_auteur) ON DELETE CASCADE;
alter table article add constraint fk_categorie foreign key(id_categorie) references categorie(id_categorie) ON DELETE CASCADE;
alter table commentaire add constraint fk_article foreign key(id_article) references article(id_article) ON DELETE CASCADE;
alter table commentaire add constraint fk_utilisateur foreign key(id_utilisateur) references utilisateur(id_utilisateur) ON DELETE CASCADE;
alter table utilisateur add constraint fk_profil foreign key(id_profil) references profil(id_profil) ON DELETE CASCADE;


/* insertion des données dans la table catégorie chambre */

insert into profil 
values(1,"Administrateur"),
(2,"Editeur"),
(3,"Abonné");

insert into utilisateur 
values(1,"Admin","biaye89@gms.sn","admin",1,"","");
