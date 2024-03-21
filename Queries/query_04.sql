SELECT
    C.CustomerDwKey,
    SOD.ProductID AS ProductKey,
    CONVERT(INT, CONVERT(CHAR(8), SOH.OrderDate, 112)) AS OrderDateKey,
    SOD.OrderQty AS OrderQuantity,
    SOD.OrderQty * (SOD.UnitPrice - SOD.UnitPriceDiscount) AS SalesAmount,
    SOD.UnitPrice,
    SOD.UnitPriceDiscount AS DiscountAmount
FROM
    AdventureWorks2012.Sales.SalesOrderHeader AS SOH
    INNER JOIN LightAdventureWorksDW.dbo.Customers AS C ON SOH.CustomerID = C.CustomerKey
    INNER JOIN AdventureWorks2012.Sales.SalesOrderDetail AS SOD ON SOH.SalesOrderID = SOD.SalesOrderID;