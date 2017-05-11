-- Generado por Oracle SQL Developer Data Modeler 4.1.5.907
--   en:        2017-05-02 23:23:43 CEST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g

-- TODO EL SCRIPT SE EJECUTA DEL USUARIO CAMPUS
-- SCRIPT FINAL (INCLUYENDO LAS MODIFICACIONES SOLICITADAS EN LA TAREA NIVEL FISICO + DATOS INTRODUCIDOS)

CREATE TABLE ACTIVIDADES
  (
    id             NUMBER NOT NULL ,
    ASIGNATURAS_id NUMBER NOT NULL ,
    nombre         VARCHAR2 (30) NOT NULL ,
    logo BFILE ,
    posicion_vertical   NUMBER ,
    posicion_horizontal NUMBER
  ) ;
ALTER TABLE ACTIVIDADES ADD CONSTRAINT ACTIVIDADES_PK PRIMARY KEY ( id ) ;


CREATE TABLE ASIGNATURAS
  (
    id              NUMBER NOT NULL ,
    curso           VARCHAR2 (30) NOT NULL ,
    nombre          VARCHAR2 (30) NOT NULL ,
    grupoTurno      VARCHAR2 (30) NOT NULL ,
    TITULACIONES_id NUMBER NOT NULL
  ) ;
ALTER TABLE ASIGNATURAS ADD CONSTRAINT ASIGNATURAS_PK PRIMARY KEY ( id ) ;


CREATE TABLE CENTROS
  (
    id     NUMBER NOT NULL ,
    url    VARCHAR2 (40) NOT NULL ,
    nombre VARCHAR2 (80) NOT NULL
  ) ;
ALTER TABLE CENTROS ADD CONSTRAINT CENTROS_PK PRIMARY KEY ( id ) ;


CREATE TABLE CONTENIDOS
  (
    id     NUMBER NOT NULL ,
    nombre VARCHAR2 (30) NOT NULL ,
    logo BFILE ,
    descripcion         VARCHAR2 (140) ,
    tipo_contenido      VARCHAR2 (30) ,
    posicion_vertical   NUMBER ,
    posicion_horizontal NUMBER ,
    ASIGNATURAS_id      NUMBER NOT NULL
  ) ;
ALTER TABLE CONTENIDOS ADD CONSTRAINT CONTENIDOS_PK PRIMARY KEY ( id ) ;


CREATE TABLE CORREO_INTERNO
  (
    fecha        DATE NOT NULL ,
    asunto       VARCHAR2 (30) ,
    descripcion  VARCHAR2 (100) ,
    USUARIOS_id  NUMBER NOT NULL ,
    USUARIOS_id1 NUMBER NOT NULL
  ) ;
ALTER TABLE CORREO_INTERNO ADD CONSTRAINT CORREO_INTERNO_PK PRIMARY KEY ( fecha, USUARIOS_id, USUARIOS_id1 ) ;


CREATE TABLE CUESTIONARIOS
  (
    id           NUMBER NOT NULL ,
    fecha_inicio DATE ,
    fecha_final  DATE
  ) ;
ALTER TABLE CUESTIONARIOS ADD CONSTRAINT CUESTIONARIOS_PK PRIMARY KEY ( id ) ;


CREATE TABLE DIARIO
  ( id NUMBER NOT NULL , descripción VARCHAR2 (500)
  ) ;
ALTER TABLE DIARIO ADD CONSTRAINT DIARIO_PK PRIMARY KEY ( id ) ;


CREATE TABLE ENTREGA
  (
    id          NUMBER NOT NULL ,
    comentarios VARCHAR2 (100) ,
    fichero BFILE ,
    nota        NUMBER ,
    fecha       DATE NOT NULL ,
    USUARIOS_id NUMBER NOT NULL ,
    TAREAS_id   NUMBER NOT NULL
  ) ;
ALTER TABLE ENTREGA ADD CONSTRAINT ENTREGA_PK PRIMARY KEY ( id ) ;


CREATE TABLE FOROS
  (
    id     NUMBER NOT NULL ,
    titulo VARCHAR2 (20) ,
    debate VARCHAR2 (600) ,
    fecha  DATE
  ) ;
ALTER TABLE FOROS ADD CONSTRAINT FOROS_PK PRIMARY KEY ( id ) ;


CREATE TABLE GRUPOS
  (
    id             NUMBER NOT NULL ,
    nombre         VARCHAR2 (30) NOT NULL ,
    ASIGNATURAS_id NUMBER NOT NULL
  ) ;
ALTER TABLE GRUPOS ADD CONSTRAINT GRUPOS_PK PRIMARY KEY ( id ) ;


