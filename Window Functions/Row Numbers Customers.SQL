
Business Question: Assign a sequential number to customers by purchase quantity.


SELECT

    C.CustomerKey,
    C.FirstName,
    C.LastName,

    SUM(F.OrderQuantity) AS TotalPurchased,

    ROW_NUMBER() OVER
    (
        ORDER BY SUM(F.OrderQuantity) DESC
    ) AS RowNum

FROM dw.FactSales F

JOIN dw.DimCustomer C
ON F.CustomerKey = C.CustomerKey

GROUP BY
    C.CustomerKey,
    C.FirstName,
    C.LastName

ORDER BY
    RowNum;