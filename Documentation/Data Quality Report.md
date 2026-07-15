
Data Quality Report

Purpose

The objective of this report is to assess the quality of the source data before loading it into the Data Warehouse. High-quality data is essential for accurate reporting, 
reliable analytics, and informed business decisions.

Data Quality Assessment

The following quality checks will be performed on all source files before the ETL process.

1. Missing Values

Objective:

* Identify NULL, blank, or missing values in critical business columns.

Action:

* Replace missing values where appropriate.
* Exclude invalid records when necessary.
* Document all assumptions made during data cleaning.



2. Duplicate Records

Objective:

* Detect duplicate records that may lead to inaccurate reporting.

Action:

* Identify duplicate rows using primary business keys.
* Remove duplicate records while preserving data integrity.



3. Data Type Validation

Objective:

* Ensure each column has the correct data type.

Examples:

* Date columns → Date
* Sales Amount → Decimal
* Quantity → Integer
* Product Key → Integer

Action:

* Convert incorrect data types before loading into the warehouse.

---

4. Business Key Validation

Objective:

* Verify that all primary and foreign keys are valid.

Checks include:

* CustomerKey
* ProductKey
* TerritoryKey
* DateKey
* ProductSubcategoryKey
* ProductCategoryKey

Action:

* Investigate unmatched or missing keys before loading fact tables.



 5. Date Validation

Objective:

* Ensure all date values are valid and consistent.

Checks include:

* Invalid dates
* Missing dates
* Future dates (if not expected)
* Incorrect formats



6. Numeric Value Validation

Objective:

* Validate numeric columns used for reporting.

Examples:

* Sales Amount
* Cost
* Profit
* Quantity
* Return Quantity

Checks:

* Negative values
* Zero values
* Extremely large values
* Unexpected outliers



7. Category Validation

Objective:

* Ensure category names and descriptive fields are consistent.

Examples:

* Product Categories
* Product Subcategories
* Territories

Checks:

* Inconsistent spelling
* Blank categories
* Invalid values



8. Referential Integrity

Objective:

* Ensure relationships between tables remain valid.

Examples:

* Every sales record should reference an existing customer.
* Every product should belong to a valid subcategory.
* Every subcategory should belong to a valid category.
* Every sales record should have a valid date.



ETL Validation Rules

Before loading data into the Data Warehouse:

* Remove duplicate records.
* Validate primary keys.
* Validate foreign keys.
* Standardize data formats.
* Handle missing values.
* Remove invalid records.
* Validate business rules.
* Perform final quality checks before loading dimension and fact tables.



Expected Outcome

After completing data quality validation, the dataset will be:

* Clean
* Consistent
* Accurate
* Reliable
* Ready for ETL processing
* Suitable for Data Warehouse implementation
* Optimized for SQL reporting and Power BI analytics
