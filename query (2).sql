SELECT p.Name,
       sod.SalesOrderID
FROM [SalesLT].[Product] AS p
LEFT OUTER JOIN [SalesLT].[SalesOrderDetail] AS sod
    ON p.ProductID = sod.ProductID
ORDER BY p.Name DESC;

