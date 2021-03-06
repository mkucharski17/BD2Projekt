-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-04-30 09:34:21.821

-- tables
-- Table: Agency
CREATE TABLE Agency (
    Id integer   GENERATED BY DEFAULT ON NULL AS IDENTITY,
    Name varchar2(100)  NULL,
    Registartion_Date date  NULL,
    Company_Id integer  NOT NULL,
    CONSTRAINT Agency_pk PRIMARY KEY (Id)
) ;

-- Table: Brand
CREATE TABLE Brand (
    Id Integer   GENERATED BY DEFAULT ON NULL AS IDENTITY,
    Company varchar2(50)  NOT NULL,
    Model varchar2(30)  NOT NULL,
    Car_Id integer  NOT NULL,
    CONSTRAINT Brand_pk PRIMARY KEY (Id)
) ;

-- Table: Car
CREATE TABLE Car (
    Id integer  GENERATED BY DEFAULT ON NULL AS IDENTITY,
    Type varchar2(30)  NULL,
    Power integer  NULL,
    Airbags smallint  NULL,
    Mileage integer  NULL,
    Status varchar2(30)  NOT NULL,
    Agency_Id integer  NOT NULL,
    CONSTRAINT Car_pk PRIMARY KEY (Id)
) ;

-- Table: Company
CREATE TABLE Company (
    Id integer   GENERATED BY DEFAULT ON NULL AS IDENTITY,
    Full_Name varchar2(100)  NULL,
    Nip varchar2(50)  NULL,
    CONSTRAINT Company_pk PRIMARY KEY (Id)
) ;

-- Table: Customer
CREATE TABLE Customer (
    Id integer   GENERATED BY DEFAULT ON NULL AS IDENTITY,
    Nick varchar2(100)  NOT NULL,
    First_Name varchar2(100)  NULL,
    Last_Name varchar2(100)  NULL,
    Email varchar2(100)  NOT NULL,
    Pasword_Hash varchar2(100)  NOT NULL,
    Phone varchar2(100)  NULL,
    Add_Date date  NULL,
    CONSTRAINT Customer_pk PRIMARY KEY (Id)
) ;

-- Table: Employee
CREATE TABLE Employee (
    Id integer  GENERATED BY DEFAULT ON NULL AS IDENTITY,
    Conclusion_Contract_Date date  NOT NULL,
    Salary number(8,2)  NULL,
    Availability varchar2(30)  NOT NULL,
    Experience varchar2(20)  NULL,
    Agency_Id integer  NOT NULL,
    CONSTRAINT Employee_pk PRIMARY KEY (Id)
) ;

-- Table: Location
CREATE TABLE Location (
    Id integer   GENERATED BY DEFAULT ON NULL AS IDENTITY,
    Country varchar2(50)  NULL,
    City varchar2(100)  NULL,
    Postal_Code varchar2(20)  NULL,
    Street varchar2(100)  NULL,
    Longitude number(9,6)  NULL,
    Lattitude number(9,6)  NULL,
    Car_Id integer  NOT NULL,
    CONSTRAINT Location_pk PRIMARY KEY (Id)
) ;

-- Table: Opinion
CREATE TABLE Opinion (
    Id integer   GENERATED BY DEFAULT ON NULL AS IDENTITY,
    Opinion varchar2(1000)  NULL,
    "Date" date  NULL,
    Rate integer  NOT NULL,
    Rental_Id integer  NULL,
    Car_Id integer  NULL,
    Customer_Id integer  NOT NULL,
    CONSTRAINT Opinion_pk PRIMARY KEY (Id)
) ;

-- Table: Payment
CREATE TABLE Payment (
    Id integer   GENERATED BY DEFAULT ON NULL AS IDENTITY,
    Method varchar2(50)  NOT NULL,
    "Date" date  NOT NULL,
    Customer_Bank varchar2(50)  NOT NULL,
    Company_Bank varchar2(50)  NOT NULL,
    Value_PLN number(10,2)  NOT NULL,
    Rental_Id integer  NOT NULL,
    CONSTRAINT Payment_pk PRIMARY KEY (Id)
) ;

-- Table: Rental
CREATE TABLE Rental (
    Id integer   GENERATED BY DEFAULT ON NULL AS IDENTITY,
    Cost number(10,2)  NOT NULL,
    Start_Date date  NOT NULL,
    End_Date date  NULL,
    State varchar2(50)  NOT NULL,
    Employee_Id integer  NOT NULL,
    Car_Id integer  NOT NULL,
    Customer_Id integer  NOT NULL,
    Payment_Id integer  NULL,
    CONSTRAINT Rental_pk PRIMARY KEY (Id)
) ;

-- foreign keys
-- Reference: Agency_Company (table: Agency)
ALTER TABLE Agency ADD CONSTRAINT Agency_Company
    FOREIGN KEY (Company_Id)
    REFERENCES Company (Id);

-- Reference: Brand_Car (table: Brand)
ALTER TABLE Brand ADD CONSTRAINT Brand_Car
    FOREIGN KEY (Car_Id)
    REFERENCES Car (Id);

-- Reference: Car_Agency (table: Car)
ALTER TABLE Car ADD CONSTRAINT Car_Agency
    FOREIGN KEY (Agency_Id)
    REFERENCES Agency (Id);

-- Reference: Employee_Agency (table: Employee)
ALTER TABLE Employee ADD CONSTRAINT Employee_Agency
    FOREIGN KEY (Agency_Id)
    REFERENCES Agency (Id);

-- Reference: Location_Car (table: Location)
ALTER TABLE Location ADD CONSTRAINT Location_Car
    FOREIGN KEY (Car_Id)
    REFERENCES Car (Id);

-- Reference: Opinion_Car (table: Opinion)
ALTER TABLE Opinion ADD CONSTRAINT Opinion_Car
    FOREIGN KEY (Car_Id)
    REFERENCES Car (Id);

-- Reference: Opinion_Customer (table: Opinion)
ALTER TABLE Opinion ADD CONSTRAINT Opinion_Customer
    FOREIGN KEY (Customer_Id)
    REFERENCES Customer (Id);

-- Reference: Opinion_Rental (table: Opinion)
ALTER TABLE Opinion ADD CONSTRAINT Opinion_Rental
    FOREIGN KEY (Rental_Id)
    REFERENCES Rental (Id);

-- Reference: Payment_Rental (table: Payment)
ALTER TABLE Payment ADD CONSTRAINT Payment_Rental
    FOREIGN KEY (Rental_Id)
    REFERENCES Rental (Id);

-- Reference: Rental_Car (table: Rental)
ALTER TABLE Rental ADD CONSTRAINT Rental_Car
    FOREIGN KEY (Car_Id)
    REFERENCES Car (Id);

-- Reference: Rental_Customer (table: Rental)
ALTER TABLE Rental ADD CONSTRAINT Rental_Customer
    FOREIGN KEY (Customer_Id)
    REFERENCES Customer (Id);

-- Reference: Rental_Employee (table: Rental)
ALTER TABLE Rental ADD CONSTRAINT Rental_Employee
    FOREIGN KEY (Employee_Id)
    REFERENCES Employee (Id);

-- Reference: Rental_Payment (table: Rental)
ALTER TABLE Rental ADD CONSTRAINT Rental_Payment
    FOREIGN KEY (Payment_Id)
    REFERENCES Payment (Id);

-- End of file.

