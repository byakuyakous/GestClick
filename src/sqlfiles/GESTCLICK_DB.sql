/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Abdelkrim
 * Created: Dec 27, 2018
 */

drop table if exists ADMINISTRATEUR;

drop table if exists ALLERGIE;

drop table if exists ANTECEDANT;

drop table if exists AVOIR_ALLERGIE;

drop table if exists COMPTE;

drop table if exists DENTISTE;

drop table if exists EMPLOYE;

drop table if exists OPERATION;

drop table if exists PATIENT;

drop table if exists RECEPTIONISTE;

drop table if exists RENDEZ_VOUS;

/*==============================================================*/
/* Table: ADMINISTRATEUR                                        */
/*==============================================================*/
create table ADMINISTRATEUR
(
   ID_EMPLOYE           varchar(20) not null,
   LOGIN                varchar(20) not null,
   CIN                  varchar(20),
   NOM                  varchar(20),
   PRENOM               varchar(20),
   DATE_NAISSANCE       date,
   DATE__D_EMBAUCHE     date,
   primary key (ID_EMPLOYE)
);

/*==============================================================*/
/* Table: ALLERGIE                                              */
/*==============================================================*/
create table ALLERGIE
(
   ID_ALLERGIE          varchar(20) not null,
   TYPE                 varchar(20),
   DEGRE                varchar(20),
   primary key (ID_ALLERGIE)
);

/*==============================================================*/
/* Table: ANTECEDANT                                            */
/*==============================================================*/
create table ANTECEDANT
(
   ID_ANTECEDANT        varchar(20) not null,
   ID_PATIENT           varchar(20) not null,
   DESIGNATION          varchar(20),
   DESCRIPTION          varchar(100),
   primary key (ID_ANTECEDANT)
);

/*==============================================================*/
/* Table: AVOIR_ALLERGIE                                        */
/*==============================================================*/
create table AVOIR_ALLERGIE
(
   ID_PATIENT           varchar(20) not null,
   ID_ALLERGIE          varchar(20) not null,
   primary key (ID_PATIENT, ID_ALLERGIE)
);

/*==============================================================*/
/* Table: COMPTE                                                */
/*==============================================================*/
create table COMPTE
(
   LOGIN                varchar(20) not null,
   ID_ADMINISTRATEUR    varchar(20) not null,
   MDP                  varchar(20),
   primary key (LOGIN)
);

/*==============================================================*/
/* Table: DENTISTE                                              */
/*==============================================================*/
create table DENTISTE
(
   ID_EMPLOYE           varchar(20) not null,
   LOGIN                varchar(20) not null,
   CIN                  varchar(20),
   NOM                  varchar(20),
   PRENOM               varchar(20),
   DATE_NAISSANCE       date,
   DATE__D_EMBAUCHE     date,
   primary key (ID_EMPLOYE)
);

/*==============================================================*/
/* Table: EMPLOYE                                               */
/*==============================================================*/
create table EMPLOYE
(
   ID_EMPLOYE           varchar(20) not null,
   CIN                  varchar(20),
   NOM                  varchar(20),
   PRENOM               varchar(20),
   DATE_NAISSANCE       date,
   DATE__D_EMBAUCHE     date,
   primary key (ID_EMPLOYE)
);

/*==============================================================*/
/* Table: OPERATION                                             */
/*==============================================================*/
create table OPERATION
(
   ID_DENTISTE          varchar(20) not null,
   ID_PATIENT           varchar(20) not null,
   TYPE_OPERATION       varchar(20),
   DATE                 date,
   REMARQUE             varchar(100),
   primary key (ID_DENTISTE, ID_PATIENT)
);

/*==============================================================*/
/* Table: PATIENT                                               */
/*==============================================================*/
create table PATIENT
(
   ID_PATIENT           varchar(20) not null,
   ID_RECEPTIONNISTE    varchar(20) not null,
   NOM                  varchar(20),
   PRENOM               varchar(20),
   DATE_NAISSANCE       date,
   LIEU_NAISSANCE       varchar(20),
   CIN                  varchar(20),
   TYPE_DE_SANG         varchar(20),
   primary key (ID_PATIENT)
);

