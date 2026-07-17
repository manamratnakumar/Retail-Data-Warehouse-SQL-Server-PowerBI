Drop the old table

DROP TABLE IF EXISTS dw.DimDate;

Create the table

CREATE TABLE dw.DimDate
(
    DateKey INT PRIMARY KEY,
    FullDate DATE NOT NULL,
    DayNumber TINYINT NOT NULL,
    DayName NVARCHAR(15) NOT NULL,
    MonthNumber TINYINT NOT NULL,
    MonthName NVARCHAR(20) NOT NULL,
    QuarterNumber TINYINT NOT NULL,
    CalendarYear SMALLINT NOT NULL,
    FiscalQuarter TINYINT NOT NULL,
    FiscalYear SMALLINT NOT NULL,
    WeekdayNumber TINYINT NOT NULL,
    IsWeekend BIT NOT NULL
);

Insert all dates

;WITH DateSeries AS
(
    SELECT CAST('2020-01-01' AS DATE) AS FullDate

    UNION ALL

    SELECT DATEADD(DAY,1,FullDate)
    FROM DateSeries
    WHERE FullDate < '2022-12-31'
)

INSERT INTO dw.DimDate
(
    DateKey,
    FullDate,
    DayNumber,
    DayName,
    MonthNumber,
    MonthName,
    QuarterNumber,
    CalendarYear,
    FiscalQuarter,
    FiscalYear,
    WeekdayNumber,
    IsWeekend
)

SELECT

    YEAR(FullDate) * 10000
        + MONTH(FullDate) * 100
        + DAY(FullDate),

    FullDate,

    DAY(FullDate),

    DATENAME(WEEKDAY,FullDate),

    MONTH(FullDate),

    DATENAME(MONTH,FullDate),

    DATEPART(QUARTER,FullDate),

    YEAR(FullDate),

    CASE
        WHEN MONTH(FullDate) BETWEEN 4 AND 6 THEN 1
        WHEN MONTH(FullDate) BETWEEN 7 AND 9 THEN 2
        WHEN MONTH(FullDate) BETWEEN 10 AND 12 THEN 3
        ELSE 4
    END,

    CASE
        WHEN MONTH(FullDate) >= 4
            THEN YEAR(FullDate)
        ELSE YEAR(FullDate)-1
    END,

    DATEPART(WEEKDAY,FullDate),

    CASE
        WHEN DATENAME(WEEKDAY,FullDate) IN ('Saturday','Sunday')
            THEN 1
        ELSE 0
    END

FROM DateSeries
OPTION (MAXRECURSION 1100);



SELECT COUNT(*) AS TotalDates
FROM dw.DimDate;

SELECT TOP 10 *
FROM dw.DimDate;


