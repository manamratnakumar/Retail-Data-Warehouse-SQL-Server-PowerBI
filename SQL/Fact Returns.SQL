
Create FactReturns

DROP TABLE IF EXISTS dw.FactReturns;


CREATE TABLE dw.FactReturns
(
    ReturnKey INT IDENTITY(1,1) PRIMARY KEY,

    ReturnDateKey INT NOT NULL,
    ProductKey INT NOT NULL,
    TerritoryKey INT NOT NULL,

    ReturnQuantity INT NOT NULL
);

Load Data

INSERT INTO dw.FactReturns
(
    ReturnDateKey,
    ProductKey,
    TerritoryKey,
    ReturnQuantity
)

SELECT

    YEAR(ReturnDate) * 10000 +
    MONTH(ReturnDate) * 100 +
    DAY(ReturnDate),

    ProductKey,
    TerritoryKey,
    ReturnQuantity

FROM dbo.Stg_Returns;


Verify Row Count

SELECT COUNT(*) AS TotalReturns
FROM dw.FactReturns;

Preview Data

SELECT TOP 10 *
FROM dw.FactReturns;

Check for NULL Values

SELECT *
FROM dw.FactReturns
WHERE ReturnDateKey IS NULL
   OR ProductKey IS NULL
   OR TerritoryKey IS NULL
   OR ReturnQuantity IS NULL;

   Check Duplicate Records

   SELECT
    ReturnDateKey,
    ProductKey,
    TerritoryKey,
    COUNT(*) AS DuplicateCount
FROM dw.FactReturns
GROUP BY
    ReturnDateKey,
    ProductKey,
    TerritoryKey
HAVING COUNT(*) > 1;

Validate Product Join

SELECT TOP 10
    F.ProductKey,
    P.ProductName
FROM dw.FactReturns F
LEFT JOIN dw.DimProduct P
ON F.ProductKey = P.ProductKey;

Validate Territory Join

SELECT TOP 10
    F.TerritoryKey,
    T.Region,
    T.Country
FROM dw.FactReturns F
LEFT JOIN dw.DimTerritory T
ON F.TerritoryKey = T.TerritoryKey;

Validate Date Join

SELECT TOP 10
    F.ReturnDateKey,
    D.FullDate
FROM dw.FactReturns F
LEFT JOIN dw.DimDate D
ON F.ReturnDateKey = D.DateKey;