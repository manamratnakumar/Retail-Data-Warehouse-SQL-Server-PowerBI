/*
Business Question:
Which customers placed more than one order?
*/

SELECT

CustomerKey,

COUNT(DISTINCT OrderNumber) AS TotalOrders

FROM dw.FactSales

GROUP BY
CustomerKey

HAVING COUNT(DISTINCT OrderNumber)>1

ORDER BY
TotalOrders DESC;