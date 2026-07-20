DROP PROCEDURE IF EXISTS rpt.usp_GetTopCustomers;
GO

CREATE PROCEDURE rpt.usp_GetTopCustomers
    @TopN INT
AS
BEGIN

SET NOCOUNT ON;

SELECT TOP (@TopN)

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

END;
GO

EXEC rpt.usp_GetTopCustomers @TopN=10;