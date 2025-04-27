SELECT p.Name AS ProductName,
       sod.SalesOrderID,
	   sod.orderqty AS Quantity
FROM [SalesLT].[Product] AS p
INNER JOIN [SalesLT].[SalesOrderDetail] AS sod
    ON p.ProductID = sod.ProductID
ORDER BY p.Name;
