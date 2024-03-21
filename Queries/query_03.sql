SELECT
    CONVERT(INT, CONVERT(CHAR(8), OrderDate, 112)) AS DateKey,
    CONVERT(DATE, OrderDate) AS FullDate,
    SUBSTRING(CONVERT(CHAR(8), OrderDate, 112), 5, 2) + ' ' + DATENAME(MONTH, OrderDate) AS MonthNumberName,
    DATEPART(QUARTER, OrderDate) AS CalendarQuarter,
    DATEPART(YEAR, OrderDate) AS CalendarYear
FROM
    AdventureWorks2012.Sales.SalesOrderHeader;