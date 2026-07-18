
Business Question: Which occupations purchase the most products?


SELECT

    C.Occupation,

    SUM(F.OrderQuantity) AS QuantitySold

FROM dw.FactSales F

JOIN dw.DimCustomer C
ON F.CustomerKey=C.CustomerKey

GROUP BY
    C.Occupation

ORDER BY
    QuantitySold DESC;