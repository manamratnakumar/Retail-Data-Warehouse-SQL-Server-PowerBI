Create Product Performance View

DROP VIEW IF EXISTS rpt.vw_ProductPerformance;
GO

CREATE VIEW rpt.vw_ProductPerformance
AS

SELECT

    DP.ProductKey,
    DP.ProductName,
    DP.SubcategoryName,
    DP.CategoryName,

    SUM(FS.OrderQuantity) AS TotalQuantitySold,

    COUNT(FS.SalesKey) AS TotalOrders,

    ISNULL(SUM(FR.ReturnQuantity),0) AS TotalReturns,

    CAST(
        ISNULL(SUM(FR.ReturnQuantity),0) * 100.0 /
        NULLIF(SUM(FS.OrderQuantity),0)
        AS DECIMAL(10,2)
    ) AS ReturnRatePercent

FROM dw.DimProduct DP

LEFT JOIN dw.FactSales FS
    ON DP.ProductKey = FS.ProductKey

LEFT JOIN dw.FactReturns FR
    ON DP.ProductKey = FR.ProductKey

GROUP BY

    DP.ProductKey,
    DP.ProductName,
    DP.SubcategoryName,
    DP.CategoryName;
GO

SELECT TOP 20 *
FROM rpt.vw_ProductPerformance;

Total Products

SELECT COUNT(*) AS TotalProducts
FROM rpt.vw_ProductPerformance;

Top 10 Best Selling Products

SELECT TOP 10
    ProductName,
    TotalQuantitySold
FROM rpt.vw_ProductPerformance
ORDER BY TotalQuantitySold DESC;

Top 10 Most Returned Products

SELECT TOP 10
    ProductName,
    TotalReturns
FROM rpt.vw_ProductPerformance
ORDER BY TotalReturns DESC;

Highest Return Rate

SELECT TOP 10
    ProductName,
    ReturnRatePercent
FROM rpt.vw_ProductPerformance
ORDER BY ReturnRatePercent DESC;

