USE InventoryOps;
GO

-- PRODUCTS CRUD
INSERT INTO dbo.Products (Name, SKU, UnitPrice)
VALUES ('Test Product','SKU-999',10.00);

SELECT * FROM dbo.Products WHERE SKU = 'SKU-999';

UPDATE dbo.Products
SET UnitPrice = 12.50
WHERE SKU = 'SKU-999';

DELETE FROM dbo.Products
WHERE SKU = 'SKU-999';
GO

-- CATEGORIES CRUD
INSERT INTO dbo.Categories (Name) VALUES ('TempCat');
SELECT * FROM dbo.Categories WHERE Name = 'TempCat';
UPDATE dbo.Categories SET Name='TempCat2' WHERE Name='TempCat';
DELETE FROM dbo.Categories WHERE Name='TempCat2';
GO

-- ORDERS CRUD
INSERT INTO dbo.Orders (Status) VALUES ('Created');
SELECT TOP 5 * FROM dbo.Orders ORDER BY OrderId DESC;
UPDATE dbo.Orders SET Status='Paid' WHERE OrderId = SCOPE_IDENTITY();
DELETE FROM dbo.Orders WHERE OrderId = SCOPE_IDENTITY();
GO

