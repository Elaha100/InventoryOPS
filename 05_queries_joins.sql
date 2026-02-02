USE InventoryOps;
GO

-- 1) WHERE + ORDER BY
SELECT * FROM dbo.Products
WHERE UnitPrice > 50
ORDER BY UnitPrice DESC;

-- 2) JOIN (Products + ProductCategories + Categories)
SELECT p.ProductId, p.Name, c.Name AS Category
FROM dbo.Products p
JOIN dbo.ProductCategories pc ON pc.ProductId = p.ProductId
JOIN dbo.Categories c ON c.CategoryId = pc.CategoryId
ORDER BY p.ProductId;

-- 3) JOIN (Orders + OrderLines + Products)
SELECT o.OrderId, o.Status, p.Name, ol.Quantity
FROM dbo.Orders o
JOIN dbo.OrderLines ol ON ol.OrderId = o.OrderId
JOIN dbo.Products p ON p.ProductId = ol.ProductId
ORDER BY o.OrderId;

-- 4) JOIN (Orders + OrderLines) total lines per order
SELECT o.OrderId, o.Status, COUNT(*) AS Lines
FROM dbo.Orders o
JOIN dbo.OrderLines ol ON ol.OrderId = o.OrderId
GROUP BY o.OrderId, o.Status;

-- 5) GROUP BY + aggregate: category count
SELECT c.Name AS Category, COUNT(*) AS ProductLinks
FROM dbo.Categories c
JOIN dbo.ProductCategories pc ON pc.CategoryId = c.CategoryId
GROUP BY c.Name
ORDER BY ProductLinks DESC;

-- 6) GROUP BY + aggregate: total quantity sold per product
SELECT p.Name, SUM(ol.Quantity) AS TotalSold
FROM dbo.Products p
JOIN dbo.OrderLines ol ON ol.ProductId = p.ProductId
GROUP BY p.Name
ORDER BY TotalSold DESC;

-- 7) Simple SELECT: list orders
SELECT * FROM dbo.Orders ORDER BY CreatedAt DESC;

-- 8) REPORT QUERY: "Top products" (mest sålda)
SELECT TOP 5 p.ProductId, p.Name, SUM(ol.Quantity) AS TotalSold
FROM dbo.Products p
JOIN dbo.OrderLines ol ON ol.ProductId = p.ProductId
GROUP BY p.ProductId, p.Name
ORDER BY TotalSold DESC;
GO

