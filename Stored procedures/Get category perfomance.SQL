DROP PROCEDURE IF EXISTS rpt.usp_GetCategoryPerformance;
GO

CREATE PROCEDURE rpt.usp_GetCategoryPerformance
AS
BEGIN

SET NOCOUNT ON;

SELECT

P.CategoryName,

SUM(F.OrderQuantity) AS QuantitySold

FROM dw.FactSales F

JOIN dw.DimProduct P
ON F.ProductKey=P.ProductKey

GROUP BY
P.CategoryName

ORDER BY
QuantitySold DESC;

END;
GO

EXEC rpt.usp_GetCategoryPerformance;