DROP TABLE dw.DimCustomer;
GO

CREATE TABLE dw.DimCustomer
(
    CustomerKey INT NOT NULL PRIMARY KEY,
    Prefix NVARCHAR(50),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    BirthDate DATE,
    MaritalStatus CHAR(1),
    Gender NVARCHAR(5),
    EmailAddress NVARCHAR(100),
    AnnualIncome DECIMAL(18,2),
    TotalChildren INT,
    EducationLevel NVARCHAR(50),
    Occupation NVARCHAR(50),
    HomeOwner CHAR(1)
);
GO

INSERT INTO dw.DimCustomer
(
    CustomerKey,
    Prefix,
    FirstName,
    LastName,
    BirthDate,
    MaritalStatus,
    Gender,
    EmailAddress,
    AnnualIncome,
    TotalChildren,
    EducationLevel,
    Occupation,
    HomeOwner
)
SELECT DISTINCT
    TRY_CAST(CustomerKey AS INT),
    Prefix,
    FirstName,
    LastName,
    TRY_CAST(BirthDate AS DATE),
    MaritalStatus,
    Gender,
    EmailAddress,
    TRY_CAST(AnnualIncome AS DECIMAL(18,2)),
    TRY_CAST(TotalChildren AS INT),
    EducationLevel,
    Occupation,
    HomeOwner
FROM dbo.Stg_Customer
WHERE TRY_CAST(CustomerKey AS INT) IS NOT NULL;

SELECT COUNT(*) AS TotalCustomers
FROM dw.DimCustomer;

SELECT TOP 10 *
FROM dw.DimCustomer;

