DROP PROCEDURE IF EXISTS rpt.usp_GetSalesByCountry;
GO

CREATE PROCEDURE rpt.usp_GetSalesByCountry
    @Country NVARCHAR(100)
AS
BEGIN

SET NOCOUNT ON;

SELECT

T.Country,

SUM(F.OrderQuantity) AS TotalSales

FROM dw.FactSales F

JOIN dw.DimTerritory T
ON F.TerritoryKey=T.TerritoryKey

WHERE T.Country=@Country

GROUP BY
T.Country;

END;
GO

EXEC rpt.usp_GetSalesByCountry @Country='United States';