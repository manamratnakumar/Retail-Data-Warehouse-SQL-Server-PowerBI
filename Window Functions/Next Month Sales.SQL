
Business Question: Compare current month with next month.


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

LEAD(TotalSales)
OVER
(
ORDER BY CalendarYear,MonthNumber
) AS NextMonthSales

FROM MonthlySales;