USE InventoryOps;
GO

-- Role
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'inventory_reader')
    CREATE ROLE inventory_reader;
GO

-- Demo user (enkelt). Byt namn om ni vill.
-- OBS: kräver SQL Server login. Om ni kör bara Windows auth kan ni istället skapa user från Windows-konto.
IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'inv_reader_login')
    CREATE LOGIN inv_reader_login WITH PASSWORD = 'P@ssword12345!';
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'inv_reader_user')
    CREATE USER inv_reader_user FOR LOGIN inv_reader_login;
GO

EXEC sp_addrolemember 'inventory_reader', 'inv_reader_user';
GO

-- Grant SELECT only on views
GRANT SELECT ON dbo.vw_PublicProducts TO inventory_reader;
GRANT SELECT ON dbo.vw_ReportTopProducts TO inventory_reader;
GO

-- (VIKTIGT) Ge inte select på tabellerna till rollen
-- Inget mer behövs här.

