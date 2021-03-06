CREATE TABLE  "AREA" 
   (	"ID_AREA" NUMBER(25,0) NOT NULL ENABLE, 
	"NOMBRE" VARCHAR2(50) NOT NULL ENABLE, 
	"DESCRIPCION" VARCHAR2(250), 
	 CONSTRAINT "AREA_PK" PRIMARY KEY ("ID_AREA") ENABLE
   ) ;CREATE TABLE  "DEPARTAMENTO" 
   (	"ID_DEPARTAMENTO" NUMBER(25,0) NOT NULL ENABLE, 
	"NOMBRE" VARCHAR2(50) NOT NULL ENABLE, 
	"DESCRIPCION" VARCHAR2(250), 
	 CONSTRAINT "DEPARTAMENTO_PK" PRIMARY KEY ("ID_DEPARTAMENTO") ENABLE
   ) ;CREATE TABLE  "TIPO_EMPLEADO" 
   (	"ID_TIPO_EMPLEADO" NUMBER(25,0) NOT NULL ENABLE, 
	"NOMBRE" VARCHAR2(50) NOT NULL ENABLE, 
	"DESCRIPCION" VARCHAR2(250), 
	 CONSTRAINT "TIPO_EMPLEADO_PK" PRIMARY KEY ("ID_TIPO_EMPLEADO") ENABLE
   ) ;CREATE TABLE  "EMPLEADO_PUBLICO" 
   (	"ID_EMPLEADO_PUBLICO" NUMBER(20,0) NOT NULL ENABLE, 
	"NOMBRE" VARCHAR2(60) NOT NULL ENABLE, 
	"CUI" NUMBER(13,0), 
	"CEDULA_DOCENTE" VARCHAR2(20), 
	"DIRECCION" VARCHAR2(250), 
	"TIPO_EMPLEADO" NUMBER(1,0), 
	 CONSTRAINT "EMPLEADO_PUBLICO_PK" PRIMARY KEY ("ID_EMPLEADO_PUBLICO") ENABLE
   ) ;CREATE TABLE  "ESTADO" 
   (	"ID_ESTADO" NUMBER(25,0) NOT NULL ENABLE, 
	"NOMBRE" VARCHAR2(60) NOT NULL ENABLE, 
	"DESCRIPCION" VARCHAR2(250), 
	 CONSTRAINT "ESTADO_PK" PRIMARY KEY ("ID_ESTADO") ENABLE
   ) ;CREATE TABLE  "JORNADA" 
   (	"ID_JORNADA" NUMBER(25,0), 
	"NOMBRE" VARCHAR2(50), 
	"DESCRIPCION" VARCHAR2(250), 
	 CONSTRAINT "JORNADA_PK" PRIMARY KEY ("ID_JORNADA") ENABLE
   ) ;CREATE TABLE  "MODALIDAD" 
   (	"ID_MODALIDAD" NUMBER(25,0) NOT NULL ENABLE, 
	"NOMBRE" VARCHAR2(50) NOT NULL ENABLE, 
	"DESCRIPCION" VARCHAR2(250), 
	 CONSTRAINT "MODALIDAD_PK" PRIMARY KEY ("ID_MODALIDAD") ENABLE
   ) ;CREATE TABLE  "MUNICIPIO" 
   (	"ID_MUNICIPIO" NUMBER(25,0) NOT NULL ENABLE, 
	"NOMBRE" VARCHAR2(60) NOT NULL ENABLE, 
	"ID_DEPARTAMENTO" NUMBER(25,0) NOT NULL ENABLE, 
	"DESCRIPCION" VARCHAR2(250), 
	 CONSTRAINT "MUNICPIO_PK" PRIMARY KEY ("ID_MUNICIPIO") ENABLE
   ) ;CREATE TABLE  "NIVEL" 
   (	"ID_NIVEL" NUMBER(25,0) NOT NULL ENABLE, 
	"NOMBRE" VARCHAR2(50) NOT NULL ENABLE, 
	"DESCRIPCION" VARCHAR2(250), 
	 CONSTRAINT "NIVEL_PK" PRIMARY KEY ("ID_NIVEL") ENABLE
   ) ;CREATE TABLE  "PLAN" 
   (	"ID_PLAN" NUMBER(25,0) NOT NULL ENABLE, 
	"NOMBRE" VARCHAR2(50) NOT NULL ENABLE, 
	"DESCRIPCION" VARCHAR2(250), 
	 CONSTRAINT "PLAN_PK" PRIMARY KEY ("ID_PLAN") ENABLE
   ) ;CREATE TABLE  "SECTOR" 
   (	"ID_SECTOR" NUMBER(25,0) NOT NULL ENABLE, 
	"NOMBRE" VARCHAR2(60) NOT NULL ENABLE, 
	"DESCRIPCION" VARCHAR2(250), 
	 CONSTRAINT "SECTOR_PK" PRIMARY KEY ("ID_SECTOR") ENABLE
   ) ;CREATE TABLE  "ESTABLECIMIENTO" 
   (	"ID_ESTABLECIMIENTO" NUMBER(25,0), 
	"CODIGO" VARCHAR2(15) NOT NULL ENABLE, 
	"NOMBRE" VARCHAR2(200), 
	"DIRECCION" VARCHAR2(250), 
	"SUPERVISOR" NUMBER(25,0), 
	"DIRECTOR" NUMBER(25,0), 
	"NIVEL" NUMBER(25,0), 
	"AREA" NUMBER(25,0), 
	"ESTADO" NUMBER(25,0), 
	"MODALIDAD" NUMBER(25,0), 
	"JORNADA" NUMBER(25,0), 
	"PLAN" NUMBER(25,0), 
	"DISTRITO" VARCHAR2(8), 
	"GEO" VARCHAR2(60), 
	"TELEFONO" VARCHAR2(100), 
	"MUNICIPIO" NUMBER(25,0), 
	"DEPARTAMENTO" NUMBER(25,0), 
	"SECTOR" NUMBER(25,0), 
	 CONSTRAINT "ESTABLECIMIENTO_PK" PRIMARY KEY ("ID_ESTABLECIMIENTO") ENABLE
   ) ;CREATE TABLE  "INFRAESTRUCTURA" 
   (	"ID_INFRAESTRUCTURA" NUMBER(25,0) NOT NULL ENABLE, 
	"TIPO" VARCHAR2(60) NOT NULL ENABLE, 
	"TAMANIO" NUMBER(15,2), 
	"CAPACIDAD" NUMBER(15,0), 
	"ESTADO" NUMBER(2,0) NOT NULL ENABLE, 
	 CONSTRAINT "INFRAESTRUCTURA_PK" PRIMARY KEY ("ID_INFRAESTRUCTURA") ENABLE
   ) ;CREATE TABLE  "EST_INF" 
   (	"ESTABLECIMIENTO" NUMBER(25,0) NOT NULL ENABLE, 
	"INFRAESTRUCTURA" NUMBER(25,0) NOT NULL ENABLE
   ) ;CREATE TABLE  "FEEDBACK" 
   (	"ID_FEEDBACK" NUMBER(25,0) NOT NULL ENABLE, 
	"NOMBRE" VARCHAR2(60) NOT NULL ENABLE, 
	"COMENTARIO" VARCHAR2(500), 
	"VALORACION" NUMBER(1,0), 
	"ESTABLECIMIENTO" NUMBER(25,0) NOT NULL ENABLE, 
	 CONSTRAINT "FEEDBACK_PK" PRIMARY KEY ("ID_FEEDBACK") ENABLE
   ) ;CREATE TABLE  "MASIVA" 
   (	"ID" NUMBER, 
	"CODIGO" VARCHAR2(30), 
	"DISTRITO" VARCHAR2(30), 
	"DEPARTAMENTO" VARCHAR2(30), 
	"MUNICIPIO" VARCHAR2(30), 
	"ESTABLECIMIENTO" VARCHAR2(255), 
	"DIRECCION" VARCHAR2(255), 
	"TELEFONO" VARCHAR2(30), 
	"SUPERVISOR" VARCHAR2(30), 
	"DIRECTOR" VARCHAR2(255), 
	"NIVEL" VARCHAR2(30), 
	"SECTOR" VARCHAR2(30), 
	"AREA" VARCHAR2(30), 
	"STATUS" VARCHAR2(30), 
	"MODALIDAD" VARCHAR2(30), 
	"JORNADA" VARCHAR2(30), 
	"PLAN" VARCHAR2(30), 
	 CONSTRAINT "MASIVA_PK" PRIMARY KEY ("ID") ENABLE
   ) ;ALTER TABLE  "EMPLEADO_PUBLICO" ADD CONSTRAINT "EMPLEADO_PUBLICO_CON" FOREIGN KEY ("TIPO_EMPLEADO")
	  REFERENCES  "TIPO_EMPLEADO" ("ID_TIPO_EMPLEADO") ON DELETE CASCADE ENABLE;ALTER TABLE  "ESTABLECIMIENTO" ADD CONSTRAINT "ESTABLECIMIENTO_CON" FOREIGN KEY ("MUNICIPIO")
	  REFERENCES  "MUNICIPIO" ("ID_MUNICIPIO") ON DELETE SET NULL ENABLE;ALTER TABLE  "ESTABLECIMIENTO" ADD CONSTRAINT "ESTABLECIMIENTO_CON2" FOREIGN KEY ("DEPARTAMENTO")
	  REFERENCES  "DEPARTAMENTO" ("ID_DEPARTAMENTO") ON DELETE SET NULL ENABLE;ALTER TABLE  "ESTABLECIMIENTO" ADD CONSTRAINT "ESTABLECIMIENTO_CON3" FOREIGN KEY ("SECTOR")
	  REFERENCES  "SECTOR" ("ID_SECTOR") ON DELETE SET NULL ENABLE;ALTER TABLE  "ESTABLECIMIENTO" ADD CONSTRAINT "ESTABLECIMIENTO_FK" FOREIGN KEY ("SUPERVISOR")
	  REFERENCES  "EMPLEADO_PUBLICO" ("ID_EMPLEADO_PUBLICO") ON DELETE SET NULL ENABLE;ALTER TABLE  "ESTABLECIMIENTO" ADD CONSTRAINT "ESTABLECIMIENTO_FK2" FOREIGN KEY ("DIRECTOR")
	  REFERENCES  "EMPLEADO_PUBLICO" ("ID_EMPLEADO_PUBLICO") ON DELETE SET NULL ENABLE;ALTER TABLE  "ESTABLECIMIENTO" ADD CONSTRAINT "ESTABLECIMIENTO_FK3" FOREIGN KEY ("NIVEL")
	  REFERENCES  "NIVEL" ("ID_NIVEL") ON DELETE SET NULL ENABLE;ALTER TABLE  "ESTABLECIMIENTO" ADD CONSTRAINT "ESTABLECIMIENTO_FK4" FOREIGN KEY ("AREA")
	  REFERENCES  "AREA" ("ID_AREA") ON DELETE SET NULL ENABLE;ALTER TABLE  "ESTABLECIMIENTO" ADD CONSTRAINT "ESTABLECIMIENTO_FK5" FOREIGN KEY ("ESTADO")
	  REFERENCES  "ESTADO" ("ID_ESTADO") ON DELETE SET NULL ENABLE;ALTER TABLE  "ESTABLECIMIENTO" ADD CONSTRAINT "ESTABLECIMIENTO_FK6" FOREIGN KEY ("MODALIDAD")
	  REFERENCES  "MODALIDAD" ("ID_MODALIDAD") ON DELETE SET NULL ENABLE;ALTER TABLE  "ESTABLECIMIENTO" ADD CONSTRAINT "ESTABLECIMIENTO_FK7" FOREIGN KEY ("JORNADA")
	  REFERENCES  "JORNADA" ("ID_JORNADA") ON DELETE SET NULL ENABLE;ALTER TABLE  "ESTABLECIMIENTO" ADD CONSTRAINT "ESTABLECIMIENTO_FK8" FOREIGN KEY ("PLAN")
	  REFERENCES  "PLAN" ("ID_PLAN") ON DELETE SET NULL ENABLE;ALTER TABLE  "EST_INF" ADD CONSTRAINT "EST_INF_FK" FOREIGN KEY ("ESTABLECIMIENTO")
	  REFERENCES  "ESTABLECIMIENTO" ("ID_ESTABLECIMIENTO") ENABLE;ALTER TABLE  "EST_INF" ADD CONSTRAINT "EST_INF_FK2" FOREIGN KEY ("INFRAESTRUCTURA")
	  REFERENCES  "INFRAESTRUCTURA" ("ID_INFRAESTRUCTURA") ENABLE;ALTER TABLE  "FEEDBACK" ADD CONSTRAINT "FEEDBACK_FK" FOREIGN KEY ("ESTABLECIMIENTO")
	  REFERENCES  "ESTABLECIMIENTO" ("ID_ESTABLECIMIENTO") ON DELETE CASCADE ENABLE;ALTER TABLE  "MUNICIPIO" ADD CONSTRAINT "MUNICPIO_FK1" FOREIGN KEY ("ID_DEPARTAMENTO")
	  REFERENCES  "DEPARTAMENTO" ("ID_DEPARTAMENTO") ON DELETE CASCADE ENABLE;