/*==============================================================*/
/* Table: RECEPTIONISTE                                         */
/*==============================================================*/
create table RECEPTIONISTE
(
   ID_EMPLOYE           varchar(20) not null,
   LOGIN                varchar(20) not null,
   CIN                  varchar(20),
   NOM                  varchar(20),
   PRENOM               varchar(20),
   DATE_NAISSANCE       date,
   DATE__D_EMBAUCHE     date,
   primary key (ID_EMPLOYE)
);

/*==============================================================*/
/* Table: RENDEZ_VOUS                                           */
/*==============================================================*/
create table RENDEZ_VOUS
(
   ID_RECEPTIONNISTE    varchar(20) not null,
   ID_PATIENT           varchar(20) not null,
   DATE                 date,
   HEURE                time,
   VALIDATION           bool,
   primary key (ID_RECEPTIONNISTE, ID_PATIENT)
);

alter table ADMINISTRATEUR add constraint FK_ATHENTIFICATIONA foreign key (LOGIN)
      references COMPTE (LOGIN) on delete restrict on update restrict;

alter table ADMINISTRATEUR add constraint FK_HERITAGE_3 foreign key (ID_EMPLOYE)
      references EMPLOYE (ID_EMPLOYE) on delete restrict on update restrict;

alter table ANTECEDANT add constraint FK_AVOIR_ANTECEDANT foreign key (ID_PATIENT)
      references PATIENT (ID_PATIENT) on delete restrict on update restrict;

alter table AVOIR_ALLERGIE add constraint FK_AVOIR_ALLERGIE foreign key (ID_PATIENT)
      references PATIENT (ID_PATIENT) on delete restrict on update restrict;

alter table AVOIR_ALLERGIE add constraint FK_AVOIR_ALLERGIE2 foreign key (ID_ALLERGIE)
      references ALLERGIE (ID_ALLERGIE) on delete restrict on update restrict;

alter table COMPTE add constraint FK_ATHENTIFICATIONA2 foreign key (ID_ADMINISTRATEUR)
      references ADMINISTRATEUR (ID_EMPLOYE) on delete restrict on update restrict;

alter table COMPTE add constraint FK_CREER_COMPTE foreign key (ID_ADMINISTRATEUR)
      references ADMINISTRATEUR (ID_EMPLOYE) on delete restrict on update restrict;

alter table DENTISTE add constraint FK_AUTHENTIFICATIOND foreign key (LOGIN)
      references COMPTE (LOGIN) on delete restrict on update restrict;

alter table DENTISTE add constraint FK_HERITAGE_2 foreign key (ID_EMPLOYE)
      references EMPLOYE (ID_EMPLOYE) on delete restrict on update restrict;

alter table OPERATION add constraint FK_OPERER foreign key (ID_DENTISTE)
      references DENTISTE (ID_EMPLOYE) on delete restrict on update restrict;

alter table OPERATION add constraint FK_OPERER2 foreign key (ID_PATIENT)
      references PATIENT (ID_PATIENT) on delete restrict on update restrict;

alter table PATIENT add constraint FK_CREER_DOSSIER foreign key (ID_RECEPTIONNISTE)
      references RECEPTIONISTE (ID_EMPLOYE) on delete restrict on update restrict;

alter table RECEPTIONISTE add constraint FK_AUTHENTIFICATIONR foreign key (LOGIN)
      references COMPTE (LOGIN) on delete restrict on update restrict;

alter table RECEPTIONISTE add constraint FK_HERITAGE_1 foreign key (ID_EMPLOYE)
      references EMPLOYE (ID_EMPLOYE) on delete restrict on update restrict;

alter table RENDEZ_VOUS add constraint FK_RENDEZ_VOUS foreign key (ID_RECEPTIONNISTE)
      references RECEPTIONISTE (ID_EMPLOYE) on delete restrict on update restrict;

alter table RENDEZ_VOUS add constraint FK_RENDEZ_VOUS2 foreign key (ID_PATIENT)
      references PATIENT (ID_PATIENT) on delete restrict on update restrict;