# ETL Process using SSMS and SSIS with AdventureWorks2012 Data

This repository contains a real example of an Extract, Transform, Load (ETL) process using SQL Server Management Studio (SSMS), SQL Server Integration Services (SSIS), and AdventureWorks2012 data. The objective is to load data into our LightAdventureDW data warehouse.

```
If you find this repository useful or it has helped you,
please don't forget to leave a ⭐️, or even follow my GitHub account.
Your support motivates me to continue providing helpful resources.
Thank you for your appreciation! 🌟🚀💖😊👍

If you'd like to support further, consider buying us a coffee:
```
[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee--yellow.svg?style=for-the-badge&logo=buy-me-a-coffee)](https://www.buymeacoffee.com/kh.abdelhakim)

## Overview

The goal of this project is to demonstrate how to extract data from transactional databases, transform it, and load it into a data warehouse. We will achieve this by performing complex queries involving multiple table joins.

## Instructions

### Prerequisites

- SQL Server Management Studio (SSMS)
- SQL Server Integration Services (SSIS)
- AdventureWorks2012 database

### Cleanup

Before running the ETL process, it's recommended to clear existing data from the LightAdventureDW data warehouse using the following SQL script in SSMS:

```sql
delete from LIGHTADVENTUREWORKSDW.dbo.InternetSales;
delete from LIGHTADVENTUREWORKSDW.dbo.Dates;
delete from LIGHTADVENTUREWORKSDW.dbo.Products;
delete from LIGHTADVENTUREWORKSDW.dbo.Customers;
```

### Extract, Transform, Load

#### Extracting Data from AdventureWorks2012

To extract data from the transactional AdventureWorks2012 database, we utilize SQL queries that perform joins and transformations. For example:

```sql
SELECT
    CONVERT(INT, CONVERT(CHAR(8), OrderDate, 112)) AS DateKey,
    CONVERT(DATE, OrderDate) AS FullDate,
    SUBSTRING(CONVERT(CHAR(8), OrderDate, 112), 5, 2) + ' ' + DATENAME(MONTH, OrderDate) AS MonthNumberName,
    DATEPART(QUARTER, OrderDate) AS CalendarQuarter,
    DATEPART(YEAR, OrderDate) AS CalendarYear
FROM
    AdventureWorks2012.Sales.SalesOrderHeader;
```

#### Loading Data into LightAdventureDW

Once data is extracted and transformed, it can be loaded into the LightAdventureDW data warehouse. SSIS packages can be created and executed to automate this process.

#### Example: Loading Dates Dimension

Here's an example of loading the dates dimension using data from AdventureWorks2012:

```sql
SELECT DateKey, FullDateAlternateKey as FullDate,
SUBSTRING(CONVERT(CHAR(8), FullDateAlternateKey, 112), 5, 2)
+ ' ' + EnglishMonthName as MonthNumberName,
CalendarQuarter, CalendarYear
FROM AdventureWorksDW2012.dbo.DimDate;
```

## Conclusion

This repository serves as a practical guide for performing ETL processes using SSMS, SSIS, and AdventureWorks2012 data. By following the provided examples, users can gain insights into extracting, transforming, and loading data for analytical purposes.

We hope you find this repository helpful!

## License

```
Copyright 2024 Bengmah Anass - KHAOUITI Abdelhakim
powered by KHAOUITI Apps

Licensed under the MIT License
You may obtain a copy of the License at

http://opensource.org/licenses/MIT

Unless required by applicable law or agreed to in writing, software
distributed under the MIT License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the MIT License.
```

