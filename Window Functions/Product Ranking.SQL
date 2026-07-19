
Business Question: Rank products based on total quantity sold.


SELECT

    P.ProductName,

    SUM(F.OrderQuantity) AS TotalQuantity,

    RANK() OVER
    (
        ORDER BY SUM(F.OrderQuantity) DESC
    ) AS ProductRank

FROM dw.FactSales F

JOIN dw.DimProduct P
ON F.ProductKey = P.ProductKey

GROUP BY
    P.ProductName

ORDER BY
    ProductRank;