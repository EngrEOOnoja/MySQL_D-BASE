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
