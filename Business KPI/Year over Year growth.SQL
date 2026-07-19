
Business Question: How did sales change compared to the previous year?


WITH YearSales AS
(
    SELECT
        D.CalendarYear,
        SUM(F.OrderQuantity) AS TotalSales
    FROM dw.FactSales F
    JOIN dw.DimDate D
        ON F.OrderDateKey = D.DateKey
    GROUP BY D.CalendarYear
)
SELECT
    CalendarYear,
    TotalSales,
    LAG(TotalSales) OVER(ORDER BY CalendarYear) AS PreviousYearSales,
    TotalSales -
    LAG(TotalSales) OVER(ORDER BY CalendarYear) AS Growth
FROM YearSales;