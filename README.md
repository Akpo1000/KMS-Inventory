# KMS-Inventory SQL Project 
## Project Overview 
Kultra Mega Stores (KMS), headquartered in Lagos, specialises in office supplies and large corporate clients (wholesale) across Lagos, Nigeria. 
## Data Source 
The primary dataset ysed jn this analysis is a CSV file tittled **KSM SQL case study.CSV**
## Tool  
+ SQL(SQL server) for Analysis 
## SQL Analysis 
Q1 Which product category had highest sales? 
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
