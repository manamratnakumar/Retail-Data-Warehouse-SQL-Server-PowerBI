
Business Question: Find the lowest-selling products.


SELECT TOP 10

P.ProductName,

SUM(F.OrderQuantity) AS TotalSales

FROM dw.FactSales F

JOIN dw.DimProduct P
ON F.ProductKey=P.ProductKey

GROUP BY
P.ProductName

ORDER BY
TotalSales ASC;