/*
Performance Test
*/

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT

P.CategoryName,

SUM(F.OrderQuantity)

FROM dw.FactSales F

JOIN dw.DimProduct P

ON F.ProductKey=P.ProductKey

GROUP BY

P.CategoryName;

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;