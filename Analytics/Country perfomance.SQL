
Business Question: Which countries contribute the most sales?


SELECT

    T.Country,

    SUM(F.OrderQuantity) AS QuantitySold

FROM dw.FactSales F

JOIN dw.DimTerritory T
ON F.TerritoryKey=T.TerritoryKey

GROUP BY
    T.Country

ORDER BY
    QuantitySold DESC;