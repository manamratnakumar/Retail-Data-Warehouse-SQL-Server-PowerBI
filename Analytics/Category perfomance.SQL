
Business Question: Which product categories perform the best?


SELECT

    P.CategoryName,

    SUM(F.OrderQuantity) AS QuantitySold

FROM dw.FactSales F

JOIN dw.DimProduct P
ON F.ProductKey=P.ProductKey

GROUP BY

    P.CategoryName

ORDER BY
    QuantitySold DESC;