CREATE OR REPLACE PROCEDURE  "OBTENER_ESTABLECIMIENTO_ID" 
(ID IN NUMBER,
dataset OUT sys_refcursor)
is
begin
   open dataset for SELECT NOMBRE FROM ESTABLECIMIENTO WHERE ID_ESTABLECIMIENTO = ID;
end;
/
/
CREATE OR REPLACE PROCEDURE  "OBTENER_ESTABLECIMIENTO" 
(ID IN VARCHAR2,
dataset OUT sys_refcursor)
is
begin
   open dataset for SELECT E.CODIGO AS "COD", 
E.NOMBRE AS "NOMBRE_E", 
E.DIRECCION AS "DIRECCION_E",
E.TELEFONO AS "TELEFONO_E",
P.NOMBRE AS "PLAN",
J.NOMBRE AS "JORNADA",
M.NOMBRE AS "MODALIDAD",
S.NOMBRE AS "SECTOR"
FROM ESTABLECIMIENTO E
INNER JOIN PLAN P ON (P.ID_PLAN = E.PLAN)
INNER JOIN JORNADA J ON (J.ID_JORNADA = E.JORNADA)
INNER JOIN MODALIDAD M ON (M.ID_MODALIDAD = E.MODALIDAD)
INNER JOIN SECTOR S ON (S.ID_SECTOR = E.SECTOR)
WHERE ID_ESTABLECIMIENTO = ID;
end;
/
/
CREATE OR REPLACE PROCEDURE  "FILTRO_POR_MUNICIPIO" 
(NAME IN VARCHAR2,
dataset OUT sys_refcursor)
is
begin
   open dataset for SELECT E.ID_ESTABLECIMIENTO AS "ID", E.NOMBRE AS "NOMBRE_E", E.DIRECCION AS "DIRECCION_E", E.GEO AS "GEO_E", E.JORNADA AS "JORNADA_E", E.PLAN AS "PLAN_E", E.MODALIDAD AS "MODALIDAD_E", E.NIVEL AS "NIVEL_E" FROM ESTABLECIMIENTO E INNER JOIN MUNICIPIO M ON(M.ID_MUNICIPIO = E.MUNICIPIO) WHERE M.NOMBRE=NAME;
