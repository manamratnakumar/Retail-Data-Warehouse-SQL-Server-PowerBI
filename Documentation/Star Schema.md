Star Schema Design

Overview

The AdventureWorks Data Warehouse follows a Star Schema to simplify reporting and analytical queries.

Fact Tables

* FactSales
* FactReturns

Dimension Tables

* DimCustomer
* DimProduct
* DimCategory
* DimSubCategory
* DimDate
* DimTerritory

Star Schema


                 DimDate
                    │
                    │
DimCustomer ─── FactSales ─── DimProduct
                    │
                    │
             DimTerritory
                    │
              FactReturns
                    │
             DimCategory
                    │
          DimSubCategory


Benefits

* Faster reporting
* Simplified SQL queries
* Better Power BI performance
* Easy KPI calculation
* Optimized analytical processing
