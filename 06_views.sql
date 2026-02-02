USE InventoryOps;
GO

-- Public view (ingen känslig data här)
IF OBJECT_ID('dbo.vw_PublicProducts','V') IS NOT NULL DROP VIEW dbo.vw_PublicProducts;
GO
CREATE VIEW dbo.vw_PublicProducts AS
SELECT ProductId, Name, SKU, UnitPrice, CreatedAt
FROM dbo.Products;
GO

-- Report view (Console app kan läsa denna)
IF OBJECT_ID('dbo.vw_ReportTopProducts','V') IS NOT NULL DROP VIEW dbo.vw_ReportTopProducts;
GO
CREATE VIEW dbo.vw_ReportTopProducts AS
SELECT p.ProductId, p.Name, SUM(ol.Quantity) AS TotalSold
FROM dbo.Products p
JOIN dbo.OrderLines ol ON ol.ProductId = p.ProductId
GROUP BY p.ProductId, p.Name;
GO

