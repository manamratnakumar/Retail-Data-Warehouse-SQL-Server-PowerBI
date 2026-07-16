
SELECT name
FROM sys.schemas;

 Verify Staging Data

SELECT COUNT(*) AS CustomerCount
FROM dbo.Stg_Customer;

SELECT COUNT(*) AS ProductCount
FROM dbo.Stg_Products;

SELECT COUNT(*) AS SalesCount
FROM dbo.Stg_Sales;

SELECT COUNT(*) AS ReturnsCount
FROM dbo.Stg_Returns;

 Check Referential Integrity

SELECT DISTINCT S.ProductKey
FROM dbo.Stg_Sales AS S
LEFT JOIN dbo.Stg_Products AS P
    ON S.ProductKey = P.ProductKey
WHERE P.ProductKey IS NULL;

Check customers:

SELECT DISTINCT S.CustomerKey
FROM dbo.Stg_Sales AS S
LEFT JOIN dbo.Stg_Customer AS C
    ON S.CustomerKey = C.CustomerKey
WHERE C.CustomerKey IS NULL;

Check territories:

SELECT DISTINCT S.TerritoryKey
FROM dbo.Stg_Sales AS S
LEFT JOIN dbo.Stg_Territory AS T
    ON S.TerritoryKey = T.SalesTerritoryKey
WHERE T.SalesTerritoryKey IS NULL;