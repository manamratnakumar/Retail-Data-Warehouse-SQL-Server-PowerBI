DROP PROCEDURE IF EXISTS rpt.usp_GetReturnAnalysis;
GO

CREATE PROCEDURE rpt.usp_GetReturnAnalysis
AS
BEGIN

SET NOCOUNT ON;

SELECT

P.ProductName,

SUM(R.ReturnQuantity) AS Returns

FROM dw.FactReturns R

JOIN dw.DimProduct P
ON R.ProductKey=P.ProductKey

GROUP BY
P.ProductName

ORDER BY
Returns DESC;

END;
GO