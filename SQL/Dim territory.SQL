Create DimTerritory


DROP TABLE IF EXISTS dw.DimTerritory;

CREATE TABLE dw.DimTerritory
(
    TerritoryKey INT PRIMARY KEY,
    Region NVARCHAR(100),
    Country NVARCHAR(100),
    Continent NVARCHAR(100)
);

Load Data

INSERT INTO dw.DimTerritory
(
    TerritoryKey,
    Region,
    Country,
    Continent
)

SELECT

    SalesTerritoryKey,
    Region,
    Country,
    Continent

FROM dbo.Stg_Territory;

Verify Total Rows

SELECT COUNT(*) AS TotalTerritories
FROM dw.DimTerritory;

Preview Data

SELECT *
FROM dw.DimTerritory;

Check for Duplicate Keys

SELECT
    TerritoryKey,
    COUNT(*) AS DuplicateCount
FROM dw.DimTerritory
GROUP BY TerritoryKey
HAVING COUNT(*) > 1;

Check for NULL Values

SELECT *
FROM dw.DimTerritory
WHERE TerritoryKey IS NULL
   OR Region IS NULL
   OR Country IS NULL
   OR Continent IS NULL;