end;
/
/
CREATE OR REPLACE PROCEDURE  "COMPARAR" 
(ID IN VARCHAR2,
dataset OUT sys_refcursor)
is
begin 
   open dataset for SELECT ES.NOMBRE AS "NOMBRE_E",
SUM(CASE TIPO WHEN 'CANCHA' THEN 1 ELSE 0 END) "CANCHA",
SUM(CASE TIPO WHEN 'PISCINA' THEN 1 ELSE 0 END) "PISCINA",
SUM(CASE TIPO WHEN 'LABORATORIO DE COMPUTACI�N' THEN 1 ELSE 0 END) "LABFISICA",
SUM(CASE TIPO WHEN 'LABORATORIO DE QU�MICA' THEN 1 ELSE 0 END) "LABQUIMICA",
SUM(CASE TIPO WHEN 'LABORATORIO DE F�SICA' THEN 1 ELSE 0 END) "LABCOMPU",
SUM(CASE TIPO WHEN 'SAL�N DE USOS M�LTIPLES' THEN 1 ELSE 0 END) "SALONG"
FROM INFRAESTRUCTURA I
INNER JOIN EST_INF E ON(E.INFRAESTRUCTURA = I.ID_INFRAESTRUCTURA)
INNER JOIN ESTABLECIMIENTO ES ON(E.ESTABLECIMIENTO = ES.ID_ESTABLECIMIENTO)
WHERE ES.ID_ESTABLECIMIENTO = ID
GROUP BY ES.NOMBRE;
end;
/
/

 CREATE SEQUENCE   "TIPO_EMPLEADO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ; CREATE SEQUENCE   "SECTOR_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ; CREATE SEQUENCE   "PLAN_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ; CREATE SEQUENCE   "NIVEL_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ; CREATE SEQUENCE   "MUNICPIO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 361 CACHE 20 NOORDER  NOCYCLE ; CREATE SEQUENCE   "MODALIDAD_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ; CREATE SEQUENCE   "MASIVA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 42481 CACHE 20 NOORDER  NOCYCLE ; CREATE SEQUENCE   "JORNADA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ; CREATE SEQUENCE   "JORANADA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ; CREATE SEQUENCE   "INFRAESTRUCTURA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ; CREATE SEQUENCE   "FEEDBACK_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ; CREATE SEQUENCE   "ESTADO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ; CREATE SEQUENCE   "ESTABLECIMIENTO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 35081 CACHE 20 NOORDER  NOCYCLE ; CREATE SEQUENCE   "EMPLEADO_PUBLICO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 23201 CACHE 20 NOORDER  NOCYCLE ; CREATE SEQUENCE   "DEPARTAMENTO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ; CREATE SEQUENCE   "AREA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;

