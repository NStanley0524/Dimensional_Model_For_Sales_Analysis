-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DA-NStanley24
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DA-NStanley24
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DA-NStanley24` DEFAULT CHARACTER SET utf8 ;
USE `DA-NStanley24` ;

-- -----------------------------------------------------
-- Table `DA-NStanley24`.`Customer_Dim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DA-NStanley24`.`Customer_Dim` (
  `Customer_ID` INT NOT NULL,
  `Name` VARCHAR(100) NULL,
  `Address` VARCHAR(100) NULL,
  `Company` VARCHAR(100) NULL,
  `Phone` VARCHAR(100) NULL,
  PRIMARY KEY (`Customer_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DA-NStanley24`.`Vehicle_Dim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DA-NStanley24`.`Vehicle_Dim` (
  `Vehicle_ID` INT NOT NULL,
  `Make` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Year` INT NULL,
  `Color` VARCHAR(45) NULL,
  `VIN` VARCHAR(45) NULL,
  `Registration_no` VARCHAR(45) NULL,
  `Mileage` INT NULL,
  PRIMARY KEY (`Vehicle_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DA-NStanley24`.`Service_Dim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DA-NStanley24`.`Service_Dim` (
  `Service_ID` INT NOT NULL,
  `Job_Description` VARCHAR(100) NULL,
  `Hours` DECIMAL(10,2) NULL,
  `Rate` DECIMAL(10,2) NULL,
  `Amount` INT NULL,
  PRIMARY KEY (`Service_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DA-NStanley24`.`Parts_Dim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DA-NStanley24`.`Parts_Dim` (
  `Part_ID` INT NOT NULL,
  `Part_name` VARCHAR(100) NULL,
  `Quantity` INT NULL,
  `Unit_price` DECIMAL(10,2) NULL,
  `Total_price` DECIMAL(10,2) NULL,
  PRIMARY KEY (`Part_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DA-NStanley24`.`Location_Dim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DA-NStanley24`.`Location_Dim` (
  `Location_ID` INT NOT NULL,
  `Shop_name` VARCHAR(100) NULL,
  `Address` VARCHAR(100) NULL,
  PRIMARY KEY (`Location_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DA-NStanley24`.`Date_Dim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DA-NStanley24`.`Date_Dim` (
  `Date` DATE NOT NULL,
  `Due_date` DATE NULL,
  `Day_of_the_week` VARCHAR(45) NULL,
  `Month` INT NULL,
  `Year` INT NULL,
  PRIMARY KEY (`Date`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
