-- Add a column as primary key and it should be autoincrement

ALTER TABLE zepto_v2
ADD COLUMN sr_no INT AUTO_INCREMENT PRIMARY KEY;

-- Data Exploration

-- Sample Data
SELECT * 
FROM zepto_v2
LIMIT 5;

-- Count of rows
SELECT COUNT(*)
FROM zepto_v2;

-- Null Values
SELECT * 
FROM zepto_v2
WHERE name IS NULL
OR Category IS NULL
OR mrp IS NULL
OR discountedSellingPrice IS NULL
OR availableQuantity IS NULL
OR discountPercent IS NULL
OR weightInGms IS NULL
OR outOfStock IS NULL
OR quantity IS NULL
OR sr_no IS NULL;

DELETE 
FROM zepto_v2
WHERE name IS NULL
OR Category IS NULL
OR mrp IS NULL
OR discountedSellingPrice IS NULL
OR availableQuantity IS NULL
OR discountPercent IS NULL
OR weightInGms IS NULL
OR outOfStock IS NULL
OR quantity IS NULL
OR sr_no IS NULL;


-- Different product categories 

SELECT DISTINCT(Category)
FROM zepto_v2
ORDER BY Category;

-- Product in stock vs out of stock

SELECT outOfStock, COUNT(sr_no) as "Total Count"
FROM zepto_v2
GROUP BY outOfStock;

-- Product names present multiple times

SELECT name, COUNT(sr_no) as "Number of SKu"
FROM zepto_v2
GROUP BY name
HAVING COUNT(sr_no) > 1
ORDER BY COUNT(sr_no) DESC;

-- Data Cleaning

-- Product with price = 0
SELECT * 
FROM zepto_v2
WHERE mrp = 0 OR discountedSellingPrice = 0;

SET SQL_SAFE_UPDATES = 0;
DELETE 
FROM zepto_v2
WHERE mrp = 0 OR discountedSellingPrice = 0;

-- Convert paise to rupees
UPDATE zepto_v2
SET mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

SELECT *
FROM zepto_v2;

-- Find the top 10 best value products based on  the discount percentage.

SELECT DISTINCT(name), mrp, discountPercent
FROM zepto_v2
ORDER BY discountPercent DESC
LIMIT 10;

-- What are the products with high MRP but out of stock

SELECT DISTINCT(name), MAX(mrp)
FROM zepto_v2
WHERE outOfStock = "TRUE"
GROUP BY name
ORDER BY MAX(mrp) DESC;

-- Calculate estimated revenue for each category

SELECT category, SUM(discountedSellingPrice * quantity) AS "Total Revenue"
FROM zepto_v2
GROUP BY Category
ORDER BY "Total Revenue";

-- Find all the products where MRP is greater than 500 and discount is less than 10%

SELECT DISTINCT(name), mrp, discountPercent
FROM zepto_v2
WHERE mrp > 500 and discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

-- Identify the top 5 categories offering the highest average discount percentage

SELECT Category, ROUND(AVG(discountPercent)) AS "Average Discount"
FROM zepto_v2
GROUP BY Category
ORDER BY "Averager Discount" DESC
LIMIT 5;

-- Find the price per gram for products above 100g and sort by best value.

SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms, 2) AS "Price per Gram"
FROM zepto_v2
WHERE weightInGms >= 100
ORDER BY "Price per Gram" DESC;

-- Group the products into categories like Low, medium and bulk.

SELECT DISTINCT name, weightInGms,
CASE 
WHEN weightInGms < 1000 THEN 'Low'
 WHEN weightInGms < 5000 THEN 'Medium'
 ELSE "Bulk"
 END AS "Weight Category"
FROM zepto_v2;

-- What is the total invantory weight per category

SELECT Category, SUM(weightInGms * quantity) AS "Total Weight"
FROM zepto_v2
GROUP BY Category
ORDER BY "Total Weight";