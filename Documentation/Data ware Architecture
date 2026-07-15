Data Warehouse Architecture

Overview

This project follows a layered Data Warehouse architecture to transform raw operational data into a structured analytical model for reporting and business intelligence.

The architecture separates data into multiple layers to improve data quality, maintainability, and reporting performance.

Architecture Layers

1. Source Layer

The source layer consists of raw CSV files provided by the AdventureWorks dataset.

Source files include:

* Customer Lookup
* Product Lookup
* Product Categories
* Product Subcategories
* Calendar Lookup
* Territory Lookup
* Sales Data (2020–2022)
* Returns Data


 2. Staging Layer

The staging layer stores imported source data without business transformations.

Purpose:

* Initial data loading
* Data validation
* Data cleansing
* Duplicate detection
* Error handling



3. Data Warehouse Layer

The warehouse layer stores cleaned and integrated data using a Star Schema.

Dimension Tables:

* DimCustomer
* DimProduct
* DimCategory
* DimSubCategory
* DimDate
* DimTerritory

Fact Tables:

* FactSales
* FactReturns



4. Reporting Layer

The reporting layer consists of SQL views and Power BI dashboards that provide business insights for decision-makers.



Architecture Benefits

* Centralized data repository
* Improved reporting performance
* Scalable design
* Consistent business metrics
* Better data quality
* Easier maintenance
* Optimized analytical queries
