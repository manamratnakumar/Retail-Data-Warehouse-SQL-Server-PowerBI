Create Return Analysis View

DROP VIEW IF EXISTS rpt.vw_ReturnAnalysis;


CREATE VIEW rpt.vw_ReturnAnalysis
AS

SELECT

    FR.ReturnKey,
    DD.FullDate AS ReturnDate,

    DP.ProductKey,
    DP.ProductName,
    DP.SubcategoryName,
    DP.CategoryName,

    DT.TerritoryKey,
    DT.Region,
    DT.Country,
    DT.Continent,

    FR.ReturnQuantity

FROM dw.FactReturns FR

INNER JOIN dw.DimDate DD
    ON FR.ReturnDateKey = DD.DateKey

INNER JOIN dw.DimProduct DP
    ON FR.ProductKey = DP.ProductKey

INNER JOIN dw.DimTerritory DT
    ON FR.TerritoryKey = DT.TerritoryKey;

	SELECT TOP 20 *
 FROM rpt.vw_ReturnAnalysis;

 Verify Row Count

	SELECT COUNT(*) AS TotalRows
FROM rpt.vw_ReturnAnalysis;

Check for NULL Product Names

SELECT *
FROM rpt.vw_ReturnAnalysis
WHERE ProductName IS NULL;

Check for NULL Regions

SELECT *
FROM rpt.vw_ReturnAnalysis
WHERE Region IS NULL;