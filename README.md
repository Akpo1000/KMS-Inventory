# KMS-Inventory SQL Project 
## Project Overview 
Kultra Mega Stores (KMS), headquartered in Lagos, specialises in office supplies and large corporate clients (wholesale) across Lagos, Nigeria. 
## Data Source 
The primary dataset used in this analysis is a CSV file tittled **KSM SQL case study.CSV**
## Tool  
+ SQL(SQL server) for Analysis 
## SQL Analysis 
+ Q1 Which product category had highest sales? 
``` sql 
SELECT TOP 1 PRODUCT_CATEGORY,
SUM (SALES) AS TOTAL_SALES
FROM [KMS Sql Case Study]
GROUP BY Product_Category
ORDER BY TOTAL_SALES DESC
```
|product category|product Count|
|---------------|------------|
|Technology| 5,984,248.182|
+ Q2 What are the Top 🔝 3 and bottom 3 in terms of sales? 
```sql
SELECCT TOP 3 [REGION], SUM 
([SALES]) AS [TOTAL SALES] 
FROM [KMS SQL CASE STUDY1]
ORDER BY [PRODUCT COUNT] DESC 
``` 
|Region| Total Sales|
|-------------|------------|
|West| 359,754.2755|
|Ontario| 3,063,212.47956|
|Prarie| 2,837,304.60150|

Bottom 3 
```sql
SELECCT TOP 3 [REGION], SUM 
([SALES]) AS [TOTAL SALES] 
FROM [KMS SQL CASE STUDY1]
ORDER BY [PRODUCT COUNT] ASC
```

|Region| Total Sales|
|-------------|------------|
|Nunavut| 116,376.48356|
|Northwest Territories| 800,847.3295|
|Yukon| 975,867.3710|

+ Q3 What were the total sales of appliances in Ontario?
```sql
SELECT REGION, SUM (SALES) AS [TOTAL SALES]
FROM [KMS SQL CASE STUDY1]
WHERE REGION = 'ONTARIO'
GROUP BY REGION
```

|Region|Total Sales|
|-------|--------|
|Ontario|3,063,212.4795|

+ Q4 Advise the management of KMS on  what to do to increase the revenue from the bottom 10 customers
The bottom 10 customers
```sql
SELECT TOP 10
    Product_category, 
	Customer_Name,
    SUM(Sales) AS Total_Sales
 from [KMS Sql Case Study]
GROUP BY 
    Product_category, Customer_Name
ORDER BY 
    Total_Sales ASC;
```

|S/N|Product_Category|Customer Name|Total Sales|
|----|----------------|---------------|-------------|
|  1|  Furniture  | Anne McFarland  | 11.70     | 
|  2| Office Supplies |Tiffany House| 17.06    |   
|  3| Furniture |Toby Carlisle| 17.30    |
|  4| Office Supplies | Victor Price| 22.130  |
|  5| Furniture	|Emily Burns|22.740  |
|  6|Technology |Bradley Talbott |24.960 |
|  7| Furniture|Henry MacAllister |25.520 |
|  8| Technology |Amy Cox	  |25.960 |
|  9| Office Supplies|Deirdre Greer	 | 26.530 |
|  10|Office Supplies| Chris McAfee	 | 28.550 |

Base on the data presented and the analysis carried out, my recommendations are as followed;
* Cross-sell and Up-sell: This can be done through recommending and highlighting premium options inorder to instigate customers which will result in increased sales.

* Customer Experience: This focuses on understanding customer needs, resolving issues quickly and exceedingly satisfying customer expectations.

* Service Promotion: This focuses on providing incentives to increase sales. For instance, rewarding loyal customers over time instigates more demands from them. 

* Customer Retention: This focuses on sustaining/retaining existing customers by offering accessible or free, value-centred solution/products. 

* Combining Sales and Marketing: This focuses on ensuring that strategic marketing techniques are carried-out in alignment with well-defined/strategic goals of the sales team in order to satisfy the target audience.

Q5 KMS incurred the most shipping cost using which shipping method?
```sql
SELECT TOP 1 [SHIP_MODE], SUM([SHIPPING_COST]) AS [TOTAL SHIPPING COST]
FROM [KMS SQL CASE STUDY1]
GROUP BY SHIP_MODE
ORDER BY [TOTAL SHIPPING COST]DESC
```
|Ship Mode| Total Shipping Cost|
|--------|-------------------|
|Delivery Truck| 51971.940|

Q6 Who are the most valuable customers, and what products or services do they typically purchase?

```sql
SELECT TOP 10 
     CUSTOMER_NAME,
	 SUM(SALES) AS TOTAL_CUSTOMER_SALES
FROM  [KMS Sql Case Study]
GROUP BY CUSTOMER_NAME
ORDER BY CUSTOMER_NAME, TOTAL_CUSTOMER_SALES DESC 
```

