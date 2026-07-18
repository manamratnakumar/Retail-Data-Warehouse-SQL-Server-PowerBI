
Business Question: Which products have the highest return quantity?

SELECT TOP 10

    P.ProductName,

    SUM(R.ReturnQuantity) AS TotalReturns

FROM dw.FactReturns R

JOIN dw.DimProduct P
ON R.ProductKey=P.ProductKey

GROUP BY
    P.ProductName

ORDER BY
    TotalReturns DESC;