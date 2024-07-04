-- MySQL Script generated by MySQL Workbench
-- Thu Jul  4 12:22:56 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Guvi Zen Class Database Model
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Guvi Zen Class Database Model
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Guvi Zen Class Database Model` DEFAULT CHARACTER SET utf8 ;
USE `Guvi Zen Class Database Model` ;

-- -----------------------------------------------------
-- Table `Guvi Zen Class Database Model`.`Mentors Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Guvi Zen Class Database Model`.`Mentors Table` (
  `Mentorsid` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(50) NULL,
  `contactNo` INT NULL,
  `assignedbatch` VARCHAR(100) NULL,
  PRIMARY KEY (`Mentorsid`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `contactNo_UNIQUE` (`contactNo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Guvi Zen Class Database Model`.`Batches Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Guvi Zen Class Database Model`.`Batches Table` (
  `Batchid` INT NOT NULL AUTO_INCREMENT,
  `batchname` VARCHAR(255) NULL,
  `totalstudents` INT NULL,
  `mentorid` INT NULL,
  `Mentors Table_Mentorsid` INT NOT NULL,
  PRIMARY KEY (`Batchid`, `Mentors Table_Mentorsid`),
  INDEX `fk_Batches Table_Mentors Table1_idx` (`Mentors Table_Mentorsid` ASC) VISIBLE,
  CONSTRAINT `fk_Batches Table_Mentors Table1`
    FOREIGN KEY (`Mentors Table_Mentorsid`)
    REFERENCES `Guvi Zen Class Database Model`.`Mentors Table` (`Mentorsid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Guvi Zen Class Database Model`.`Students Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Guvi Zen Class Database Model`.`Students Table` (
  `studentsid` INT NOT NULL AUTO_INCREMENT,
  `Studentname` VARCHAR(255) NULL,
  `mobilenumber` VARCHAR(45) NULL,
  `email` VARCHAR(255) NULL,
  `mentor_name` VARCHAR(255) NULL,
  `batchid` VARCHAR(45) NULL,
  `batchname` VARCHAR(255) NULL,
  `Batches Table_Batchid` INT NOT NULL,
  PRIMARY KEY (`studentsid`, `Batches Table_Batchid`),
  UNIQUE INDEX `Studentname_UNIQUE` (`Studentname` ASC) VISIBLE,
  UNIQUE INDEX `mobilenumber_UNIQUE` (`mobilenumber` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_Students Table_Batches Table_idx` (`Batches Table_Batchid` ASC) VISIBLE,
  CONSTRAINT `fk_Students Table_Batches Table`
    FOREIGN KEY (`Batches Table_Batchid`)
    REFERENCES `Guvi Zen Class Database Model`.`Batches Table` (`Batchid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Guvi Zen Class Database Model`.`Tasks Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Guvi Zen Class Database Model`.`Tasks Table` (
  `Tasks_id` INT NOT NULL AUTO_INCREMENT,
  `Tasks_name` VARCHAR(255) NULL,
  `StudentId` INT NULL,
  `mentor_id` INT NULL,
  `mentor_name` VARCHAR(45) NULL,
  `batchname` VARCHAR(50) NULL,
  `Mentors Table_Mentorsid` INT NOT NULL,
  `Students Table_studentsid` INT NOT NULL,
  `Students Table_Batches Table_Batchid` INT NOT NULL,
  PRIMARY KEY (`Tasks_id`, `Mentors Table_Mentorsid`, `Students Table_studentsid`, `Students Table_Batches Table_Batchid`),
  INDEX `fk_Tasks Table_Mentors Table1_idx` (`Mentors Table_Mentorsid` ASC) VISIBLE,
  INDEX `fk_Tasks Table_Students Table1_idx` (`Students Table_studentsid` ASC, `Students Table_Batches Table_Batchid` ASC) VISIBLE,
  CONSTRAINT `fk_Tasks Table_Mentors Table1`
    FOREIGN KEY (`Mentors Table_Mentorsid`)
    REFERENCES `Guvi Zen Class Database Model`.`Mentors Table` (`Mentorsid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tasks Table_Students Table1`
    FOREIGN KEY (`Students Table_studentsid` , `Students Table_Batches Table_Batchid`)
    REFERENCES `Guvi Zen Class Database Model`.`Students Table` (`studentsid` , `Batches Table_Batchid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Guvi Zen Class Database Model`.`Queries Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Guvi Zen Class Database Model`.`Queries Table` (
  `idQueries Table` INT NOT NULL AUTO_INCREMENT,
  `QueriesText` VARCHAR(255) NULL,
  `studentid` INT NULL,
  `mentorid` INT NULL,
  `Students Table_studentsid` INT NOT NULL,
  `Students Table_Batches Table_Batchid` INT NOT NULL,
  `Mentors Table_Mentorsid` INT NOT NULL,
  PRIMARY KEY (`idQueries Table`, `Students Table_studentsid`, `Students Table_Batches Table_Batchid`, `Mentors Table_Mentorsid`),
  INDEX `fk_Queries Table_Students Table1_idx` (`Students Table_studentsid` ASC, `Students Table_Batches Table_Batchid` ASC) VISIBLE,
  INDEX `fk_Queries Table_Mentors Table1_idx` (`Mentors Table_Mentorsid` ASC) VISIBLE,
  CONSTRAINT `fk_Queries Table_Students Table1`
    FOREIGN KEY (`Students Table_studentsid` , `Students Table_Batches Table_Batchid`)
    REFERENCES `Guvi Zen Class Database Model`.`Students Table` (`studentsid` , `Batches Table_Batchid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Queries Table_Mentors Table1`
    FOREIGN KEY (`Mentors Table_Mentorsid`)
    REFERENCES `Guvi Zen Class Database Model`.`Mentors Table` (`Mentorsid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Guvi Zen Class Database Model`.`Dashboards Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Guvi Zen Class Database Model`.`Dashboards Table` (
  `idDashboards` INT NOT NULL AUTO_INCREMENT,
  `studentid` INT NULL,
  `mentorid` INT NULL,
  `batchid` INT NULL,
  `Students Table_studentsid` INT NOT NULL,
  `Students Table_Batches Table_Batchid` INT NOT NULL,
  `Mentors Table_Mentorsid` INT NOT NULL,
  `Batches Table_Batchid` INT NOT NULL,
  `Batches Table_Mentors Table_Mentorsid` INT NOT NULL,
  PRIMARY KEY (`idDashboards`, `Students Table_studentsid`, `Students Table_Batches Table_Batchid`, `Mentors Table_Mentorsid`, `Batches Table_Batchid`, `Batches Table_Mentors Table_Mentorsid`),
  INDEX `fk_Dashboards Table_Students Table1_idx` (`Students Table_studentsid` ASC, `Students Table_Batches Table_Batchid` ASC) VISIBLE,
  INDEX `fk_Dashboards Table_Mentors Table1_idx` (`Mentors Table_Mentorsid` ASC) VISIBLE,
  INDEX `fk_Dashboards Table_Batches Table1_idx` (`Batches Table_Batchid` ASC, `Batches Table_Mentors Table_Mentorsid` ASC) VISIBLE,
  CONSTRAINT `fk_Dashboards Table_Students Table1`
    FOREIGN KEY (`Students Table_studentsid` , `Students Table_Batches Table_Batchid`)
    REFERENCES `Guvi Zen Class Database Model`.`Students Table` (`studentsid` , `Batches Table_Batchid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dashboards Table_Mentors Table1`
    FOREIGN KEY (`Mentors Table_Mentorsid`)
    REFERENCES `Guvi Zen Class Database Model`.`Mentors Table` (`Mentorsid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dashboards Table_Batches Table1`
    FOREIGN KEY (`Batches Table_Batchid` , `Batches Table_Mentors Table_Mentorsid`)
    REFERENCES `Guvi Zen Class Database Model`.`Batches Table` (`Batchid` , `Mentors Table_Mentorsid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Guvi Zen Class Database Model`.`Mock Interviews Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Guvi Zen Class Database Model`.`Mock Interviews Table` (
  `idMock Interviews` INT NOT NULL AUTO_INCREMENT,
  `studentid` INT NULL,
  `mentorid` INT NULL,
  `batchid` INT NULL,
  `Students Table_studentsid` INT NOT NULL,
  `Students Table_Batches Table_Batchid` INT NOT NULL,
  `Mentors Table_Mentorsid` INT NOT NULL,
  `Batches Table_Batchid` INT NOT NULL,
  `Batches Table_Mentors Table_Mentorsid` INT NOT NULL,
  PRIMARY KEY (`idMock Interviews`, `Students Table_studentsid`, `Students Table_Batches Table_Batchid`, `Mentors Table_Mentorsid`, `Batches Table_Batchid`, `Batches Table_Mentors Table_Mentorsid`),
  INDEX `fk_Mock Interviews Table_Students Table1_idx` (`Students Table_studentsid` ASC, `Students Table_Batches Table_Batchid` ASC) VISIBLE,
  INDEX `fk_Mock Interviews Table_Mentors Table1_idx` (`Mentors Table_Mentorsid` ASC) VISIBLE,
  INDEX `fk_Mock Interviews Table_Batches Table1_idx` (`Batches Table_Batchid` ASC, `Batches Table_Mentors Table_Mentorsid` ASC) VISIBLE,
  CONSTRAINT `fk_Mock Interviews Table_Students Table1`
    FOREIGN KEY (`Students Table_studentsid` , `Students Table_Batches Table_Batchid`)
    REFERENCES `Guvi Zen Class Database Model`.`Students Table` (`studentsid` , `Batches Table_Batchid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mock Interviews Table_Mentors Table1`
    FOREIGN KEY (`Mentors Table_Mentorsid`)
    REFERENCES `Guvi Zen Class Database Model`.`Mentors Table` (`Mentorsid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mock Interviews Table_Batches Table1`
    FOREIGN KEY (`Batches Table_Batchid` , `Batches Table_Mentors Table_Mentorsid`)
    REFERENCES `Guvi Zen Class Database Model`.`Batches Table` (`Batchid` , `Mentors Table_Mentorsid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
