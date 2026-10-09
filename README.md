# E-Commerce Sales & Profitability Analysis

## Project Overview

This project analyzes sales and profitability for an e-commerce business to evaluate overall business performance and identify opportunities for improvement.

SQL was used for data analysis and business-focused queries, while Power BI was used for data cleaning, data modeling, DAX measures, and interactive dashboard development.

---

## Business Problem

The objective of this project is to analyze sales, profitability, customers, products, regions, segments, discounts, and shipping performance.

The analysis aims to answer questions such as:

- Which categories and products generate the highest sales?
- Which categories and products generate the highest profit?
- Which regions and customer segments perform best?
- Which products are generating losses?
- How are discounts associated with profitability?
- Which category has the strongest and weakest profit margin?
- How long does each shipping mode take on average?

---

## Tools & Technologies

- PostgreSQL
- SQL
- Power BI
- DAX
- Power Query
- Excel
- GitHub

---

## Dataset

The cleaned dataset contains:

- 10,194 rows
- 24 columns

Key fields include:

- Order Date
- Ship Date
- Ship Mode
- Customer
- Segment
- Region
- Category
- Sub-Category
- Product
- Sales
- Quantity
- Discount
- Profit
- Shipping Days

---

## Data Preparation

The data was prepared before analysis by:

- Checking for duplicate records
- Checking missing values
- Validating date fields
- Validating numerical columns
- Retaining negative profit values for profitability analysis
- Creating shipping duration
- Creating order year and order month fields
- Preparing the data for SQL and Power BI analysis

---

## SQL Analysis

A total of 45 SQL analysis queries were created to investigate the business performance.

The analysis included:

- Total sales
- Total profit
- Total quantity
- Number of orders
- Number of customers
- Average sales and profit
- Sales and profit by category
- Sales and profit by region
- Sales and profit by customer segment
- Top and bottom products
- Top customers
- Profitability classification
- Profit margin analysis
- Discount analysis
- Top 3 products by category and region
- Monthly sales and profit
- Month-over-month sales growth
- Cumulative sales
- Product ranking
- Customer revenue contribution
- Loss-making products
- Loss-making states

See the complete SQL queries in:

**[SQL Analysis](sql/ecommerce_analysis.sql)** — 45 SQL queries covering business metrics, product and customer analysis, profitability, discounts, rankings, and monthly trends.

---

## Power BI Data Model

A dedicated Date table was created and connected to the Orders table using the Order Date field.

The model was used to support:

- Time-based analysis
- Year-over-year analysis
- Year-to-date calculations
- Monthly trends
- Interactive filtering

### Key DAX Measures

Some of the main measures created include:

- Total Sales
- Total Profit
- Total Orders
- Total Customers
- Total Quantity
- Profit Margin %
- Sales YTD
- Sales LY
- Sales YoY %
- Profit YTD
- Profit LY
- Profit YoY %
- Average Order Value
- Average Discount %
- Average Shipping Days

---

## Power BI Dashboard

The dashboard contains two pages.

### 1. Executive Overview

The Executive Overview provides a high-level view of business performance.

It includes:

- Total Sales
- Total Profit
- Profit Margin
- Total Orders
- Average Order Value
- Monthly Sales and Profit
- Profit by Region
- Sales by Category
- Sales by Segment
- Interactive filters for Year, Region, Category, and Segment

**[Executive Overview](dashboard/executive_overview.png)** — High-level sales and profitability performance.

---

### 2. Profitability & Operations

This page provides a deeper analysis of profitability and operational performance.

It includes:

- Sales and Profit by Discount
- Top 10 Products by Sales
- Bottom 10 Products by Profit
- Average Shipping Days by Ship Mode
- Profit by Segment
- Profit Margin by Category
- Interactive filters for Year, Region, Category, and Segment

**[Profitability & Operations](dashboard/profitability_operations.png)**  — Detailed profitability and operational analysis.

---

# Business Insights

### 1. Technology Performance

Technology generates the highest sales at approximately $0.84M and has the highest profit margin at 17.45%.

**Recommendation:** Continue investing in profitable Technology products while monitoring their pricing and discount strategies.

### 2. Regional Performance

The West region generates the highest profit at approximately $111K.

**Recommendation:** Analyze the products and sales strategies contributing to the strong performance of the West region and consider applying relevant practices to other regions.

### 3. Customer Segment Performance

The Consumer segment generates the highest sales at approximately $1.17M and profit at approximately $136K.

**Recommendation:** Review pricing, discounting, and product mix in the Consumer segment to identify opportunities to improve profitability.

### 4. Discount and Profitability

Lower discount levels are associated with positive profit, while higher discount levels are associated with losses.

**Recommendation:** Review discounting strategies and reduce excessive discounts where they are associated with negative profit.

### 5. Loss-Making Products

Several products appear among the bottom-performing products by profit, with some generating substantial losses.

**Recommendation:** Review pricing, discounts, and costs for loss-making products before considering discontinuation.

### 6. Furniture Profitability

Furniture has the lowest profit margin at 2.61%.

**Recommendation:** Review Furniture pricing and discount strategies and identify opportunities to reduce costs.

### 7. Shipping Performance

Standard Class has the longest average shipping time at approximately 5 days.

**Recommendation:** Review Standard Class shipping performance and identify opportunities to reduce delivery time and improve customer service.

---

# Key Takeaways

The analysis shows that strong sales do not always translate into strong profitability.

Technology demonstrates strong profitability, while Furniture requires further investigation due to its low profit margin. The analysis also indicates an association between higher discounts and lower profitability.

The dashboard provides an interactive way for business stakeholders to explore sales, profitability, product, regional, customer segment, discount, and operational performance.

---

## Project Files

- `sql/ecommerce_analysis.sql` - SQL analysis queries
- `dashboard/executive_overview.png` - Executive Overview dashboard
- `dashboard/profitability_operations.png` - Profitability & Operations dashboard
- `powerbi/ecommerce_sales_profitability.pbix` - Power BI report
- `data/Orders_cleaned.csv` - Cleaned dataset, if permitted for distribution

---

## Skills Demonstrated

- SQL querying
- Aggregations and GROUP BY
- Window functions
- Ranking
- Date/time analysis
- CASE statements
- Profitability analysis
- Data cleaning
- Data modeling
- Star schema concepts
- DAX measures
- Time intelligence
- Power BI dashboard development
- Business insights
- Data-driven recommendations

