use cape_codd;


-- 2.17
select sku, sku_description
from INVENTORY;

-- 2.18
select sku_description, sku
from INVENTORY;

-- 2.19 / 2.20
select distinct warehouseID as ID
from INVENTORY;

-- 2.21
select warehouseID, SKU, SKU_Description, QuantityOnHand, QuantityOnOrder
from INVENTORY;

-- 2.22
select *
from INVENTORY;

-- 2.23
-- Write an SQL statement to display all data on products having a QuantityOnHand
-- greater than 0.
select *
from inventory where QuantityOnHand > 0;

-- 2.24
-- Write an SQL statement to display the SKU and SKU_Description for products having QuantityOnHand 
-- equal to 0.
select SKU, SKU_Description
from inventory where QuantityOnHand = 0;

-- 2.25
-- Write an SQL statement to display the SKU, SKU_Description, and WarehouseID for
-- products that have a QuantityOnHand equal to 0. Sort the results in ascending order
-- by WarehouseID
select SKU, SKU_Description, WarehouseID
from inventory where QuantityOnHand = 0 
order by WarehouseID asc;

-- 2.26
-- Write an SQL statement to display the SKU, SKU_Description, and WarehouseID for
-- products that have a QuantityOnHand greater than 0. Sort the results in descending
-- order by WarehouseID and in ascending order by SKU.
select SKU, SKU_Description, WarehouseID
from inventory where QuantityOnHand = 0
order by WarehouseID desc, SKU asc;

-- 2.27
-- Write an SQL statement to display SKU, SKU_Description, and WarehouseID for all
-- products that have a QuantityOnHand equal to 0 and a QuantityOnOrder greater than 0.
-- Sort the results in descending order by WarehouseID and in ascending order by SKU.
select SKU, SKU_Description, WarehouseID
from inventory where QuantityOnHand = 0 and QuantityOnOrder > 0
order by WarehouseID desc, SKU asc;

-- 2.28
-- Write an SQL statement to display SKU, SKU_Description, and WarehouseID for
-- all products that have a QuantityOnHand equal to 0 or a QuantityOnOrder equal
-- to 0. Sort the results in descending order by WarehouseID and in ascending order
-- by SKU.
select SKU, SKU_Description, WarehouseID
from inventory where QuantityOnHand = 0 or QuantityOnOrder = 0
order by WarehouseID desc, SKU asc;

-- 2.29
-- Write an SQL statement to display the SKU, SKU_Description, WarehouseID, and
-- QuantityOnHand for all products having a QuantityOnHand greater than 1 and less
-- than 10. Do not use the BETWEEN keyword.
select SKU, SKU_Description, WarehouseID, QuantityOnHand
from inventory where QuantityOnHand > 1 and QuantityOnHand <10;

-- 3.10
-- Write an SQL statement to display the SKU, SKU_Description, WarehouseID, and
-- QuantityOnHand for all products having a QuantityOnHand greater than 1 and less
-- than 10. Use the BETWEEN keyword.
select SKU, SKU_Description, WarehouseID, QuantityOnHand
from inventory where QuantityOnHand between 2 and 9;


-- 3.31
-- Write an SQL statement to show a unique SKU and SKU_Description for all products 
-- with an SKU description starting with ‘Half-Dome’.
select distinct SKU, SKU_Description
from inventory where SKU_Description Like 'Half-Dome%';

-- 2.32
-- Write an SQL statement to show a unique SKU and SKU_Description for all products 
-- with a description that includes the word ‘Climb’.
select distinct SKU, SKU_Description
from inventory where SKU_Description Like '%Climb%';



-- 2.33 Write an SQL statement to show a unique SKU and SKU_Description 
-- for all products with a ‘d’ in the third position from the left in SKU_Description.
select distinct SKU, SKU_Description
from inventory where SKU_Description Like '__d%';

-- 2.34 
-- Write an SQL statement that uses all of the SQL built-in functions on the 
-- QuantityOnHand column. Include meaningful column names in the result.
SELECT 
    SUM(QuantityOnHand) AS Total_Quantity_On_Hand,
    COUNT(QuantityOnHand) AS Number_of_Products,
    MIN(QuantityOnHand) AS Minimum_Quantity_On_Hand,
    MAX(QuantityOnHand) AS Maximum_Quantity_On_Hand,
    AVG(QuantityOnHand) AS Average_Quantity_On_Hand
