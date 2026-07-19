/*
Business Question:
Classify products into A, B, and C categories.
*/

WITH ProductSales AS
(
SELECT

P.ProductName,

SUM(F.OrderQuantity) AS QuantitySold

FROM dw.FactSales F

JOIN dw.DimProduct P
ON F.ProductKey=P.ProductKey

GROUP BY
P.ProductName
)

SELECT

ProductName,
QuantitySold,

CASE

WHEN QuantitySold>=1000 THEN 'A'

WHEN QuantitySold>=500 THEN 'B'

ELSE 'C'

END AS ProductClass

FROM ProductSales

ORDER BY
QuantitySold DESC;