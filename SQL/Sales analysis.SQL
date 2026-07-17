Create the Sales Analysis View

DROP VIEW IF EXISTS rpt.vw_SalesAnalysis;


CREATE VIEW rpt.vw_SalesAnalysis
AS

SELECT

    FS.SalesKey,
    FS.OrderNumber,
    FS.OrderLineItem,

    DC.CustomerKey,
    DC.FirstName,
    DC.LastName,
    DC.Gender,
    DC.Occupation,

    DP.ProductKey,
    DP.ProductName,
    DP.SubcategoryName,
    DP.CategoryName,

    DT.FullDate AS OrderDate,
    DT.MonthName,
    DT.CalendarYear,

    DTR.Region,
    DTR.Country,
    DTR.Continent,

    FS.OrderQuantity

FROM dw.FactSales FS

INNER JOIN dw.DimCustomer DC
ON FS.CustomerKey = DC.CustomerKey

INNER JOIN dw.DimProduct DP
ON FS.ProductKey = DP.ProductKey

INNER JOIN dw.DimDate DT
ON FS.OrderDateKey = DT.DateKey

INNER JOIN dw.DimTerritory DTR
ON FS.TerritoryKey = DTR.TerritoryKey;


SELECT TOP 20 *
FROM rpt.vw_SalesAnalysis;

Check Row Count

SELECT COUNT(*) AS TotalRows
FROM rpt.vw_SalesAnalysis;

Validate No NULL Product Names

SELECT *
FROM rpt.vw_SalesAnalysis
WHERE ProductName IS NULL;

Validate No NULL Customer Names

SELECT *
FROM rpt.vw_SalesAnalysis
WHERE FirstName IS NULL;