FROM INVENTORY;

-- 2.35 Explain the difference between the SQL built-in functions COUNT and SUM.


-- 2.36 Write an SQL statement to display the WarehouseID and the sum of QuantityOnHand 
-- grouped by WarehouseID. Name the sum TotalItemsOnHand and display the
-- results in descending order of TotalItemsOnHand.
SELECT 
    WarehouseID,
    SUM(QuantityOnHand) AS TotalItemsOnHand
	FROM INVENTORY
	GROUP BY WarehouseID
	ORDER BY TotalItemsOnHand DESC;


-- 2.37 Write an SQL statement to display the WarehouseID and the sum of QuantityOnHand grouped by WarehouseID. Omit all SKU items that have three or more items
-- on hand from the sum, name the sum TotalItemsOnHandLT3, and display the results
-- in descending order of TotalItemsOnHandLT3.
	SELECT WarehouseID,
    SUM(QuantityOnHand) AS TotalItemsOnHandLT3
	FROM INVENTORY
	WHERE QuantityOnHand < 3
	GROUP BY WarehouseID
	ORDER BY TotalItemsOnHandLT3 DESC;




-- 2.38 Write an SQL statement to display the WarehouseID and the sum of Quantity
-- OnHand grouped by WarehouseID. Omit all SKU items that have three or
-- more items on hand from the sum, and name the sum TotalItemsOnHandLT3.
-- Show the WarehouseID only for warehouses having fewer than two SKUs
-- in their TotalItemsOnHandLT3. Display the results in descending order of
-- TotalItemsOnHandLT3.
	SELECT 
    WarehouseID,
    SUM(QuantityOnHand) AS TotalItemsOnHandLT3
	FROM Products
	WHERE QuantityOnHand < 3
	GROUP BY WarehouseID
	HAVING COUNT(SKU) < 2
	ORDER BY TotalItemsOnHandLT3 DESC;



-- 2.39 In your answer to Review Question 2.38, was the WHERE clause or the HAVING
-- clause applied first? Why?


select*
from WAREHOUSE;

-- joining implicitly
-- this
select *
from INVENTORY as i, WAREHOUSE as W
where i.WarehouseID = W.WarehouseID;


select *
from INVENTORY as i, WAREHOUSE as W
where i.WarehouseID != W.WarehouseID;

-- this
select *
from INVENTORY as i join WAREHOUSE as W
where i.WarehouseID != W.WarehouseID;


-- piority join.
select *
from INVENTORY as i Right join WAREHOUSE as W
ON i.WarehouseID != W.WarehouseID;


-- CLASS ACTIVITY TWO.
-- 2.40 Write an SQL statement to display the SKU, SKU_Description, WarehouseID,
-- WarehouseCity, and WarehouseState for all items stored in the Atlanta, Bangor, or
-- Chicago warehouse. Do not use the IN keyword.

	select SKU, SKU_Description, Inventory.WarehouseID, Warehouse.WarehouseID WarehouseCity, WarehouseState
	FROM Inventory JOIN Warehouse
    ON Inventory.WarehouseID = Warehouse.WarehouseID
	WHERE Warehouse.WarehouseCity = 'Atlanta'
	OR Warehouse.WarehouseCity = 'Bangor'
	OR Warehouse.WarehouseCity = 'Chicago';
	
    
-- Write an SQL statement to display the SKU, SKU_Description, WarehouseID,
-- WarehouseCity, and WarehouseState for all items stored in the Atlanta, Bangor, or
-- Chicago warehouse. Use the IN keyword.

	select SKU, SKU_Description, Inventory.WarehouseID, Warehouse.WarehouseID WarehouseCity, WarehouseState
	FROM Inventory JOIN Warehouse
    ON Inventory.WarehouseID = Warehouse.WarehouseID
	where Warehouse.WarehouseCity IN ('Atlanta', 'Bangor', 'Chicago');
	
    
