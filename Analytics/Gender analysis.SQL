
Business Question: How is sales quantity distributed by gender?


SELECT

    C.Gender,

    SUM(F.OrderQuantity) AS QuantitySold

FROM dw.FactSales F

JOIN dw.DimCustomer C
ON F.CustomerKey=C.CustomerKey

GROUP BY
    C.Gender;