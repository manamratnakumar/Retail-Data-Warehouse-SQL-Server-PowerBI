/*
Business Question:
Sales by fiscal year.
*/

SELECT

D.FiscalYear,

SUM(F.OrderQuantity) AS TotalSales

FROM dw.FactSales F

JOIN dw.DimDate D
ON F.OrderDateKey=D.DateKey

GROUP BY
D.FiscalYear

ORDER BY
D.FiscalYear;