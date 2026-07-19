/*
Business Question:
Segment customers by purchase quantity.
*/

WITH CustomerSales AS
(
SELECT

CustomerKey,

SUM(OrderQuantity) AS TotalPurchased

FROM dw.FactSales

GROUP BY CustomerKey
)

SELECT

CustomerKey,
TotalPurchased,

CASE

WHEN TotalPurchased>=300 THEN 'High Value'

WHEN TotalPurchased>=150 THEN 'Medium Value'

ELSE 'Low Value'

END AS CustomerSegment

FROM CustomerSales;