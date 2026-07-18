
Business Question: Which regions generate the highest sales quantity?


SELECT

    T.Region,

    SUM(F.OrderQuantity) AS QuantitySold

FROM dw.FactSales F

JOIN dw.DimTerritory T
ON F.TerritoryKey=T.TerritoryKey

GROUP BY
    T.Region

ORDER BY
    QuantitySold DESC;