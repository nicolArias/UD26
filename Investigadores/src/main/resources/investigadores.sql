drop database if exists Investigador;
create database Investigador;

use Investigador;

-- Table structure for table Facultades
DROP TABLE IF EXISTS Facultades;
SET character_set_client = utf8mb4 ;

CREATE TABLE Facultades (
  codigo int(11) NOT NULL PRIMARY KEY,
  nombre varchar(100) NOT NULL
 ) ENGINE=InnoDB;


INSERT INTO Facultades VALUES 
(1,'Diseño'),
(2,'Ciencias Politicas'),
(3,'Ciencias Sociales'),
(4,'Medicina'),
(5,'Ingenieria');


-- Table structure for table Equipos
DROP TABLE IF EXISTS Equipos;
CREATE TABLE Equipos (
  numSerie VARCHAR(4) NOT NULL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  facultad_fk INT NOT NULL,
  FOREIGN KEY (facultad_fk)
  REFERENCES Facultades(codigo)
  ON DELETE CASCADE 
  ON UPDATE CASCADE
) ENGINE=InnoDB;


INSERT INTO Equipos VALUES 
('A1','Equipo de sistemas',5),
('A2','Equipo de diseño grafico',1),
('A3','Equipo de leyes ciudadanas',3),
('B1','Equipo de microbiologia',4),
('B2','Equipo de politica',2);



-- Table structure for table Investigadores
DROP TABLE IF EXISTS Investigadores;
CREATE TABLE Investigadores (
  dni VARCHAR(8) NOT NULL PRIMARY KEY,
  nomApels VARCHAR(255) NOT NULL,
  facultad_fk INT NOT NULL,
  FOREIGN KEY (facultad_fk)
  REFERENCES Facultades(codigo)
  ON DELETE CASCADE 
  ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO Investigadores VALUES 
('5533134X','Nicol Arias',5),
('4532134G','Juanito Perez',4),
('8573533A','Mariana Rodriguez',1),
('4252422P','Roberto Lopez',3),
('7553134F','Hernan Muñoz',2);



-- Table structure for table Reservas (tabla de muchos a muchos)
DROP TABLE IF EXISTS Reservas;
CREATE TABLE Reservas (
  id int(11) NOT NULL AUTO_INCREMENT,
  investigadorDni VARCHAR(8) NOT NULL,
  equipoNumSerie 	VARCHAR(4) NOT NULL,
  comienzo DATETIME DEFAULT NULL,
  fin DATETIME DEFAULT NULL,
  PRIMARY KEY (id,investigadorDni,equipoNumSerie),
  CONSTRAINT investigadorDni_fk 
  FOREIGN KEY (investigadorDni) 
  REFERENCES Investigadores (dni) 
  ON DELETE CASCADE 
  ON UPDATE CASCADE,
  CONSTRAINT equipoNumSerie_fk 
  FOREIGN KEY (equipoNumSerie) 
  REFERENCES Equipos (numSerie) 
  ON DELETE CASCADE 
  ON UPDATE CASCADE
) ENGINE=InnoDB;
INSERT INTO Reservas VALUES 
(1,'5533134X','A1','2020-12-10 13:00:00','2020-12-10 17:00:00'),
(2,'4532134G','A3','2020-12-23 11:30:00','2020-12-24 12:00:00'),
(3,'8573533A','A2','2021-01-06 08:00:00','2021-01-11 08:00:00'),
(4,'4252422P','B1','2021-02-04 09:00:00','2021-02-05 09:00:00'),
(5,'7553134F','B2','2021-02-20 12:00:00','2021-02-23 14:40:00');

Select*from Facultades;
Select*from Equipos;
Select*from Investigadores;
Select*From Reservas;
