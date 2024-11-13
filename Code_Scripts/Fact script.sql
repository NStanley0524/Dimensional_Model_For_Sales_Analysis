-----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DA-NStanley24`.`Sales_Fact_Table` (
  `Sales_ID` INT NOT NULL,
  `Customer_ID` INT NOT NULL,
  `Vehicle_ID` INT NOT NULL,
  `Service_ID` INT NOT NULL,
  `Part_ID` INT NOT NULL,
  `Location_ID` INT NOT NULL,
  `Date` DATE NULL,
  `Service_Charges` DECIMAL(10,2) NULL,
  `Parts_Charges` DECIMAL(10,2) NULL,
  `Total_Sales` DECIMAL(10,2) NULL,
  `Sales_Tax` DECIMAL(10,2) NULL,
  PRIMARY KEY (`Sales_ID`),
  INDEX `Servicefk_idx` (`Service_ID` ASC) VISIBLE,
  INDEX `Vehiclefk_idx` (`Vehicle_ID` ASC) VISIBLE,
  INDEX `Customerfk_idx` (`Customer_ID` ASC) VISIBLE,
  INDEX `Partfk_idx` (`Part_ID` ASC) VISIBLE,
  INDEX `Locationfk_idx` (`Location_ID` ASC) VISIBLE,
  INDEX `Datefk_idx` (`Date` ASC) VISIBLE,
  CONSTRAINT `Customerfk`
    FOREIGN KEY (`Customer_ID`)
    REFERENCES `DA-NStanley24`.`Customer_Dim` (`Customer_ID`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION,
  CONSTRAINT `Vehiclefk`
    FOREIGN KEY (`Vehicle_ID`)
    REFERENCES `DA-NStanley24`.`Vehicle_Dim` (`Vehicle_ID`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION,
  CONSTRAINT `Servicefk`
    FOREIGN KEY (`Service_ID`)
    REFERENCES `DA-NStanley24`.`Service_Dim` (`Service_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Partfk`
    FOREIGN KEY (`Part_ID`)
    REFERENCES `DA-NStanley24`.`Parts_Dim` (`Part_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Locationfk`
    FOREIGN KEY (`Location_ID`)
    REFERENCES `DA-NStanley24`.`Location_Dim` (`Location_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Datefk`
    FOREIGN KEY (`Date`)
    REFERENCES `DA-NStanley24`.`Date_Dim` (`Date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
