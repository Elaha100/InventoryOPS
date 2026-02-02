USE InventoryOps;
GO

-- Clean rerun
IF OBJECT_ID('dbo.OrderLines','U') IS NOT NULL DROP TABLE dbo.OrderLines;
IF OBJECT_ID('dbo.Orders','U') IS NOT NULL DROP TABLE dbo.Orders;
IF OBJECT_ID('dbo.ProductCategories','U') IS NOT NULL DROP TABLE dbo.ProductCategories;
IF OBJECT_ID('dbo.Categories','U') IS NOT NULL DROP TABLE dbo.Categories;
IF OBJECT_ID('dbo.Products','U') IS NOT NULL DROP TABLE dbo.Products;
GO

CREATE TABLE dbo.Products (
    ProductId   INT IDENTITY(1,1) PRIMARY KEY,
    Name        NVARCHAR(100) NOT NULL,
    SKU         NVARCHAR(40)  NOT NULL UNIQUE,
    UnitPrice   DECIMAL(10,2) NOT NULL,
    CreatedAt   DATETIME2(0)  NOT NULL DEFAULT SYSDATETIME()
);
GO

CREATE TABLE dbo.Categories (
    CategoryId  INT IDENTITY(1,1) PRIMARY KEY,
    Name        NVARCHAR(80) NOT NULL UNIQUE,
    CreatedAt   DATETIME2(0) NOT NULL DEFAULT SYSDATETIME()
);
GO

-- M2M (kravet: många-till-många via kopplingstabell)
CREATE TABLE dbo.ProductCategories (
    ProductId   INT NOT NULL,
    CategoryId  INT NOT NULL,
    CreatedAt   DATETIME2(0) NOT NULL DEFAULT SYSDATETIME(),
    PRIMARY KEY (ProductId, CategoryId),
    FOREIGN KEY (ProductId) REFERENCES dbo.Products(ProductId),
    FOREIGN KEY (CategoryId) REFERENCES dbo.Categories(CategoryId)
);
GO

CREATE TABLE dbo.Orders (
    OrderId     INT IDENTITY(1,1) PRIMARY KEY,
    Status      NVARCHAR(20) NOT NULL DEFAULT 'Created',
    CreatedAt   DATETIME2(0) NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT CK_Orders_Status CHECK (Status IN ('Created','Paid','Cancelled'))
);
GO

CREATE TABLE dbo.OrderLines (
    OrderLineId INT IDENTITY(1,1) PRIMARY KEY,
    OrderId     INT NOT NULL,
    ProductId   INT NOT NULL,
    Quantity    INT NOT NULL,
    CreatedAt   DATETIME2(0) NOT NULL DEFAULT SYSDATETIME(),
    FOREIGN KEY (OrderId) REFERENCES dbo.Orders(OrderId),
    FOREIGN KEY (ProductId) REFERENCES dbo.Products(ProductId),
    CONSTRAINT CK_OrderLines_Quantity CHECK (Quantity > 0)
);
GO
