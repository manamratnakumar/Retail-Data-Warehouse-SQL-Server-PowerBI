
Business Question: How do sales vary month by month?


SELECT

    D.CalendarYear,
    D.MonthName,

    SUM(F.OrderQuantity) AS TotalSales

FROM dw.FactSales F

JOIN dw.DimDate D
ON F.OrderDateKey=D.DateKey

GROUP BY

    D.CalendarYear,
    D.MonthNumber,
    D.MonthName

ORDER BY

    D.CalendarYear,
    D.MonthNumber;