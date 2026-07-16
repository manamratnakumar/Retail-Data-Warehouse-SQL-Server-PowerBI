DROP TABLE IF EXISTS dw.DimProduct;
GO

CREATE TABLE dw.DimProduct
(
    ProductKey INT NOT NULL PRIMARY KEY,
    ProductSKU NVARCHAR(50),
    ProductName NVARCHAR(200),
    ModelName NVARCHAR(100),
    ProductDescription NVARCHAR(MAX),
    ProductColor NVARCHAR(50),
    ProductSize NVARCHAR(20),
    ProductStyle NVARCHAR(20),
    ProductCost DECIMAL(18,2),
    ProductPrice DECIMAL(18,2),
    ProductSubcategoryKey INT,
    SubcategoryName NVARCHAR(100),
    ProductCategoryKey INT,
    CategoryName NVARCHAR(100)
);


INSERT INTO dw.DimProduct
(
    ProductKey,
    ProductSKU,
    ProductName,
    ModelName,
    ProductDescription,
    ProductColor,
    ProductSize,
    ProductStyle,
    ProductCost,
    ProductPrice,
    ProductSubcategoryKey,
    SubcategoryName,
    ProductCategoryKey,
    CategoryName
)
SELECT DISTINCT
    TRY_CAST(P.ProductKey AS INT),
    P.ProductSKU,
    P.ProductName,
    P.ModelName,
    P.ProductDescription,
    P.ProductColor,
    P.ProductSize,
    P.ProductStyle,
    TRY_CAST(P.ProductCost AS DECIMAL(18,2)),
    TRY_CAST(P.ProductPrice AS DECIMAL(18,2)),
    TRY_CAST(P.ProductSubcategoryKey AS INT),
    PSC.SubcategoryName,
    TRY_CAST(PC.ProductCategoryKey AS INT),
    PC.CategoryName
FROM dbo.Stg_Products AS P
LEFT JOIN dbo.[Stg_Product sub Category] AS PSC
    ON TRY_CAST(P.ProductSubcategoryKey AS INT) =
       TRY_CAST(PSC.ProductSubcategoryKey AS INT)
LEFT JOIN dbo.[Stg_Product Category] AS PC
    ON TRY_CAST(PSC.ProductCategoryKey AS INT) =
       TRY_CAST(PC.ProductCategoryKey AS INT)
WHERE TRY_CAST(P.ProductKey AS INT) IS NOT NULL;


SELECT COUNT(*) AS TotalProducts
FROM dw.DimProduct;

SELECT TOP 10 *
FROM dw.DimProduct;
