-- MySQL Script generated by MySQL Workbench
-- Fri Apr 24 13:26:51 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema login-registro-axios
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema login-registro-axios
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `login-registro-axios` DEFAULT CHARACTER SET utf8 ;
USE `login-registro-axios` ;

-- -----------------------------------------------------
-- Table `login-registro-axios`.`TBL_GENEROS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `login-registro-axios`.`TBL_GENEROS` (
  `ID_GENERO` INT NOT NULL AUTO_INCREMENT,
  `GENERO` VARCHAR(45) NOT NULL,
  `ABREV` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`ID_GENERO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `login-registro-axios`.`TBL_PERSONAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `login-registro-axios`.`TBL_PERSONAS` (
  `ID_PERSONA` INT NOT NULL AUTO_INCREMENT,
  `ID_GENERO` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `APELLIDO` VARCHAR(45) NULL,
  `TELEFONO` VARCHAR(20) NULL,
  PRIMARY KEY (`ID_PERSONA`),
  INDEX `fk_TBL_PERSONAS_TBL_GENEROS_idx` (`ID_GENERO` ASC) ,
  CONSTRAINT `fk_TBL_PERSONAS_TBL_GENEROS`
    FOREIGN KEY (`ID_GENERO`)
    REFERENCES `login-registro-axios`.`TBL_GENEROS` (`ID_GENERO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `login-registro-axios`.`TBL_USUARIOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `login-registro-axios`.`TBL_USUARIOS` (
  `ID_USUARIO` INT NOT NULL,
  `CORREO` VARCHAR(45) NOT NULL,
  `PASSWORD` VARCHAR(200) NULL,
  INDEX `fk_TBL_USUARIOS_TBL_PERSONAS1_idx` (`ID_USUARIO` ASC) ,
  PRIMARY KEY (`ID_USUARIO`),
  CONSTRAINT `fk_TBL_USUARIOS_TBL_PERSONAS1`
    FOREIGN KEY (`ID_USUARIO`)
    REFERENCES `login-registro-axios`.`TBL_PERSONAS` (`ID_PERSONA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


--DML 
INSERT INTO `tbl_generos` (`ID_GENERO`, `GENERO`, `ABREV`) VALUES (NULL, 'Masculino', 'M'), (NULL, 'Femenino', 'F'), (NULL, 'Otro', 'O');

SELECT A.ID_PERSONA , A.NOMBRE , A.APELLIDO , C.GENERO , B.CORREO , A.TELEFONO FROM TBL_PERSONAS A 
LEFT JOIN TBL_USUARIOS B ON (A.ID_PERSONA = B.ID_USUARIO) 
LEFT JOIN TBL_GENEROS C ON (A.ID_GENERO = C.ID_GENERO);


SELECT (AUTO_INCREMENT-1)
FROM  INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'login-registro-axios'
AND   TABLE_NAME   = 'tbl_personas';

INSERT INTO tbl_personas (ID_GENERO,NOMBRE,APELLIDO,TELEFONO) VALUES (1,'NOMBRE 1','APELLIDO 1','27717727');

INSERT INTO tbl_usuarios VALUES (
	(
      	SELECT (AUTO_INCREMENT-1)
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA = 'login-registro-axios'
		AND TABLE_NAME = 'tbl_personas'
    ) ,
    'test1@gmail.com' ,
    'asd456'
);