CREATE TABLE MENSAJES
  (
    descripcion  VARCHAR2 (100) ,
    fecha        DATE NOT NULL ,
    USUARIOS_id1 NUMBER NOT NULL ,
    USUARIOS_id  NUMBER NOT NULL
  ) ;
ALTER TABLE MENSAJES ADD CONSTRAINT MENSAJES_PK PRIMARY KEY ( fecha, USUARIOS_id1, USUARIOS_id ) ;


CREATE TABLE NOTAS_FINALES
  (
    nota           NUMBER,
    calificacion   VARCHAR2 (30),
    ASIGNATURAS_id NUMBER NOT NULL ,
    USUARIOS_id    NUMBER NOT NULL
  ) ;
ALTER TABLE NOTAS_FINALES ADD CONSTRAINT NOTAS_FINALES_PK PRIMARY KEY ( ASIGNATURAS_id, USUARIOS_id ) ;


CREATE TABLE Preguntas
  (
    id               NUMBER NOT NULL ,
    pregunta         VARCHAR2 (200) NOT NULL ,
    CUESTIONARIOS_id NUMBER NOT NULL
  ) ;
ALTER TABLE Preguntas ADD CONSTRAINT Preguntas_PK PRIMARY KEY ( id ) ;


CREATE TABLE REGISTROS
  (
    fecha       DATE NOT NULL ,
    tipo        VARCHAR2 (30) ,
    descripcion VARCHAR2 (100) ,
    USUARIOS_id NUMBER NOT NULL
  ) ;
ALTER TABLE REGISTROS ADD CONSTRAINT REGISTROS_PK PRIMARY KEY ( fecha, USUARIOS_id ) ;


CREATE TABLE ROLES
  ( rol VARCHAR2 (2) NOT NULL , nombre VARCHAR2 (30)
  ) ;
ALTER TABLE ROLES ADD CONSTRAINT ROLES_PK PRIMARY KEY ( rol ) ;


CREATE TABLE Respuestas
  (
    id           NUMBER NOT NULL ,
    respuesta    VARCHAR2 (200) ,
    nota         NUMBER ,
    Preguntas_id NUMBER NOT NULL ,
    USUARIOS_id  NUMBER NOT NULL
  ) ;
ALTER TABLE Respuestas ADD CONSTRAINT Respuestas_PK PRIMARY KEY ( id ) ;


CREATE TABLE Rol_Us_As
  (
    ROLES_rol      VARCHAR2 (2) NOT NULL ,
    ASIGNATURAS_id NUMBER NOT NULL ,
    USUARIOS_id    NUMBER NOT NULL
  ) ;
ALTER TABLE Rol_Us_As ADD CONSTRAINT Rol_Us_As_PK PRIMARY KEY ( ROLES_rol, ASIGNATURAS_id, USUARIOS_id ) ;


CREATE TABLE TAREAS
  (
    id                 NUMBER NOT NULL ,
    descripcion        VARCHAR2 (500) ,
    fecha_entrega      DATE ,
    fecha_creacion     DATE ,
    fecha_modificacion DATE ,
    estado_entrega     VARCHAR2 (100) ,
    comentarios        VARCHAR2 (500)
  ) ;
ALTER TABLE TAREAS ADD CONSTRAINT TAREAS_PK PRIMARY KEY ( id ) ;


CREATE TABLE TITULACIONES
  (
    id         NUMBER NOT NULL ,
    nombre     VARCHAR2 (30) NOT NULL ,
    curso      VARCHAR2 (30) ,
    CENTROS_id NUMBER NOT NULL
  ) ;
ALTER TABLE TITULACIONES ADD CONSTRAINT TITULACIONES_PK PRIMARY KEY ( id ) ;


CREATE TABLE USUARIOS
  (
    id        NUMBER NOT NULL ,
    dni       VARCHAR2 (30) NOT NULL ,
    nombre    VARCHAR2 (30) NOT NULL ,
    apellidos VARCHAR2 (30) NOT NULL ,
    correo    VARCHAR2 (30) NOT NULL ,
    pais      VARCHAR2 (10) ,
    foto BFILE
  ) ;
ALTER TABLE USUARIOS ADD CONSTRAINT USUARIOS_PK PRIMARY KEY ( id ) ;


CREATE TABLE us_grups
  (
    GRUPOS_id   NUMBER NOT NULL ,
    USUARIOS_id NUMBER NOT NULL
  ) ;
ALTER TABLE us_grups ADD CONSTRAINT us_grups_PK PRIMARY KEY ( GRUPOS_id, USUARIOS_id ) ;


ALTER TABLE ACTIVIDADES ADD CONSTRAINT ACTIVIDADES_ASIGNATURAS_FK FOREIGN KEY ( ASIGNATURAS_id ) REFERENCES ASIGNATURAS ( id ) ;

