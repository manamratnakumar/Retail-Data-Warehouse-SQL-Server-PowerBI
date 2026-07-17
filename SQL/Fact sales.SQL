

SELECT TOP 10 *
FROM dbo.Stg_Sales;
Create FactSales

DROP TABLE IF EXISTS dw.FactSales;
GO

CREATE TABLE dw.FactSales
(
    SalesKey INT IDENTITY(1,1) PRIMARY KEY,

    OrderNumber NVARCHAR(30) NOT NULL,
    OrderLineItem INT NOT NULL,

    OrderDateKey INT NOT NULL,
    StockDateKey INT NOT NULL,

    CustomerKey INT NOT NULL,
    ProductKey INT NOT NULL,
    TerritoryKey INT NOT NULL,

    OrderQuantity INT NOT NULL
);

Load Data

INSERT INTO dw.FactSales
(
    OrderNumber,
    OrderLineItem,
    OrderDateKey,
    StockDateKey,
    CustomerKey,
    ProductKey,
    TerritoryKey,
    OrderQuantity
)

SELECT

    OrderNumber,
    OrderLineItem,

    YEAR(OrderDate) * 10000 +
    MONTH(OrderDate) * 100 +
    DAY(OrderDate),

    YEAR(StockDate) * 10000 +
    MONTH(StockDate) * 100 +
    DAY(StockDate),

    CustomerKey,
    ProductKey,
    TerritoryKey,
    OrderQuantity

FROM dbo.Stg_Sales;

Verify Total Rows

SELECT COUNT(*) AS TotalRows
FROM dw.FactSales;

Preview Data

SELECT TOP 10 *
FROM dw.FactSales;

Check Duplicate Orders


SELECT
    OrderNumber,
    OrderLineItem,
    COUNT(*) AS DuplicateCount
FROM dw.FactSales
GROUP BY
    OrderNumber,
    OrderLineItem
HAVING COUNT(*) > 1;

Check for NULLS

SELECT *
FROM dw.FactSales
WHERE CustomerKey IS NULL
   OR ProductKey IS NULL
   OR TerritoryKey IS NULL
   OR OrderDateKey IS NULL
   OR StockDateKey IS NULL;

   Validate Date Keys

   SELECT TOP 20
    F.OrderDateKey,
    D.FullDate
FROM dw.FactSales F
LEFT JOIN dw.DimDate D
ON F.OrderDateKey = D.DateKey;

Validate Customer Join

SELECT TOP 20
    F.CustomerKey,
    C.FirstName,
    C.LastName
FROM dw.FactSales F
LEFT JOIN dw.DimCustomer C
ON F.CustomerKey = C.CustomerKey;

Validate Product Join

SELECT TOP 20
    F.ProductKey,
    P.ProductName
FROM dw.FactSales F
LEFT JOIN dw.DimProduct P
ON F.ProductKey = P.ProductKey;

Validate Territory Join

SELECT TOP 20
    F.TerritoryKey,
    T.Region,
    T.Country
FROM dw.FactSales F
LEFT JOIN dw.DimTerritory T
ON F.TerritoryKey = T.TerritoryKey;




