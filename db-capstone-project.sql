-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDM` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDM` ;

-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Bookings` (
  `bookingID` INT NOT NULL,
  `date` DATE NOT NULL,
  `tableNumber` INT NOT NULL,
  PRIMARY KEY (`bookingID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Orders` (
  `orderID` VARCHAR(45) NOT NULL,
  `orderDate` DATE NOT NULL,
  `quantity` INT NOT NULL,
  `totalCost` DECIMAL(5,2) NOT NULL,
  `tableNumber` INT NOT NULL,
  PRIMARY KEY (`orderID`),
  INDEX `tableNumber_idx` (`tableNumber` ASC) VISIBLE,
  CONSTRAINT `tableNumber`
    FOREIGN KEY (`tableNumber`)
    REFERENCES `LittleLemonDM`.`Bookings` (`bookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`OrderDeliveryStatus` (
  `deliveryStatusID` INT NOT NULL,
  `deliveryDate` DATE NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `orderID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`deliveryStatusID`),
  INDEX `orderID_idx` (`orderID` ASC) VISIBLE,
  CONSTRAINT `orderID`
    FOREIGN KEY (`orderID`)
    REFERENCES `LittleLemonDM`.`Orders` (`orderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Menu` (
  `itemID` INT NOT NULL,
  `itemType` VARCHAR(255) NOT NULL,
  `itemName` VARCHAR(255) NOT NULL,
  `price` DECIMAL(5,2) NULL,
  PRIMARY KEY (`itemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Customer` (
  `customerID` INT NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `contactNumber` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`customerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Staff` (
  `staffID` INT NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `salary` DECIMAL NOT NULL,
  PRIMARY KEY (`staffID`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
