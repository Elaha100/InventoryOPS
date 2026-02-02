USE InventoryOps;
GO

-- 10 Products (krav)
INSERT INTO dbo.Products (Name, SKU, UnitPrice) VALUES
('Coffee Beans 1kg','SKU-001',149.00),
('Green Tea','SKU-002',49.00),
('Chocolate Bar','SKU-003',19.00),
('Notebook A5','SKU-004',29.00),
('Pen Pack','SKU-005',39.00),
('USB Cable','SKU-006',79.00),
('Phone Charger','SKU-007',199.00),
('Hand Soap','SKU-008',35.00),
('Protein Bar','SKU-009',25.00),
('Water Bottle','SKU-010',99.00);
GO

-- 6 Categories (krav)
INSERT INTO dbo.Categories (Name) VALUES
('Beverages'),
('Snacks'),
('Office'),
('Electronics'),
('Health'),
('Home');
GO

-- 25 records i kopplingstabell (krav)
-- (Här lägger vi 2–3 kategorier per produkt tills vi nått 25)
INSERT INTO dbo.ProductCategories (ProductId, CategoryId) VALUES
(1,1),(1,2),
(2,1),
(3,2),
(4,3),
(5,3),
(6,4),
(7,4),
(8,6),(8,5),
(9,2),(9,5),
(10,6),(10,1),

-- extra för att nå 25
(1,3),
(2,5),
(3,6),
(4,6),
(5,2),
(6,3),
(7,1),
(8,2),
(9,1),
(10,5);
GO

-- Orders + OrderLines (lite data så appen kan visa något)
INSERT INTO dbo.Orders (Status) VALUES
('Created'),('Paid'),('Created'),('Cancelled'),('Paid');
GO

INSERT INTO dbo.OrderLines (OrderId, ProductId, Quantity) VALUES
(1,1,2),(1,3,5),(1,4,1),
(2,7,1),(2,6,2),
(3,10,1),(3,2,3),
(4,5,2),
(5,9,4),(5,8,2);
GO