|S/N|Customer Name|Total Sales|
|-----|---------------|-------------|
|1|  Aaron Bergman |11630.590 | 
|2|Aaron Hawkins|27690.72550 |   
|3| Aaron Smayling|8835.3235 |
|4|Adam Bellavance|11577.580|
|5|Adam Hart|26114.26450|
|6|Adam Shillingsburg |20059.67550|
|7|Adrian Barton|23088.5345|
|8|Adrian Hane |795.820 |
|9| Adrian Shami |4615.540|
|10| Aimee Bixby |2913.650|

Q7 which small business customer had the highest sales?

```sql
SELECT TOP 1 CUSTOMER_NAME, CUSTOMER_SEGMENT, SUME ([SALES]) AS [TOTAL SALES]
FROM [KMS SQL CASE STUDY]
WHERE CUSTOMER_SEGMENT = 'SMALL BUSINESS'
GROUP BY CUSTOMER_NAME,CUSTOMER_SEGMENT
ORDER BY [TOTAL SALES] DESC
```
|Customer_Name|Customer_Segment|Total Sales|
|-------------|----------------|-----------|
|Dennis Kane| Small Business| 75,967.590500

Q8 Which corperate customer placed the most number of order in 2019 - 2012
```sql
SELECT TOP 1
    CUSTOMER_NAME,
    COUNT(DISTINCT Order_ID) AS TOTAL_ORDERS
FROM 
    [KMS Sql Case Study]
WHERE 
    CUSTOMER_SEGMENT = 'CORPORATE'
    AND ORDER_DATE BETWEEN '2009-01-01' AND '2012-12-31'
GROUP BY 
   CUSTOMER_NAME
ORDER BY 
    TOTAL_ORDERS DESC;
```
|CUSTOMER_NAME|TOTAL ORDER|
|------------|-----------|
|Adam Hart|  18|

Q9 Which consumer was the most profitable one?
```sql
SELECT TOP 1
    CUSTOMER_NAME,
    SUM(PROFIT) AS TOTAL_PROFIT
FROM 
     [KMS Sql Case Study]
WHERE 
    CUSTOMER_SEGMENT= 'CONSUMER'
GROUP BY 
    CUSTOMER_NAME
ORDER BY 
    TOTAL_PROFIT DESC;
````
|CUSTOMER_NAME|TOTAL PROFIT|
|------------|-----------|
|Emily Phan| 34,005.4392|

Q10 Which customer returned items, and what segment do they belong to?
```sql
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
```
* Top 5 Returns
```sql
SELECT TOP 5
    k.customer_name,
    k.Customer_Segment,
    COUNT(*) AS Number_of_Returns
FROM [KMS Sql Case Study] k
JOIN order_status o ON k.order_id = o.order_id
WHERE o.status = 'Returned'
GROUP BY k.customer_name, k.Customer_Segment
ORDER BY Number_of_Returns DESC;
```

|Customer_Name|Customer_Segment| Number_of_Return|
|----------------|------------------|---------|
|Darren Budd|Consumer| 10|
|Erin Creighton|Corporate|10|
|Olvera Toch| Home Office| 8|
|Brad Thomas| Home Office|7|
|Helen Wasseman| Home Office|7|


* Count the number of returns by segment
```sql
SELECT 
    k.Customer_Segment,
    COUNT(*) AS Number_of_Returns
FROM [KMS Sql Case Study] k
JOIN order_status o ON k.order_id = o.order_id
WHERE o.status = 'Returned'
GROUP BY k.Customer_Segment
ORDER BY Number_of_Returns DESC;
```
|Customer_Segment| Number_of_Return|
|----------------|------------------|
|Corporate| 334|
|Home Office| 201|
|Small Business| 190|
Consumer|  147 |
|Total|872|

Q11 If the delivery truck is the most economical but the slowest shipping method ad Express Air is the fastest but the most expensive one, do you think the company approriately spent shipping costs based on the priority? Explain answer. 
```sql
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
```
|Order-Priority|Ship_Mode|Total_Shipping_Cost_For_Prority|Number_Of_Shipping_Cost_For_Priority_Ship_Mode|
|---------|-------|--------|--------|
|Critical|Delivery Truck|10,783.820|228|
|Critical|Regular Air|8,586.760|1180|
|Critical|Express Air|1,742.100|200|
|High|Delivery Truck|11,206.880|248|
|High|Regular Air|10,005.010|1308|
|High|Express Air|1,453.530|212|
|Low|Delivery Truck|11,131.610|250|
|Low|Regular Air|10,263.620|1280|
|Low|Express Air|1,551.630|190|
|Medium|Delivery Truck|9,461.630|205|
|Medium|Regular Air|9,418.720|1225|
|Medium|Express Air|1,633.590|201|
|Not Specified|Regular Air|9,734.080|1277|
|Not Specified|Delivery Truck|9,388.010|215|
|Not Specified|Express Air|1,470.060|180|

* Recommendation 

After analyzing the data, I discovered that high-cost shipping methods (e.g., Express Air) were frequently used for low-priority orders, while high-priority orders were more associated with delivery by Truck (resulting in delayed delivery despite urgency). This suggests inefficiency in operations or poor logistics/planning.
+ Recommendations 
- Implement a layered shipping guideline that aligns delivery mode with order priority.
- Introducing checks or an approval process for expensive methods can reduce unnecessary spending.
