SELECT  PAIS,
        trunc(FECHA)                                      FECHA,
        round(NVL(AVG(CNT_LLAMADAS),0),2)                 CNT_LLAMADAS,
        round(NVL(AVG(CNT_POLITICA_RESTRICCION),0),2)     CNT_POLITICA_RESTRICCION,
        round(NVL(AVG(CNT_BOLQ_REL_TIPO_GEST),0),2)       CNT_BOLQ_REL_TIPO_GEST,
        round(NVL(AVG(CNT_BLOQ_RAN_REL),0),2)             CNT_BLOQ_RAN_REL,
        round(NVL(AVG(CNT_PERMITIERON_CONTINUAR),0),2)    CNT_PERMITIERON_CONTINUAR,
        round(NVL(AVG(CNT_CONECTADAS_VOICE_MAIL),0),2)    CNT_CONECTADAS_VOICE_MAIL,
        round(NVL(AVG(CNT_CONECTADA_ANUNCIO_SWITCH),0),2) CNT_CONECTADA_ANUNCIO_SWITCH
FROM  MOBILEUM_ASP_HOUR
WHERE trunc(FECHA) = TO_DATE('08.09.2016','DD.MM.YYYY')
GROUP BY PAIS,trunc(FECHA);

--
-- bck mobileum_asp_day
--
--create table bck_mobileum_asp_day nologging as
insert into bck_mobileum_asp_day
select * from mobileum_asp_day;


-- TEST MODIFICACIONES
--


begin
  for i in (select fecha from bck_mobileum_asp_day where pais = 'ARG' order by 1) loop
    insert into mobileum_asp_day
    SELECT  PAIS,
            trunc(FECHA)                                      FECHA,
            round(NVL(AVG(CNT_LLAMADAS),0),2)                 CNT_LLAMADAS,
            round(NVL(AVG(CNT_POLITICA_RESTRICCION),0),2)     CNT_POLITICA_RESTRICCION,
            round(NVL(AVG(CNT_BOLQ_REL_TIPO_GEST),0),2)       CNT_BOLQ_REL_TIPO_GEST,
            round(NVL(AVG(CNT_BLOQ_RAN_REL),0),2)             CNT_BLOQ_RAN_REL,
            round(NVL(AVG(CNT_PERMITIERON_CONTINUAR),0),2)    CNT_PERMITIERON_CONTINUAR,
            round(NVL(AVG(CNT_CONECTADAS_VOICE_MAIL),0),2)    CNT_CONECTADAS_VOICE_MAIL,
            round(NVL(AVG(CNT_CONECTADA_ANUNCIO_SWITCH),0),2) CNT_CONECTADA_ANUNCIO_SWITCH
    FROM  MOBILEUM_ASP_HOUR
    WHERE trunc(FECHA) = i.fecha --TO_DATE('08.09.2016','DD.MM.YYYY')
    AND PAIS = 'ARG'
    GROUP BY PAIS,trunc(FECHA);
  end loop;
end;

