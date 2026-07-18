Business Question: Who are the top customers by purchased quantity?

SELECT TOP 10

    C.CustomerKey,
    C.FirstName,
    C.LastName,

    SUM(F.OrderQuantity) AS TotalPurchased

FROM dw.FactSales F

JOIN dw.DimCustomer C
ON F.CustomerKey=C.CustomerKey

GROUP BY

    C.CustomerKey,
    C.FirstName,
    C.LastName

ORDER BY
    TotalPurchased DESC;