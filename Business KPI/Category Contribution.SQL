/*
Business Question:
What percentage does each category contribute?
*/

SELECT

P.CategoryName,

SUM(F.OrderQuantity) AS QuantitySold,

CAST(

SUM(F.OrderQuantity)*100.0/

SUM(SUM(F.OrderQuantity))
OVER()

AS DECIMAL(10,2)

) AS ContributionPercent

FROM dw.FactSales F

JOIN dw.DimProduct P
ON F.ProductKey=P.ProductKey

GROUP BY
P.CategoryName

ORDER BY
ContributionPercent DESC;