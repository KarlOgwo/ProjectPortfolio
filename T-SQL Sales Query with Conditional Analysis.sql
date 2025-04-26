
-- Retrieve detailed sales information with running total and conditional logic
SELECT 
    sod.SalesOrderID,
    sod.ProductID,
    p.Name AS ProductName,
    sod.OrderQty,
    sod.LineTotal,
    SUM(sod.LineTotal) OVER (PARTITION BY sod.ProductID) AS RunningTotal,
    CASE 
        WHEN sod.OrderQty > 10 THEN 'Bulk Order'
        ELSE 'Regular Order'
    END AS OrderType,
    (SELECT AVG(LineTotal) 
     FROM [SalesLT].[SalesOrderDetail]
     WHERE ProductID = sod.ProductID) AS AvgLineTotal,
    soh.OrderDate,
    soh.CustomerID,
    c.FirstName + ' ' + c.LastName AS CustomerName
FROM 
    [SalesLT].[SalesOrderDetail] AS sod
JOIN 
    [SalesLT].[Product] AS p ON sod.ProductID = p.ProductID
JOIN 
    [SalesLT].[SalesOrderHeader] AS soh ON sod.SalesOrderID = soh.SalesOrderID
JOIN 
    [SalesLT].[Customer] AS c ON soh.CustomerID = c.CustomerID
WHERE 
    sod.LineTotal > 10
ORDER BY 
    sod.ProductID, soh.OrderDate;