ALTER TABLE ASIGNATURAS ADD CONSTRAINT ASIGNATURAS_TITULACIONES_FK FOREIGN KEY ( TITULACIONES_id ) REFERENCES TITULACIONES ( id ) ;

ALTER TABLE CONTENIDOS ADD CONSTRAINT CONTENIDOS_ASIGNATURAS_FK FOREIGN KEY ( ASIGNATURAS_id ) REFERENCES ASIGNATURAS ( id ) ;

ALTER TABLE CORREO_INTERNO ADD CONSTRAINT CORREO_INTERNO_USUARIOS_FK FOREIGN KEY ( USUARIOS_id ) REFERENCES USUARIOS ( id ) ;

ALTER TABLE CORREO_INTERNO ADD CONSTRAINT CORREO_INTERNO_USUARIOS_FKv1 FOREIGN KEY ( USUARIOS_id1 ) REFERENCES USUARIOS ( id ) ;

ALTER TABLE CUESTIONARIOS ADD CONSTRAINT CUESTIONARIOS_ACTIVIDADES_FK FOREIGN KEY ( id ) REFERENCES ACTIVIDADES ( id ) ;

ALTER TABLE DIARIO ADD CONSTRAINT DIARIO_ACTIVIDADES_FK FOREIGN KEY ( id ) REFERENCES ACTIVIDADES ( id ) ;

ALTER TABLE ENTREGA ADD CONSTRAINT ENTREGA_TAREAS_FK FOREIGN KEY ( TAREAS_id ) REFERENCES TAREAS ( id ) ;

ALTER TABLE ENTREGA ADD CONSTRAINT ENTREGA_USUARIOS_FK FOREIGN KEY ( USUARIOS_id ) REFERENCES USUARIOS ( id ) ;

ALTER TABLE us_grups ADD CONSTRAINT FK_ASS_25 FOREIGN KEY ( GRUPOS_id ) REFERENCES GRUPOS ( id ) ;

ALTER TABLE us_grups ADD CONSTRAINT FK_ASS_26 FOREIGN KEY ( USUARIOS_id ) REFERENCES USUARIOS ( id ) ;

ALTER TABLE FOROS ADD CONSTRAINT FOROS_ACTIVIDADES_FK FOREIGN KEY ( id ) REFERENCES ACTIVIDADES ( id ) ;

ALTER TABLE GRUPOS ADD CONSTRAINT GRUPOS_ASIGNATURAS_FK FOREIGN KEY ( ASIGNATURAS_id ) REFERENCES ASIGNATURAS ( id ) ;

ALTER TABLE MENSAJES ADD CONSTRAINT MENSAJES_USUARIOS_FK FOREIGN KEY ( USUARIOS_id ) REFERENCES USUARIOS ( id ) ;

ALTER TABLE MENSAJES ADD CONSTRAINT MENSAJES_USUARIOS_FKv1 FOREIGN KEY ( USUARIOS_id1 ) REFERENCES USUARIOS ( id ) ;

ALTER TABLE NOTAS_FINALES ADD CONSTRAINT NOTAS_FINALES_ASIGNATURAS_FK FOREIGN KEY ( ASIGNATURAS_id ) REFERENCES ASIGNATURAS ( id ) ;

ALTER TABLE NOTAS_FINALES ADD CONSTRAINT NOTAS_FINALES_USUARIOS_FK FOREIGN KEY ( USUARIOS_id ) REFERENCES USUARIOS ( id ) ;

ALTER TABLE Preguntas ADD CONSTRAINT Preguntas_CUESTIONARIOS_FK FOREIGN KEY ( CUESTIONARIOS_id ) REFERENCES CUESTIONARIOS ( id ) ;

ALTER TABLE REGISTROS ADD CONSTRAINT REGISTROS_USUARIOS_FK FOREIGN KEY ( USUARIOS_id ) REFERENCES USUARIOS ( id ) ;

ALTER TABLE Respuestas ADD CONSTRAINT Respuestas_Preguntas_FK FOREIGN KEY ( Preguntas_id ) REFERENCES Preguntas ( id ) ;

ALTER TABLE Respuestas ADD CONSTRAINT Respuestas_USUARIOS_FK FOREIGN KEY ( USUARIOS_id ) REFERENCES USUARIOS ( id ) ;

ALTER TABLE Rol_Us_As ADD CONSTRAINT Rol_Us_As_ASIGNATURAS_FK FOREIGN KEY ( ASIGNATURAS_id ) REFERENCES ASIGNATURAS ( id ) ;

ALTER TABLE Rol_Us_As ADD CONSTRAINT Rol_Us_As_ROLES_FK FOREIGN KEY ( ROLES_rol ) REFERENCES ROLES ( rol ) ;

