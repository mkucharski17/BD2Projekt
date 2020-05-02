-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-04-30 09:34:21.821

-- foreign keys
ALTER TABLE Agency
    DROP CONSTRAINT Agency_Company;

ALTER TABLE Brand
    DROP CONSTRAINT Brand_Car;

ALTER TABLE Car
    DROP CONSTRAINT Car_Agency;

ALTER TABLE Employee
    DROP CONSTRAINT Employee_Agency;

ALTER TABLE Location
    DROP CONSTRAINT Location_Car;

ALTER TABLE Opinion
    DROP CONSTRAINT Opinion_Car;

ALTER TABLE Opinion
    DROP CONSTRAINT Opinion_Customer;

ALTER TABLE Opinion
    DROP CONSTRAINT Opinion_Rental;

ALTER TABLE Payment
    DROP CONSTRAINT Payment_Rental;

ALTER TABLE Rental
    DROP CONSTRAINT Rental_Car;

ALTER TABLE Rental
    DROP CONSTRAINT Rental_Customer;

ALTER TABLE Rental
    DROP CONSTRAINT Rental_Employee;

ALTER TABLE Rental
    DROP CONSTRAINT Rental_Payment;

-- tables
DROP TABLE Agency;

DROP TABLE Brand;

DROP TABLE Car;

DROP TABLE Company;

DROP TABLE Customer;

DROP TABLE Employee;

DROP TABLE Location;

DROP TABLE Opinion;

DROP TABLE Payment;

DROP TABLE Rental;

-- End of file.

