SELECT * FROM [KMS Sql Case Study]
--------Question 1------ Which product category had the highest sales?
SELECT TOP 1 PRODUCT_CATEGORY,
SUM (SALES) AS TOTAL_SALES
FROM [KMS Sql Case Study]
GROUP BY Product_Category
ORDER BY TOTAL_SALES DESC

-----Question 2----
Select top 3 [Region], sum([sales]) as[Total Sales]
from [KMS Sql Case Study]
group by Region
Order by[Total Sales] desc

Select top 3 [Region], sum([sales]) as[Total Sales]
from [KMS Sql Case Study]
group by Region
Order by[Total Sales] asc

-----Question 3-------
select [Region], sum(sales) as [Total sales]
from [KMS Sql Case Study]
where Region ='Ontario'
Group by Region 

-----Question 4-----
SELECT TOP 10
    Product_category, 
	Customer_Name,
    SUM(Sales) AS Total_Sales
 from [KMS Sql Case Study]
GROUP BY 
    Product_category, Customer_Name
ORDER BY 
    Total_Sales ASC;

-----Question 5-----
select top 10 [Customer_Name],
Sum([Sales]) as [Total sales]
from [KMS Sql Case Study]
Group by
Customer_Name, Product_Name
order by[Total sales] asc



----Question 5--- KMS incurred the most shipping cost using which shipping method?
Select Top 1 [Ship_Mode],
Sum ([shipping_cost]) as [Total shipping cost]
from [KMS Sql Case Study]
group by Ship_Mode
order by [Total shipping cost] desc

----Question 6--- who are the most valuable customer, and what products or services did they typically purchase?

SELECT TOP 10 
     CUSTOMER_NAME,
	 SUM(SALES) AS TOTAL_CUSTOMER_SALES
FROM  [KMS Sql Case Study]
GROUP BY CUSTOMER_NAME
ORDER BY CUSTOMER_NAME, TOTAL_CUSTOMER_SALES DESC 

-----Question 7--- which small business customer have the hightest sales?
Select top 1
Customer_Name, Customer_segment,
SUM([Sales]) as [Total sales]
from [KMS Sql Case Study]
where Customer_Segment ='small business'
group by
Customer_Name, Customer_Segment order by [Total sales]desc

----Question 8--- which corperate customer placed the most number of orders in 2019-2012

SELECT TOP 1
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM 
    [KMS Sql Case Study]
WHERE 
    Customer_Segment = 'Corporate'
    AND Order_Date BETWEEN '2009-01-01' AND '2012-12-31'
GROUP BY 
    Customer_Name
ORDER BY 
    Total_Orders DESC;

---- Question 9--- Which consumer was the most profitable one?

SELECT TOP 1
    Customer_Name,
    SUM(Profit) AS Total_Profit
FROM 
     [KMS Sql Case Study]
WHERE 
    Customer_Segment = 'Consumer'
GROUP BY 
    Customer_Name
ORDER BY 
    Total_Profit DESC;
----Question 10--- which customer returned items, and what segement do they belong to?
SELECT Customer_Name, Customer_segment,[status]
from [KMS Sql Case Study]
join [dbo].[Order_status]
on [KMS Sql Case Study].Order_ID=[dbo].[Order_status].[order_ID]

select * from [KMS Sql Case Study]
SELECT * FROM [dbo].[Order_status]

SELECT COUNT (*)  AS returned_orders
from [dbo].[Order_status]
where status = 'returned'
GROUP BY CONSUMER_SEGMENT
ORDER BY
-----Count constomer_segment and number of return
SELECT 
    k.Customer_Segment,
    COUNT(*) AS Number_of_Returns
FROM [KMS Sql Case Study] k
JOIN order_status o ON k.order_id = o.order_id
WHERE o.status = 'Returned'
GROUP BY k.Customer_Segment
ORDER BY Number_of_Returns DESC;


SELECT 
    [KMS Sql Case Study].customer_name,
    [KMS Sql Case Study].Customer_Segment,
    [KMS Sql Case Study].Order_ID,
    o.status
FROM [KMS Sql Case Study]
JOIN 
    order_status o ON [KMS Sql Case Study].order_id = o.order_id
WHERE 
    o.status = 'Returned'
-----Question 10-----chat gpt
	SELECT DISTINCT
    k.customer_name,
    k.Customer_Segment
FROM [KMS Sql Case Study] k
JOIN order_status o ON k.order_id = o.order_id
WHERE o.status = 'Returned';

---Question 10
SELECT TOP 5
    k.customer_name,
    k.Customer_Segment,
    COUNT(*) AS Number_of_Returns
FROM [KMS Sql Case Study] k
JOIN order_status o ON k.order_id = o.order_id
WHERE o.status = 'Returned'
GROUP BY k.customer_name, k.Customer_Segment
ORDER BY Number_of_Returns DESC;

----Question 11---- If the delivery truck is the most economical but the lowest shipping method and express air is the fatest.
--but the most expensive one, did you think the company appropriately spent shipping costs based on the order priority

SELECT 
    Order_Priority,
    Ship_Mode,
    sum(Shipping_Cost)  AS Total_shipping_cost_for_priority,
    count(Order_ID) AS number_of_shipping_cost_for_priority_ship_mode
FROM 
    [KMS Sql Case Study]
GROUP BY 
    Order_Priority, Ship_Mode
ORDER BY 
    Order_Priority, Total_shipping_cost_for_priority Desc;