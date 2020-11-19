-- MySQL Script generated by MySQL Workbench
-- Thu Nov 19 10:07:08 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`VIVERO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VIVERO` (
  `UBICACION` INT NOT NULL,
  `HORA_APERTURA` TIME NULL,
  `HORA_CIERRE` TIME NULL,
  PRIMARY KEY (`UBICACION`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ZONA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ZONA` (
  `NUMERO_ZONA` INT NOT NULL,
  `AREA` INT NULL,
  `VIVERO_UBICACION` INT NOT NULL,
  `ID_PRODUCTO` INT NOT NULL,
  PRIMARY KEY (`NUMERO_ZONA`, `VIVERO_UBICACION`),
  INDEX `fk_ZONA_VIVERO1_idx` (`VIVERO_UBICACION` ASC)  ,
  INDEX `ID_PRODUCTO_idx` (`ID_PRODUCTO` ASC)  ,
  CONSTRAINT `fk_ZONA_VIVERO1`
    FOREIGN KEY (`VIVERO_UBICACION`)
    REFERENCES `mydb`.`VIVERO` (`UBICACION`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,   
  CONSTRAINT `ID_PROD`
    FOREIGN KEY (`ID_PRODUCTO`)
    REFERENCES `mydb`.`PRODUCTO` (`COD.BARRAS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PRODUCTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PRODUCTO` (
  `COD.BARRAS` INT NOT NULL,
  `PRECIO` VARCHAR(45) NULL,
  `PRODUCTOcol` VARCHAR(45) NULL,
  `stock` INT NULL,
  `ID_PEDIDO` INT NOT NULL,
  PRIMARY KEY (`COD.BARRAS`),
  INDEX `ID_PEDIDO_idx` (`ID_PEDIDO` ASC)  ,
  CONSTRAINT `ID_PED`
    FOREIGN KEY (`ID_PEDIDO`)
    REFERENCES `mydb`.`PEDIDO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CLIENTE` (
  `DNI` INT NOT NULL,
  `CUENTA FIDELIZACION` VARCHAR(2) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EMPLEADO` (
  `DNI` INT NOT NULL,
  `COD.SEGURIDAD_SOCIAL` VARCHAR(45) NOT NULL,
  `TIPO_CONTRATO` VARCHAR(45) NULL,
  `NOMBRE` VARCHAR(45) NULL,
  `FECHA_INI` DATE NULL,
  `FECHA_FIN` DATE NULL,
  `NUMERO_ZONA` INT NOT NULL,
  `VIVERO_UBICACION` INT NOT NULL,
  PRIMARY KEY (`DNI`),
  INDEX `NUMERO_ZONA_idx` (`NUMERO_ZONA` ASC)  ,
  INDEX `VIVERO_UBICACION_idx` (`VIVERO_UBICACION` ASC)  ,
  CONSTRAINT `NUMERO_ZON`
    FOREIGN KEY (`NUMERO_ZONA`, `VIVERO_UBICACION`)
    REFERENCES `mydb`.`ZONA` (`NUMERO_ZONA`, `VIVERO_UBICACION`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PEDIDO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PEDIDO` (
  `ID` INT NOT NULL,
  `FECHA` DATE NULL,
  `ID_PRODUCTO` INT NOT NULL,
  `CANTIDAD` INT NULL,
  `CLIENTE_DNI` INT NOT NULL,
  `EMPLEADO_DNI` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `ID_PRODUCTO_idx` (`ID_PRODUCTO` ASC)  ,
  INDEX `fk_PEDIDO_CLIENTE1_idx` (`CLIENTE_DNI` ASC)  ,
  INDEX `fk_PEDIDO_EMPLEADO1_idx` (`EMPLEADO_DNI` ASC)  ,
  CONSTRAINT `ID_PRODUCT`
    FOREIGN KEY (`ID_PRODUCTO`)
    REFERENCES `mydb`.`PRODUCTO` (`COD.BARRAS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PEDIDO_CLIENTE1`
    FOREIGN KEY (`CLIENTE_DNI`)
    REFERENCES `mydb`.`CLIENTE` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PEDIDO_EMPLEADO1`
    FOREIGN KEY (`EMPLEADO_DNI`)
    REFERENCES `mydb`.`EMPLEADO` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
