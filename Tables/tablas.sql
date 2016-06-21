create table MOBILEUM_ASP_AUX(
PAIS                          char(3 char) GENERATED ALWAYS AS (substr(ARCHIVO,-16,3)) VIRTUAL,
FECHA                         varchar2(20 char),
CNT_LLAMADAS                  number,
CNT_POLITICA_RESTRICCION      number,
CNT_BOLQ_REL_TIPO_GEST        number,
CNT_BLOQ_RAN_REL              number,
CNT_PERMITIERON_CONTINUAR     number,
CNT_CONECTADAS_VOICE_MAIL     number,
CNT_CONECTADA_ANUNCIO_SWITCH  number,
ARCHIVO                       VARCHAR2(500 BYTE)
) nologging;

-- DROP TABLE MOBILEUM_ASP_RAW

create table MOBILEUM_ASP_HOUR(
PAIS                          char(3 char) not null enable,
FECHA                         date not null enable,
CNT_LLAMADAS                  number not null enable,
CNT_POLITICA_RESTRICCION      number not null enable,
CNT_BOLQ_REL_TIPO_GEST        number not null enable,
CNT_BLOQ_RAN_REL              number not null enable,
CNT_PERMITIERON_CONTINUAR     number not null enable,
CNT_CONECTADAS_VOICE_MAIL     number not null enable,
CNT_CONECTADA_ANUNCIO_SWITCH  number not null enable
) nologging;
--PARTITION BY RANGE (FECHA) 
--INTERVAL(NUMTODSINTERVAL (1, 'DAY'))
--(  
--  PARTITION MOBILEUM_ASP_RAW_20160526 VALUES LESS THAN (TO_DATE('26.05.2016','dd.mm.yyyy'))
-- );

alter table MOBILEUM_ASP_HOUR add constraint MOBILEUM_ASP_HOUR_PK primary key (PAIS,FECHA);

comment on table MOBILEUM_ASP_HOUR is 'Tabla contenedora de datos correspondientes a plataforma MOBILEUM, proveedor ANTISPAMMING (ASP)';
comment on column MOBILEUM_ASP_HOUR.PAIS is 'Pais. Ej. ARG';

comment on column MOBILEUM_ASP_HOUR.FECHA is 'Rango horario.';
comment on column MOBILEUM_ASP_HOUR.CNT_LLAMADAS is 'Cantidad de llamadas totales.';
comment on column MOBILEUM_ASP_HOUR.CNT_POLITICA_RESTRICCION is 'Cantidad de llamadas que matchearon alguna política de restricción.';
comment on column MOBILEUM_ASP_HOUR.CNT_BOLQ_REL_TIPO_GEST is 'Cantidad de llamadas bloqueadas con release tipo congestión.';
comment on column MOBILEUM_ASP_HOUR.CNT_BLOQ_RAN_REL is 'Cantidad de llamadas bloqueadas con random releases.';
comment on column MOBILEUM_ASP_HOUR.CNT_PERMITIERON_CONTINUAR is 'Cantidad de llamadas que se permitieron continuar.';
comment on column MOBILEUM_ASP_HOUR.CNT_CONECTADAS_VOICE_MAIL is 'Cantidad de llamadas conectadas al Voice Mail.';
comment on column MOBILEUM_ASP_HOUR.CNT_CONECTADA_ANUNCIO_SWITCH is 'Cantidad de llamadas conectadas a un anuncio en el switch.';
--**--
-- DROP TABLE MOBILEUM_ASP_DAY;
create table MOBILEUM_ASP_DAY(
PAIS                          char(3 char) not null enable,
FECHA                         date not null enable,
CNT_LLAMADAS                  number not null enable,
CNT_POLITICA_RESTRICCION      number not null enable,
CNT_BOLQ_REL_TIPO_GEST        number not null enable,
CNT_BLOQ_RAN_REL              number not null enable,
CNT_PERMITIERON_CONTINUAR     number not null enable,
CNT_CONECTADAS_VOICE_MAIL     number not null enable,
CNT_CONECTADA_ANUNCIO_SWITCH  number not null enable
) nologging;
--PARTITION BY RANGE (FECHA) 
--INTERVAL(NUMTODSINTERVAL (1, 'DAY'))
--(  
--  PARTITION MOBILEUM_ASP_DAY_20160526 VALUES LESS THAN (TO_DATE('26.05.2016','dd.mm.yyyy'))
-- );
 
 comment on table MOBILEUM_ASP_DAY is 'Sumarizaciones del MOBILEUM_ASP a nivel DAY';
 
 --
 -- DROP TABLE MOBILEUM_ASP_BH
 
 create table MOBILEUM_ASP_BH(
PAIS                          char(3 char) not null enable,
FECHA                         date not null enable,
CNT_LLAMADAS                  number not null enable,
CNT_POLITICA_RESTRICCION      number not null enable,
CNT_BOLQ_REL_TIPO_GEST        number not null enable,
CNT_BLOQ_RAN_REL              number not null enable,
CNT_PERMITIERON_CONTINUAR     number not null enable,
CNT_CONECTADAS_VOICE_MAIL     number not null enable,
CNT_CONECTADA_ANUNCIO_SWITCH  number not null enable
) nologging;
 
comment on table MOBILEUM_ASP_BH is 'Sumarizaciones del MOBILEUM_ASP a nivel BH';
--
--
create table MOBILEUM_ASP_IBHW(
PAIS                          char(3 char) not null enable,
FECHA                         date not null enable,
CNT_LLAMADAS                  number not null enable,
CNT_POLITICA_RESTRICCION      number not null enable,
CNT_BOLQ_REL_TIPO_GEST        number not null enable,
CNT_BLOQ_RAN_REL              number not null enable,
CNT_PERMITIERON_CONTINUAR     number not null enable,
CNT_CONECTADAS_VOICE_MAIL     number not null enable,
CNT_CONECTADA_ANUNCIO_SWITCH  number not null enable
) nologging;
 
comment on table MOBILEUM_ASP_IBHW is 'Sumarizaciones del MOBILEUM_ASP a nivel IBHW';