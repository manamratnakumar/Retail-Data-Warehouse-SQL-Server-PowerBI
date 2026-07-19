
Business Question: Find the top 5 customers in each country.


WITH CustomerSales AS
(
SELECT

T.Country,

C.CustomerKey,
C.FirstName,
C.LastName,

SUM(F.OrderQuantity) AS TotalSales,

ROW_NUMBER()
OVER
(
PARTITION BY T.Country
ORDER BY SUM(F.OrderQuantity) DESC
) AS RankNo

FROM dw.FactSales F

JOIN dw.DimCustomer C
ON F.CustomerKey=C.CustomerKey

JOIN dw.DimTerritory T
ON F.TerritoryKey=T.TerritoryKey

GROUP BY

T.Country,
C.CustomerKey,
C.FirstName,
C.LastName
)

SELECT *
FROM CustomerSales
WHERE RankNo<=5;