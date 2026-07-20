/*
Purpose:
Improve performance for common reporting queries.
*/

CREATE NONCLUSTERED INDEX IX_FactSales_Date_Product
ON dw.FactSales
(
    OrderDateKey,
    ProductKey
);

CREATE NONCLUSTERED INDEX IX_FactSales_Product_Customer
ON dw.FactSales
(
    ProductKey,
    CustomerKey
);

CREATE NONCLUSTERED INDEX IX_FactReturns_Date_Product
ON dw.FactReturns
(
    ReturnDateKey,
    ProductKey
);