CREATE OR REPLACE TRIGGER  "bi_MASIVA" 
  before insert on "MASIVA"              
  for each row 
begin  
  if :new."ID" is null then
    select "MASIVA_SEQ".nextval into :new."ID" from dual;
  end if;
end;

/
ALTER TRIGGER  "bi_MASIVA" ENABLE;CREATE OR REPLACE TRIGGER  "BI_TIPO_EMPLEADO" 
  before insert on "TIPO_EMPLEADO"               
  for each row  
begin   
  if :NEW."ID_TIPO_EMPLEADO" is null then 
    select "TIPO_EMPLEADO_SEQ".nextval into :NEW."ID_TIPO_EMPLEADO" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_TIPO_EMPLEADO" ENABLE;CREATE OR REPLACE TRIGGER  "BI_SECTOR" 
  before insert on "SECTOR"               
  for each row  
begin   
  if :NEW."ID_SECTOR" is null then 
    select "SECTOR_SEQ".nextval into :NEW."ID_SECTOR" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_SECTOR" ENABLE;CREATE OR REPLACE TRIGGER  "BI_PLAN" 
  before insert on "PLAN"               
  for each row  
begin   
  if :NEW."ID_PLAN" is null then 
    select "PLAN_SEQ".nextval into :NEW."ID_PLAN" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_PLAN" ENABLE;CREATE OR REPLACE TRIGGER  "BI_NIVEL" 
  before insert on "NIVEL"               
  for each row  
