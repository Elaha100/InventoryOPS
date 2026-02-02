
USE InventoryOps;
GO

IF OBJECT_ID('dbo.vw_ReportTopProducts','V') IS NOT NULL DROP VIEW dbo.vw_ReportTopProducts;
IF OBJECT_ID('dbo.vw_PublicProducts','V') IS NOT NULL DROP VIEW dbo.vw_PublicProducts;

IF OBJECT_ID('dbo.OrderLines','U') IS NOT NULL DROP TABLE dbo.OrderLines;
IF OBJECT_ID('dbo.Orders','U') IS NOT NULL DROP TABLE dbo.Orders;
IF OBJECT_ID('dbo.ProductCategories','U') IS NOT NULL DROP TABLE dbo.ProductCategories;
IF OBJECT_ID('dbo.Categories','U') IS NOT NULL DROP TABLE dbo.Categories;
IF OBJECT_ID('dbo.Products','U') IS NOT NULL DROP TABLE dbo.Products;
GO


