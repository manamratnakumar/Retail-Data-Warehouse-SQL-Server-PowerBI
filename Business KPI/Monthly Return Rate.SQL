/*
Business Question:
Monthly return quantity.
*/

SELECT

D.CalendarYear,
D.MonthName,

SUM(R.ReturnQuantity) AS Returns

FROM dw.FactReturns R

JOIN dw.DimDate D
ON R.ReturnDateKey=D.DateKey

GROUP BY

D.CalendarYear,
D.MonthNumber,
D.MonthName

ORDER BY
D.CalendarYear,
D.MonthNumber;