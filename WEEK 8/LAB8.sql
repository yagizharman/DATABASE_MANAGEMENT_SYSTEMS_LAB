
--1.soru
CREATE TRIGGER TRG_CustomerCount
ON tblCustomer
AFTER INSERT
AS
BEGIN
    DECLARE @countOfCustomers int;
    SELECT @countOfCustomers = COUNT(*) FROM tblCustomer;
    SELECT @countOfCustomers as countOfCustomers ;
END;

--2.soru

INSERT INTO tblCustomer(first_name, last_name, age) VALUES ('Melia', 'Korly', 42)--3.soruCREATE TRIGGER TRG_DeletedProduct
ON tblProduct
AFTER DELETE
AS
BEGIN
    SELECT * FROM DELETED;
END;

--4.soru

ALTER TABLE tblOrder
ADD FOREIGN KEY (productID) REFERENCES tblProduct(productID)
ON DELETE CASCADE;

select * from tblProduct

DELETE from tblProduct where productID=3


CREATE TABLE tblLoss (
lossID INT IDENTITY PRIMARY KEY,
orderID INT,
productID INT,
product_name VARCHAR(255) NOT NULL,
price FLOAT NOT NULL
)

--5.soru

CREATE TRIGGER TRG_DeletedOrder
ON tblOrder
after DELETE
AS
BEGIN

	Declare @orderID int 
	Declare @productID int
	Declare @product_name varchar(255)
	Declare @price float

	Select @orderID=orderID from deleted
	Select @productID=productID from deleted
	Select @product_name=product_name from deleted d INNER JOIN tblProduct p on p.productID=d.productID
	Select @price=price from deleted d INNER JOIN tblProduct p on p.productID=d.productID

    INSERT INTO tblLoss (orderID, productID, product_name, price)
	values(@orderID,@productID,@product_name,@price);
  
    SELECT productID, SUM(price) as totalPriceOfLoss FROM tblLoss GROUP BY productID;
END;


select * from tblOrder
select * from tblProduct



--6.soru
Delete from tblOrder where orderID='9'
Delete from tblOrder where orderID='5'