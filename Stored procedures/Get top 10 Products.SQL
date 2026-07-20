DROP PROCEDURE IF EXISTS rpt.usp_GetTopProducts;
GO

CREATE PROCEDURE rpt.usp_GetTopProducts
    @TopN INT
AS
BEGIN

SET NOCOUNT ON;

SELECT TOP (@TopN)

P.ProductName,

SUM(F.OrderQuantity) AS TotalSales

FROM dw.FactSales F

JOIN dw.DimProduct P
ON F.ProductKey=P.ProductKey

GROUP BY
P.ProductName

ORDER BY
TotalSales DESC;

END;
GO

EXEC rpt.usp_GetTopProducts @TopN=10;