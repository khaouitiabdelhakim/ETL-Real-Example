INSERT INTO
    LIGHTADVENTUREWORKSDW.dbo.Customers (
        CustomerDwKey,
        CustomerKey,
        FullName,
        EmailAddress,
        Birthdate,
        MaritalStatus,
        Gender,
        Education,
        Occupation,
        City,
        StateProvince,
        CountryRegion
    )
SELECT
    NEXT VALUE FOR LIGHTADVENTUREWORKSDW.dbo.SeqCustomerDwKey AS CustomerDwKey,
    C.CustomerID AS CustomerKey,
    P.FirstName + ' ' + P.LastName AS FullName,
    E.EmailAddress,
    V.Birthdate,
    V.MaritalStatus,
    V.Gender,
    V.Education,
    V.Occupation,
    A.City,
    SP.Name AS StateProvinceName,
    CR.Name AS CountryRegionName
FROM
    AdventureWorks2012.Sales.Customer AS C
    INNER JOIN AdventureWorks2012.Person.Person AS P ON C.PersonID = P.BusinessEntityID
    INNER JOIN AdventureWorks2012.Person.EmailAddress AS E ON E.EmailAddressID = P.BusinessEntityID
    INNER JOIN AdventureWorks2012.Person.BusinessEntityAddress AS BEA ON P.BusinessEntityID = BEA.BusinessEntityID
    INNER JOIN AdventureWorks2012.Person.Address AS A ON BEA.AddressID = A.AddressID
    INNER JOIN AdventureWorks2012.Person.StateProvince AS SP ON A.StateProvinceID = SP.StateProvinceID
    INNER JOIN AdventureWorks2012.Person.CountryRegion AS CR ON SP.CountryRegionCode = CR.CountryRegionCode
    INNER JOIN AdventureWorks2012.Sales.vPersonDemographics AS V ON P.BusinessEntityID = V.BusinessEntityID;