ALTER TABLE Rol_Us_As ADD CONSTRAINT Rol_Us_As_USUARIOS_FK FOREIGN KEY ( USUARIOS_id ) REFERENCES USUARIOS ( id ) ;

ALTER TABLE TAREAS ADD CONSTRAINT TAREAS_ACTIVIDADES_FK FOREIGN KEY ( id ) REFERENCES ACTIVIDADES ( id ) ;

ALTER TABLE TITULACIONES ADD CONSTRAINT TITULACIONES_CENTROS_FK FOREIGN KEY ( CENTROS_id ) REFERENCES CENTROS ( id ) ;

-- MODIFICACIONES DE LA TAREA NIVEL FISICO

CREATE TABLE ORACLE (id number not null primary key, user varchar2(30) not null, pass varchar2(30) not null) ;

ALTER TABLE ORACLE ADD USUARIOS_id Number;

ALTER TABLE ORACLE ADD CONSTRAINT ORACLE_USUARIOS_FK FOREIGN KEY ( USUARIOS_id ) REFERENCES USUARIOS ( id ) ;

CREATE TABLE CONEXIONES(
    sesionid     NUMBER NOT NULL PRIMARY KEY,
    usuario      VARCHAR2(50) NOT NULL ,
    ip           VARCHAR2(20),
    maquina      VARCHAR2(20),
    inicio       DATE,
    fin          DATE
  ) ;

-- INTRODUCCION DE DATOS

INSERT INTO USUARIOS VALUES (12, ‘U454655’, 'Alberto','Jimenez Alvarez','ajalvarez@gmail.com','españa',''); 
INSERT INTO USUARIOS VALUES (21, 'H789565', 'Juan','Fraud Mango','jfmango@gmail.com','españa',''); 
INSERT INTO USUARIOS VALUES (89, 'Y896453E', 'Ram','Faharadi Kariji','ramfk@gmail.com',’india’,''); 
INSERT INTO USUARIOS VALUES (37, 'A852696', 'Alicia','Llaves Negras','allavesn@gmail.com','españa',''); 
INSERT INTO USUARIOS VALUES (90, ‘B454510’, 'David','Moreno Calvo','dvc@gmail.com','españa',''); 
INSERT INTO CENTROS VALUES (01, 'www.uma.es/etsi-informatica/', 'ETSII');
INSERT INTO TITULACIONES VALUES (1, 'Ingenieria Informatica', '',01);
INSERT INTO ASIGNATURAS VALUES (411, '2015/16', 'Base de datos','A','1'); 
INSERT INTO ASIGNATURAS VALUES (412, '2015/16', 'Sistemas de Internet','A','1');
INSERT INTO ASIGNATURAS VALUES (413, '2015/16', 'Procesadores de Lenguaje','A','1');
INSERT INTO ASIGNATURAS VALUES (421, '2015/16', 'Logica Computacional','A','1');
INSERT INTO ROLES VALUES ('0', 'estudiante');
INSERT INTO ROLES VALUES ('1', 'profesor');
INSERT INTO ROLES VALUES ('2', 'administrativo');
INSERT INTO NOTAS_FINALES VALUES ('Aprobado', 6, 411, 12);
INSERT INTO NOTAS_FINALES VALUES ('Notable', 8, 412, 12);
INSERT INTO NOTAS_FINALES VALUES ('Notable', 7, 421, 12);
INSERT INTO NOTAS_FINALES VALUES ('Sobresaliente', 9, 411, 37);
INSERT INTO NOTAS_FINALES VALUES ('Matricula', 10, 421, 37);
INSERT INTO NOTAS_FINALES VALUES ('Notable', 8, 413, 37);
INSERT INTO ROL_US_AS VALUES ('0', 421, 37);
INSERT INTO ROL_US_AS VALUES ('0', 413, 37);
INSERT INTO ROL_US_AS VALUES ('0', 411, 37);
INSERT INTO ROL_US_AS VALUES ('0', 411, 12);
INSERT INTO ROL_US_AS VALUES ('0', 412, 12);
INSERT INTO ROL_US_AS VALUES ('0', 421, 12);
INSERT INTO ROL_US_AS VALUES ('1', 413, 89);
INSERT INTO ROL_US_AS VALUES ('1', 421, 89);
INSERT INTO ROL_US_AS VALUES ('1', 411, 21);
INSERT INTO ROL_US_AS VALUES ('1', 412, 21);
INSERT INTO ROL_US_AS VALUES ('2', 411, 90);
INSERT INTO ROL_US_AS VALUES ('2', 412, 90);
INSERT INTO ROL_US_AS VALUES ('2', 413, 90);
INSERT INTO ROL_US_AS VALUES ('2', 421, 90);


-- ************************ HASTA AQUI SE EJECUTA *********************

-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            21
-- CREATE INDEX                             0
-- ALTER TABLE                             47
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
