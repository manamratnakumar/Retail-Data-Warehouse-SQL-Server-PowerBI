
 Dataset Overview

 Dataset Name

 AdventureWorks Sales Dataset

 Project Domain

 Retail Sales and Business Analytics

 Dataset Description

The AdventureWorks dataset represents the business operations of a multinational retail company. It contains historical sales transactions along with customer, product, calendar, 
territory, and returns information. The dataset is designed to support business intelligence, reporting, and analytical decision-making.

This project uses the dataset to build a centralized Retail Data Warehouse that enables sales analysis, customer insights, product performance tracking, regional reporting, 
and executive dashboards.

 Source Files

The dataset consists of the following source files:

 File Name                                        Description                                 
 AdventureWorks Sales Data 2020.csv               Sales transactions for the year 2020        
 AdventureWorks Sales Data 2021.csv               Sales transactions for the year 2021        
 AdventureWorks Sales Data 2022.csv               Sales transactions for the year 2022        
 AdventureWorks Customer Lookup.csv               Customer information                        
 AdventureWorks Product Lookup.csv                Product details                             
 AdventureWorks Product Categories Lookup.csv     Product category information                
 AdventureWorks Product Subcategories Lookup.csv  Product subcategory information             
 AdventureWorks Calendar Lookup.csv               Date dimension used for time-based analysis 
 AdventureWorks Territory Lookup.csv              Sales territory and regional information    
 AdventureWorks Returns Data.csv                  Product return transactions                 

Business Entities

The project is built around the following business entities:

* Customers
* Products
* Product Categories
* Product Subcategories
* Sales Orders
* Calendar
* Sales Territories
* Returns

These entities will be transformed into dimension and fact tables during the Data Warehouse implementation.

 Expected Warehouse Components

### Dimension Tables

* DimCustomer
* DimProduct
* DimCategory
* DimSubCategory
* DimDate
* DimTerritory

 Fact Tables

* FactSales
* FactReturns

 Data Relationships

The dataset contains common business keys that allow relationships between multiple tables, such as:

* CustomerKey
* ProductKey
* TerritoryKey
* DateKey
* ProductSubcategoryKey
* ProductCategoryKey

These keys will be used to create a Star Schema for analytical reporting.

Data Flow

The project follows a structured ETL process:

Raw CSV Files

↓

Staging Tables

↓

Data Cleaning & Validation

↓

Dimension Tables

↓

Fact Tables

↓

Star Schema

↓

SQL Reporting Views

↓

Power BI Dashboards

 Expected Business Outcomes

The completed Data Warehouse will enable users to:

* Monitor sales performance across multiple years.
* Analyze customer purchasing behavior.
* Track product and category performance.
* Evaluate regional sales trends.
* Measure product return rates.
* Generate interactive business reports and dashboards.
* Support strategic business decision-making through centralized analytics.
