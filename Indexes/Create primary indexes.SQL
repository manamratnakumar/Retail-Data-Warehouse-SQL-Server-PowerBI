/*
Purpose:
Create indexes to improve join and filtering performance.
*/

-- FactSales
CREATE NONCLUSTERED INDEX IX_FactSales_CustomerKey
ON dw.FactSales(CustomerKey);

CREATE NONCLUSTERED INDEX IX_FactSales_ProductKey
ON dw.FactSales(ProductKey);

CREATE NONCLUSTERED INDEX IX_FactSales_OrderDateKey
ON dw.FactSales(OrderDateKey);

CREATE NONCLUSTERED INDEX IX_FactSales_TerritoryKey
ON dw.FactSales(TerritoryKey);

-- FactReturns
CREATE NONCLUSTERED INDEX IX_FactReturns_ProductKey
ON dw.FactReturns(ProductKey);

CREATE NONCLUSTERED INDEX IX_FactReturns_ReturnDateKey
ON dw.FactReturns(ReturnDateKey);

CREATE NONCLUSTERED INDEX IX_FactReturns_TerritoryKey
ON dw.FactReturns(TerritoryKey);