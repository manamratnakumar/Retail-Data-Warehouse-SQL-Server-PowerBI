
Business Question: Calculate rolling 12-month sales.


WITH MonthlySales AS
(
SELECT
    D.CalendarYear,
    D.MonthNumber,
    SUM(F.OrderQuantity) AS TotalSales
FROM dw.FactSales F
JOIN dw.DimDate D
ON F.OrderDateKey=D.DateKey
GROUP BY
D.CalendarYear,
D.MonthNumber
)

SELECT

CalendarYear,
MonthNumber,
TotalSales,

SUM(TotalSales)
OVER(
ORDER BY CalendarYear,MonthNumber
ROWS BETWEEN 11 PRECEDING AND CURRENT ROW
) AS Rolling12Months

FROM MonthlySales;