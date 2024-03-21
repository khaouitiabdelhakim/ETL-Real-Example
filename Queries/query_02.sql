SELECT
    P.ProductID AS ProductKey,
    P.Name AS EnglishProductName,
    P.Color,
    P.Size,
    S.Name AS EnglishProductSubcategoryName,
    C.Name AS EnglishProductCategoryName
FROM
    AdventureWorks2012.Production.Product AS P
    INNER JOIN AdventureWorks2012.Production.ProductSubcategory AS S ON P.ProductSubcategoryID = S.ProductSubcategoryID
    INNER JOIN AdventureWorks2012.Production.ProductCategory AS C ON S.ProductCategoryID = C.ProductCategoryID;