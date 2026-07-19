
Business Question: Find the top 3 products in each category.


WITH RankedProducts AS
(
SELECT

P.CategoryName,
P.ProductName,

SUM(F.OrderQuantity) AS TotalSales,

ROW_NUMBER()
OVER
(
PARTITION BY P.CategoryName
ORDER BY SUM(F.OrderQuantity) DESC
) AS RankNo

FROM dw.FactSales F

JOIN dw.DimProduct P
ON F.ProductKey=P.ProductKey

GROUP BY
P.CategoryName,
P.ProductName
)

SELECT *
FROM RankedProducts
WHERE RankNo<=3;