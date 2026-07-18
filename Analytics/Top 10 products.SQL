Business Question: Which products sold the highest quantity?

SELECT TOP 10

    P.ProductName,
    SUM(F.OrderQuantity) AS TotalQuantitySold

FROM dw.FactSales F

INNER JOIN dw.DimProduct P
ON F.ProductKey = P.ProductKey

GROUP BY
    P.ProductName

ORDER BY
    TotalQuantitySold DESC;