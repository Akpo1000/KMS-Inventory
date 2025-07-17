# KMS-Inventory SQL Project 
## Project Overview 
Kultra Mega Stores (KMS), headquartered in Lagos, specialises in office supplies and large corporate clients (wholesale) across Lagos, Nigeria. 
## Data Source 
The primary dataset ysed jn this analysis is a CSV file tittled **KSM SQL case study.CSV**
## Tool  
+ SQL(SQL server) for Analysis 
## SQL Analysis 
+ Q1 Which product category had highest sales? 
``` sql 
-- select top 1 
[Product_Category],count
 ([Product_Category])as
 [Product Count] 
from [KMS Sql Case Study1]
group by Product_Category
order by [Product Count] desc
```
|product category|product Count|
|---------------|------------|
|Office Supplies| 4610|
+ Q2 What are the Top 🔝 3 and bottom 3 in terms of sales? 
```sql
--select top 3 [Region], sum
([sales]) as [Total Sales]
from [KMS Sql Case Study1]
Order by [Product Count] desc
``` 
|Region| Total Sales|
|-------------|------------|
|West| 359754.2755|
|Ontario| 3063212.47956|
|Prarie| 2837304.60150|

Bottom 3 

|Region| Total Sales|
|-------------|------------|
|Nunavut| 116376.48356|
|Northwest Territories| 800847.3295|
|Yukon| 975867.3710|

+ Q3 What were the total sales of appliances in Ontario?
  
|Region| Total Sales|
|------------|----------|
|Ontario| 3063212.4795|
