DROP PROCEDURE IF EXISTS rpt.usp_GetCustomerOrders;
GO

CREATE PROCEDURE rpt.usp_GetCustomerOrders

@CustomerKey INT

AS
BEGIN

SET NOCOUNT ON;

SELECT *

FROM rpt.vw_SalesAnalysis

WHERE CustomerKey=@CustomerKey;

END;
GO

EXEC rpt.usp_GetCustomerOrders @CustomerKey=11000;