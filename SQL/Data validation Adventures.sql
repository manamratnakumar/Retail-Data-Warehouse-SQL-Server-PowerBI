SELECT 'Stg_Calendar' AS TableName, COUNT(*) AS TotalRows
FROM dbo.Stg_Calendar

Verify Row Counts

UNION ALL

SELECT 'Stg_Customer', COUNT(*)
FROM dbo.Stg_Customer

UNION ALL

SELECT 'Stg_Product Category', COUNT(*)
FROM dbo.[Stg_Product Category]

UNION ALL

SELECT 'Stg_Product sub Category', COUNT(*)
FROM dbo.[Stg_Product sub Category]

UNION ALL

SELECT 'Stg_Products', COUNT(*)
FROM dbo.Stg_Products

UNION ALL

SELECT 'Stg_Returns', COUNT(*)
FROM dbo.Stg_Returns

UNION ALL

SELECT 'Stg_Sales 2020', COUNT(*)
FROM dbo.[Stg_Sales 2020]

UNION ALL

SELECT 'Stg_Sales 2021', COUNT(*)
FROM dbo.[Stg_Sales 2021]

UNION ALL

SELECT 'Stg_Sales 2022', COUNT(*)
FROM dbo.[Stg_Sales 2022]

UNION ALL

SELECT 'Stg_Territory', COUNT(*)
FROM dbo.Stg_Territory;

Check Duplicate Customers

SELECT CustomerKey,
       COUNT(*) AS DuplicateCount
FROM dbo.Stg_Customer
GROUP BY CustomerKey
HAVING COUNT(*) > 1;

Check Duplicate Products

SELECT ProductKey,
       COUNT(*) AS DuplicateCount
FROM dbo.Stg_Products
GROUP BY ProductKey
HAVING COUNT(*) > 1;

Check Duplicate Sales

SELECT OrderNumber,
       ProductKey,
       COUNT(*) AS DuplicateCount
FROM dbo.Stg_Sales
GROUP BY OrderNumber, ProductKey
HAVING COUNT(*) > 1;

Check NULL CustomerKey

SELECT *
FROM dbo.Stg_Customer
WHERE CustomerKey IS NULL;

Check NULL ProductKey

SELECT *
FROM dbo.Stg_Products
WHERE ProductKey IS NULL;

Check NULL OrderDate

SELECT *
FROM dbo.Stg_Territory
WHERE SalesTerritoryKey IS NULL;

Check Negative Sales

SELECT *
FROM dbo.Stg_Sales
WHERE SalesAmount < 0;

Check Negative Returns


SELECT *
FROM dbo.Stg_Returns
WHERE ReturnQuantity < 0;

SELECT *
FROM dbo.Stg_Sales
WHERE OrderDate IS NULL;

SELECT COUNT(*) AS SalesRows
FROM dbo.Stg_Sales;

SELECT TOP 5 *
FROM dbo.Stg_Customer;



