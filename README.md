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
|West| 359754.2755|
|Ontario| 3063212.47956|
|Prarie| 2837304.60150|

Bottom 3 
```sql
SELECCT TOP 3 [REGION], SUM 
([SALES]) AS [TOTAL SALES] 
FROM [KMS SQL CASE STUDY1]
ORDER BY [PRODUCT COUNT] ASC
```

|Region| Total Sales|
|-------------|------------|
|Nunavut| 116376.48356|
|Northwest Territories| 800847.3295|
|Yukon| 975867.3710|

+ Q3 What were the total sales of appliances in Ontario?
```sql
SELECT REGION, SUM (SALES) AS [TOTAL SALES]
FROM [KMS SQL CASE STUDY1]
WHERE REGION = 'ONTARIO'
GROUP BY REGION
```

|Region|Total Sales|
|-------|--------|
|Ontario|3063212.4795|

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
SELECT [CUSTOMER_NAME], PRODUCT_NAME, SUM(SALES) AS [TOTAL SALES]
FROM [KMS SQL CASE STUDY1]
GROUP BY CUSTOMER_NAME, PRODUCT_NAME
ORDER BY [TOTAL SALES] DESC
```