begin   
  if :NEW."ID_NIVEL" is null then 
    select "NIVEL_SEQ".nextval into :NEW."ID_NIVEL" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_NIVEL" ENABLE;CREATE OR REPLACE TRIGGER  "BI_MUNICPIO" 
  before insert on "MUNICIPIO"               
  for each row  
begin   
  if :NEW."ID_MUNICIPIO" is null then 
    select "MUNICPIO_SEQ".nextval into :NEW."ID_MUNICIPIO" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_MUNICPIO" ENABLE;CREATE OR REPLACE TRIGGER  "BI_MODALIDAD" 
  before insert on "MODALIDAD"               
  for each row  
begin   
  if :NEW."ID_MODALIDAD" is null then 
    select "MODALIDAD_SEQ".nextval into :NEW."ID_MODALIDAD" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_MODALIDAD" ENABLE;CREATE OR REPLACE TRIGGER  "BI_JORNADA" 
  before insert on "JORNADA"               
  for each row  
begin   
  if :NEW."ID_JORNADA" is null then 
    select "JORNADA_SEQ".nextval into :NEW."ID_JORNADA" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_JORNADA" ENABLE;CREATE OR REPLACE TRIGGER  "BI_INFRAESTRUCTURA" 
  before insert on "INFRAESTRUCTURA"               
  for each row  
