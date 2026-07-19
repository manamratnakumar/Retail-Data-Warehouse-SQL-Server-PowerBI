
Business Question: Compare each month's sales with the previous month.


WITH MonthlySales AS
(
    SELECT

        D.CalendarYear,
        D.MonthNumber,
        D.MonthName,

        SUM(F.OrderQuantity) AS TotalSales

    FROM dw.FactSales F

    JOIN dw.DimDate D
    ON F.OrderDateKey = D.DateKey

    GROUP BY
        D.CalendarYear,
        D.MonthNumber,
        D.MonthName
)

SELECT

    CalendarYear,
    MonthName,
    TotalSales,

    LAG(TotalSales)
    OVER
    (
        ORDER BY CalendarYear, MonthNumber
    ) AS PreviousMonth,

    TotalSales -
    LAG(TotalSales)
    OVER
    (
        ORDER BY CalendarYear, MonthNumber
    ) AS Growth

FROM MonthlySales

ORDER BY
    CalendarYear,
    MonthNumber;