/*
Purpose:
Returns total order quantity for a selected year.
*/

DROP PROCEDURE IF EXISTS rpt.usp_GetSalesByYear;
GO

CREATE PROCEDURE rpt.usp_GetSalesByYear
    @Year INT
AS
BEGIN

SET NOCOUNT ON;

SELECT

    D.CalendarYear,

    SUM(F.OrderQuantity) AS TotalSales

FROM dw.FactSales F

JOIN dw.DimDate D
ON F.OrderDateKey=D.DateKey

WHERE D.CalendarYear=@Year

GROUP BY
D.CalendarYear;

END;
GO