
Business Question: What percentage of total quantity does each product contribute?


SELECT

P.ProductName,

SUM(F.OrderQuantity) AS TotalSales,

CAST
(
SUM(F.OrderQuantity)*100.0/
SUM(SUM(F.OrderQuantity)) OVER()
AS DECIMAL(10,2)
) AS SalesPercentage

FROM dw.FactSales F

JOIN dw.DimProduct P
ON F.ProductKey=P.ProductKey

GROUP BY
P.ProductName

ORDER BY
SalesPercentage DESC;