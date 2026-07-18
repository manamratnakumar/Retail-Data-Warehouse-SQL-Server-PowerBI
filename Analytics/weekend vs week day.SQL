
Business Question: Are more products sold on weekdays or weekends?


SELECT

    CASE
        WHEN D.IsWeekend=1 THEN 'Weekend'
        ELSE 'Weekday'
    END AS SalesDay,

    SUM(F.OrderQuantity) AS QuantitySold

FROM dw.FactSales F

JOIN dw.DimDate D
ON F.OrderDateKey=D.DateKey

GROUP BY
    D.IsWeekend;