begin   
  if :NEW."ID_INFRAESTRUCTURA" is null then 
    select "INFRAESTRUCTURA_SEQ".nextval into :NEW."ID_INFRAESTRUCTURA" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_INFRAESTRUCTURA" ENABLE;CREATE OR REPLACE TRIGGER  "BI_FEEDBACK" 
  before insert on "FEEDBACK"               
  for each row  
begin   
  if :NEW."ID_FEEDBACK" is null then 
    select "FEEDBACK_SEQ".nextval into :NEW."ID_FEEDBACK" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_FEEDBACK" ENABLE;CREATE OR REPLACE TRIGGER  "BI_ESTADO" 
  before insert on "ESTADO"               
  for each row  
begin   
  if :NEW."ID_ESTADO" is null then 
    select "ESTADO_SEQ".nextval into :NEW."ID_ESTADO" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_ESTADO" ENABLE;CREATE OR REPLACE TRIGGER  "BI_ESTABLECIMIENTO" 
  before insert on "ESTABLECIMIENTO"               
  for each row  
begin   
  if :NEW."ID_ESTABLECIMIENTO" is null then 
    select "ESTABLECIMIENTO_SEQ".nextval into :NEW."ID_ESTABLECIMIENTO" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_ESTABLECIMIENTO" ENABLE;CREATE OR REPLACE TRIGGER  "BI_EMPLEADO_PUBLICO" 
  before insert on "EMPLEADO_PUBLICO"               
  for each row  
begin   
  if :NEW."ID_EMPLEADO_PUBLICO" is null then 
    select "EMPLEADO_PUBLICO_SEQ".nextval into :NEW."ID_EMPLEADO_PUBLICO" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_EMPLEADO_PUBLICO" ENABLE;CREATE OR REPLACE TRIGGER  "BI_DEPARTAMENTO" 
  before insert on "DEPARTAMENTO"               
  for each row  
begin   
  if :NEW."ID_DEPARTAMENTO" is null then 
    select "DEPARTAMENTO_SEQ".nextval into :NEW."ID_DEPARTAMENTO" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_DEPARTAMENTO" ENABLE;CREATE OR REPLACE TRIGGER  "BI_AREA" 
  before insert on "AREA"               
  for each row  
begin   
  if :NEW."ID_AREA" is null then 
    select "AREA_SEQ".nextval into :NEW."ID_AREA" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_AREA" ENABLE;