--     Write an SQL statement to display the SKU, SKU_Description, WarehouseID,
-- WarehouseCity, and WarehouseState of all items not stored in the Atlanta, Bangor, or
-- Chicago warehouse. Do not use the NOT IN keyword.
	select SKU, SKU_Description, Inventory.WarehouseID, Warehouse.WarehouseID WarehouseCity, WarehouseState
	FROM Inventory JOIN Warehouse
    ON Inventory.WarehouseID != Warehouse.WarehouseID
	WHERE Warehouse.WarehouseCity = 'Atlanta'
	OR Warehouse.WarehouseCity = 'Bangor'
	OR Warehouse.WarehouseCity = 'Chicago';


-- Write an SQL statement to display the SKU, SKU_Description, WarehouseID,
-- WarehouseCity, and WarehouseState of all items not stored in the Atlanta, Bangor, or
-- Chicago warehouse. Use the NOT IN keyword.
	select SKU, SKU_Description, Inventory.WarehouseID, Warehouse.WarehouseID WarehouseCity, WarehouseState
	FROM Inventory JOIN Warehouse
    ON Inventory.WarehouseID != Warehouse.WarehouseID
	where Warehouse.WarehouseCity IN ('Atlanta', 'Bangor', 'Chicago');


-- Write an SQL statement to produce a single column called ItemLocation that 
-- combines the SKU_Description, the phrase “is located in,” and WarehouseCity. Do not be
-- concerned with removing leading or trailing blanks.


SELECT SKU_Description + ' is located in ' + WarehouseCity AS ItemLocation
FROM Inventory JOIN Warehouse 
ON Inventory.WarehouseID = Warehouse.WarehouseID;

-- Write an SQL statement to show the SKU, SKU_Description, and WarehouseID for
-- all items stored in a warehouse managed by ‘Lucille Smith’. Use a subquery.

SELECT SKU, SKU_Description, WarehouseID
FROM Inventory WHERE WarehouseID IN (
        SELECT WarehouseID
        FROM Warehouse
        WHERE Manager = 'Lucille Smith'
);

-- Write an SQL statement to show the SKU, SKU_Description, and WarehouseID for
-- all items stored in a warehouse managed by ‘Lucille Smith’. Use a join using JOIN ON
-- syntax.

SELECT Inventory.SKU, Inventory.SKU_Description, Inventory.WarehouseID
FROM Inventory JOIN Warehouse
ON Inventory.WarehouseID = Warehouse.WarehouseID
WHERE Warehouse.Manager = 'Lucille Smith';



-- Write an SQL statement to show the WarehouseID and average QuantityOnHand of
-- all items stored in a warehouse managed by ‘Lucille Smith’. Use a subquery.

SELECT WarehouseID, AVG(QuantityOnHand) AS AvgQuantityOnHand
FROM Inventory WHERE WarehouseID IN (
        SELECT WarehouseID
        FROM Warehouse
        WHERE Manager = 'Lucille Smith'
)
GROUP BY WarehouseID;


-- Write an SQL statement to show the WarehouseID and average QuantityOnHand of
-- all items stored in a warehouse managed by ‘Lucille Smith’. Use a join, but do not use
-- JOIN ON syntax.

SELECT Inventory.WarehouseID, AVG(Inventory.QuantityOnHand) AS AvgQuantityOnHand
FROM Inventory, Warehouse
WHERE Inventory.WarehouseID = Warehouse.WarehouseID
AND Warehouse.Manager = 'Lucille Smith'
GROUP BY Inventory.WarehouseID;


-- Write an SQL statement to show the WarehouseID and average QuantityOnHand of
-- all items stored in a warehouse managed by ‘Lucille Smith’. Use a join using JOIN ON
-- syntax.
SELECT Inventory.WarehouseID, AVG(Inventory.QuantityOnHand) AS AvgQuantityOnHand
FROM Inventory JOIN Warehouse
ON Inventory.WarehouseID = Warehouse.WarehouseID
WHERE Warehouse.Manager = 'Lucille Smith'
GROUP BY Inventory.WarehouseID;



SELECT 
    Warehouse.WarehouseID,
    Warehouse.WarehouseCity,
    Warehouse.WarehouseState,
    Warehouse.Manager,
    Inventory.SKU,
    Inventory.SKU_Description,
    Inventory.QuantityOnHand
FROM Inventory
JOIN Warehouse
    ON Inventory.WarehouseID = Warehouse.WarehouseID
WHERE Warehouse.Manager = 'Lucille Smith';



