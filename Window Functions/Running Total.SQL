
Business Question: Calculate cumulative sales quantity over time.


SELECT

    D.FullDate,

    SUM(F.OrderQuantity) AS DailySales,

    SUM(SUM(F.OrderQuantity))
    OVER
    (
        ORDER BY D.FullDate
    ) AS RunningTotal

FROM dw.FactSales F

JOIN dw.DimDate D
ON F.OrderDateKey = D.DateKey

GROUP BY
    D.FullDate

ORDER BY
    D.FullDate;