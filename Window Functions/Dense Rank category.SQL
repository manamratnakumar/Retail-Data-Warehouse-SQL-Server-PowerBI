
Business Question: Rank products within each category.


SELECT

    P.CategoryName,
    P.ProductName,

    SUM(F.OrderQuantity) AS TotalQuantity,

    DENSE_RANK() OVER
    (
        PARTITION BY P.CategoryName
        ORDER BY SUM(F.OrderQuantity) DESC
    ) AS CategoryRank

FROM dw.FactSales F

JOIN dw.DimProduct P
ON F.ProductKey = P.ProductKey

GROUP BY
    P.CategoryName,
    P.ProductName

ORDER BY
    P.CategoryName,
    CategoryRank;