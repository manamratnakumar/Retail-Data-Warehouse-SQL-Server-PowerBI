
SELECT *
INTO dbo.Stg_Sales
FROM dbo.[Stg_Sales 2020];


INSERT INTO dbo.Stg_Sales
SELECT *
FROM dbo.[Stg_Sales 2021];

INSERT INTO dbo.Stg_Sales
SELECT *
FROM dbo.[Stg_Sales 2022];

SELECT COUNT(*) AS TotalRows
FROM dbo.Stg_Sales;