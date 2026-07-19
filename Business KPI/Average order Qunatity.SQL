/*
Business Question:
Average order quantity.
*/

SELECT

AVG(CAST(OrderQuantity AS DECIMAL(10,2))) AS AverageOrderQuantity

FROM dw.FactSales;