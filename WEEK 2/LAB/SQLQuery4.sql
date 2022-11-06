CREATE DATABASE VTYSLAB2;
USE VTYSLab2;


CREATE TABLE tbl_customer(
 CustomerID int NOT NULL,
 CustomerIdentityNumber nvarchar(11) NULL,
 CustomerName nvarchar(20) NULL,
 CustomerSurname nvarchar(20) NULL,

);

CREATE TABLE tbl_order(
 OrderID int NOT NULL,
 OrderCount int NULL,
 OrderAddress nvarchar(255) NULL,
 CustomerID int NOT NULL,
 ProductID int NOT NULL,
);

CREATE TABLE tbl_product(
 ProductID int NOT NULL,
 ProductName nvarchar(50) NULL,
 ProductPrice decimal(10,2) NULL,
 ProductCount int NULL,
);

ALTER TABLE tbl_customer ADD PRIMARY KEY(CustomerID);
ALTER TABLE tbl_order ADD PRIMARY KEY(OrderID);
ALTER TABLE tbl_product ADD PRIMARY KEY(ProductID);
ALTER TABLE tbl_order ADD FOREIGN KEY(CustomerID) REFERENCES tbl_customer(CustomerID);
ALTER TABLE tbl_order ADD FOREIGN KEY(ProductID) REFERENCES tbl_product(ProductID);


