# Bike Store Sales Analytics: End-to-End Data Solution

**From Raw Data to Business Insights: A Complete Analytics Pipeline**

This project demonstrates a full-cycle data analytics solution, starting from raw CSV files and building through a structured data warehouse, comprehensive SQL analysis, and interactive Power BI dashboards. The analysis addresses a critical business challenge: understanding and responding to significant sales decline after a period of strong growth.

---

## Project Background

A bike retail company operating from 2010 to early 2014 sells bikes, clothing, and accessories across multiple countries including the United States, Australia, United Kingdom, Germany, France, and Canada.

After experiencing strong growth and reaching peak sales performance in Q4 2013, the business faced an unexpected decline in early 2014. The company's leadership team needs to understand what drove this change and determine whether the business can recover and grow again.

**Key Business Questions:**
- Why did sales drop sharply in January 2014 after record performance in Q4 2013?
- What factors contributed to the exceptional Q4 2013 performance?
- Can the business recover and attract new customers to rebuild growth?
- What product and market strategies should guide future decisions?

---

## Project Architecture

This project follows a complete analytics workflow:

```
Raw CSV Data
     ↓
┌─────────────────────────┐
│   Bronze Layer          │  ← Raw data ingestion
│   (Staging Tables)      │
└─────────────────────────┘
     ↓
┌─────────────────────────┐
│   Silver Layer          │  ← Data cleaning & validation
│   (Cleaned Tables)      │
└─────────────────────────┘
     ↓
┌─────────────────────────┐
│   Gold Layer            │  ← Business-ready star schema
│   (Fact & Dimensions)   │
└─────────────────────────┘
     ↓
┌─────────────────────────┐
│   SQL Analysis          │  ← Exploratory analysis & views
│   (Analytical Queries)  │
└─────────────────────────┘
     ↓
┌─────────────────────────┐
│   Power BI Dashboard    │  ← Interactive visualizations
│   (Business Intelligence)│
└─────────────────────────┘
```

**Technologies Used:**
- SQL Server (Data Warehouse)
- T-SQL (ETL & Analysis)
- Power BI (Visualization & DAX)
- Git & GitHub (Version Control)

---

## Repository Structure

```
bike-store-analytics/
│
├── data/
│   ├── raw/                    # Original CSV files
│   └── documentation/          # Data dictionaries
│
├── sql/
│   ├── 01_warehouse/           # Data warehouse setup
│   │   ├── bronze_layer/
│   │   ├── silver_layer/
│   │   └── gold_layer/
│   │
│   ├── 02_exploration/         # Initial data exploration
│   │   ├── 01_database_exploration.sql
│   │   ├── 02_dimensions_exploration.sql
│   │   ├── 03_date_range_exploration.sql
│   │   └── 04_measures_exploration.sql
│   │
│   └── 03_analysis/            # Business analysis queries
│       ├── 01_magnitude_analysis.sql
│       ├── 02_ranking_analysis.sql
│       ├── 03_change_over_time_analysis.sql
│       ├── 04_cumulative_analysis.sql
│       ├── 05_performance_analysis.sql
│       ├── 06_data_segmentation.sql
│       ├── 07_part_to_whole_analysis.sql
│       ├── 08_report_customers.sql
│       └── 09_report_products.sql
│
├── powerbi/
│   └── bike_store_dashboard.pbix
│
└── README.md
```

---

## Data Structure

The source data consists of four tables with 108,127 total records:

**Orders Table:**
- `customer_id`, `id`, `purchase_ts`, `product_id`, `product_name`
- `currency`, `local_price`, `usd_price`, `purchase_platform`

**Customers Table:**
- `id`, `marketing_channel`, `account_creation_method`
- `country_code`, `loyalty_program`, `created_on`

**Geo_Lookup Table:**
- `country`, `region`

**Order_Status Table:**
- `order_id`, `purchase_ts`, `ship_ts`, `delivery_ts`, `refund_ts`

All quality checks and data profiling queries can be found in the [exploration scripts](https://github.com/Salah-Ah/bike-sales-analytics-project/tree/main/scripts/exploration).

---

## Phase 1: Data Warehouse Development

Built a three-layer medallion architecture implementing best practices for data warehousing:

### Bronze Layer (Staging)
- Raw data ingestion from CSV files
- Minimal transformation
- Preserves source system structure

### Silver Layer (Cleaned)
- Data type standardization
- Null handling and validation
- Data quality rules applied
- Business logic implementation

### Gold Layer (Star Schema)
**Fact Table:**
- `fact_sales`: Transactional sales data with foreign keys to dimensions

**Dimension Tables:**
- `dim_customers`: Customer demographics and segments
- `dim_products`: Product hierarchy (Category → Subcategory → Product)
- `dim_date`: Calendar dimension for time-based analysis
- `dim_geography`: Country and region information

**Analytical Views:**
- `report_customers`: Customer-level aggregations and KPIs
- `report_products`: Product-level performance metrics

[View Data Warehouse Repo](https://github.com/Salah-Ah/sql-data-warehouse-project)
It has the Documentation and details.

---

## Phase 2: SQL Exploratory Analysis

Conducted comprehensive exploratory analysis using advanced SQL techniques:

**Analysis Types Performed:**
- **Magnitude Analysis**: Distribution across dimensions (country, category, customer segments)
- **Ranking Analysis**: Top/bottom performers identification
- **Time-Series Analysis**: Trends, seasonality, and period-over-period changes
- **Cumulative Analysis**: Running totals and year-to-date calculations
- **Performance Analysis**: Benchmarking against averages
- **Segmentation Analysis**: Customer categorization (VIP, Regular, New)
- **Part-to-Whole Analysis**: Percentage contributions and proportions

**SQL Techniques Demonstrated:**
- Common Table Expressions (CTEs)
- Window Functions (RANK, ROW_NUMBER, LAG, LEAD)
- Advanced Aggregations
- Complex JOINs
- CASE statements for conditional logic
- Date calculations and time-based grouping

[View SQL Analysis Scripts](https://github.com/Salah-Ah/bike-sales-analytics-project/tree/main/scripts/analysis)

---

## Phase 3: Power BI Dashboard

Developed an interactive dashboard with multiple pages providing comprehensive business insights.

### Dashboard Overview
<img width="1469" height="858" alt="Overview" src="https://github.com/user-attachments/assets/a9153a80-ba9d-4ab5-9c1f-079442b904f0" />

**Key Metrics at a Glance:**
- **Total Sales**: $29.36M
- **Total Cost**: $17.67M
- **Total Profit**: $11.69M
- **Total Quantity Sold**: 60,400 units
- **Gross Margin**: 39.81%
- **ROI**: 66.13%

---

## Executive Summary

### Overview of Findings

The business experienced significant growth from 2010 through 2013, with sales peaking in December 2013 at $1.25M monthly revenue. However, January 2014 showed only $0.05M in sales, representing a sharp decline that raised concerns about business sustainability.

**Key Performance Trends:**
- Sales grew steadily from Q4 2010 ($1.42M quarterly) to Q4 2013 ($5.33M quarterly)
- Peak monthly performance: December 2013 with $1.25M revenue
- January 2014: Only $0.05M revenue (partial data - single month, not full quarter)
- Overall period generated $29.36M in sales with 39.81% gross margin

---

## Deep-Dive Insights

### Sales Performance Analysis
<img width="1472" height="787" alt="Sales Page" src="https://github.com/user-attachments/assets/1e98cb40-aef3-4537-b3db-85ee65a88caa" />


**Sales Distribution by Category:**
- **Bikes**: $28.32M (96.5% of total sales)
- **Accessories**: $0.70M (2.4%)
- **Clothing**: $0.34M (1.2%)

The business is heavily dependent on bike sales, with accessories and clothing representing minimal revenue contribution.

**Sales Growth Over Time:**
- Started at near-zero in Q4 2010
- Steady quarterly growth through 2011-2012
- Accelerated growth in 2013
- Q4 2013 peak: $5.33M (highest quarterly revenue)
- January 2014: $0.05M (dramatic drop)

**Customer Segmentation Performance:**
- **New Customers**: $11.09M (37.8% of sales)
- **VIP Customers**: $10.76M (36.6%)
- **Regular Customers**: $7.51M (25.6%)

The business relies heavily on new customer acquisition rather than repeat purchases, creating sustainability challenges.

**Geographic Distribution:**
- **United States**: $9.16M (31.2% of total sales)
- **Australia**: $9.06M (30.9%)
- **United Kingdom**: $3.39M (11.5%)
- **Germany**: $2.89M (9.8%)
- **France**: $2.64M (9.0%)
- **Canada**: $1.98M (6.7%)

Sales are concentrated in the US and Australia, representing over 60% of total revenue.

**Customer Demographics:**
- **Age 50+**: 66.45% of sales
- **Age 40-49**: 32.59%
- **Age 30-39**: 0.95%

The customer base is predominantly older adults (50+), indicating potential market saturation risk.

---

### Cost Performance Analysis
<img width="1456" height="827" alt="Cost Page" src="https://github.com/user-attachments/assets/fce3dc52-ba1f-4c02-977c-250d8918e8bd" />


**Cost Structure by Category:**
- **Bikes**: $17.21M (97.4% of total cost)
- **Accessories**: $0.26M (1.5%)
- **Clothing**: $0.20M (1.1%)

Cost structure mirrors sales distribution, with bikes dominating spending.

**Top 10 Products by Cost:**
All top 10 cost drivers are bike models (Mountain-200 and Road-150 series), with individual products costing between $0.64M and $0.78M.

**Geographic Cost & ROI Analysis:**
- **Australia**: $5.52M cost, 64.19% ROI
- **United States**: $5.45M cost, 65.52% ROI
- **United Kingdom**: $2.05M cost, 65.71% ROI
- **Germany**: $1.75M cost, 65.04% ROI
- **France**: $1.60M cost, 65.04% ROI
- **Canada**: $1.17M cost, 69.62% ROI

ROI is remarkably consistent across markets (64-70%), suggesting uniform pricing and cost strategies.

**Top Subcategories by Cost:**
- **Road Bikes**: $9.22M
- **Mountain Bikes**: $5.60M
- **Touring Bikes**: $2.39M

These three subcategories account for $17.21M of the $17.67M total cost.

---

### Profit Performance Analysis
<img width="1432" height="813" alt="Profit Page" src="https://github.com/user-attachments/assets/00943443-579b-41d6-95ef-77e197f5125c" />


**Profit Growth Trajectory:**
- Started at $0.02M in Q4 2010
- Grew to $0.81M by Q4 2011
- Reached $2.21M in Q4 2013 (peak profitability)
- Dropped to $0.03M in January 2014

**Geographic Profit Distribution:**
- **United States**: $3.72M (31.8%)
- **Australia**: $3.54M (30.3%)
- **United Kingdom**: $1.34M (11.5%)
- **Germany**: $1.15M (9.8%)
- **France**: $1.04M (8.9%)
- **Canada**: $0.81M (6.9%)

Profit distribution closely mirrors sales distribution, indicating consistent margins across markets.

**Profit by Customer Age Group:**
- **Age 50+**: 66.64% of total profit
- **Age 40-49**: 32.42%
- **Age 30-39**: 0.94%

Profitability is driven by older customer segments.

**Top 10 Products by Profit:**
The same bike models that generate highest costs also generate highest profits:
- Mountain-200 Black-46: $0.60M
- Mountain-200 Black-42: $0.59M
- Mountain-200 Silver-38: $0.58M
- Mountain-200 Silver-46: $0.57M

Top 10 products contribute approximately 40% of total profit.

---

## Key Findings Summary

### Business Concentration Risks

1. **Product Concentration**: 96.5% of sales come from bikes alone, creating extreme category dependence
2. **Customer Concentration**: Top 10 products generate 40% of sales
3. **Geographic Concentration**: US and Australia represent 62% of revenue
4. **Demographic Concentration**: 66% of customers are age 50+
5. **Customer Type Dependency**: 37.8% of sales from new customers indicates low repeat purchase rates

### Growth & Decline Pattern

- **Growth Phase (2010-2013)**: Consistent quarterly growth reaching $5.33M in Q4 2013
- **Decline Phase (January 2014)**: Sharp drop to $0.05M monthly revenue
- **Seasonal Pattern**: Strong Q4 performance (holiday season impact)

### Profitability Metrics

- **Gross Margin**: 39.81% (healthy for retail)
- **ROI**: 66.13% overall (consistent 64-70% across all markets)
- **Profit**: $11.69M over the period

---

## Recommendations

### ✅ 1. Reduce Product Concentration Risk
**Action:**
- Expand **accessories and apparel** tied directly to bike ownership (helmets, maintenance kits, apparel bundles).

**Why:**
- Low-cost add-ons increase basket size and stabilize revenue without changing the core product.

---

### ✅ 2. Strengthen Customer Retention
**Action:**
- Enhance the loyalty program with:
  - Maintenance discounts  
  - Service reminders  
  - Repeat-purchase incentives  

**Why:**
- Shifting even a small percentage from new to repeat customers reduces acquisition dependency.

---

### ✅ 3. Diversify Revenue Across Markets
**Action:**
- Prioritize targeted campaigns in **United Kingdom, Germany, and France**, where ROI is consistent but sales volume is lower.

**Why:**
- These markets show healthy margins and represent scalable growth opportunities.

---

### ✅ 4. Rebalance Product Portfolio
**Action:**
- Reduce reliance on top-performing SKUs by:
  - Promoting mid-tier models  
  - Introducing limited or seasonal variants  

**Why:**
- This smooths revenue volatility and improves inventory resilience.

---

### ✅ 5. Validate and Monitor the 2014 Decline
**Action:**
- Confirm data completeness for January 2014  
- Monitor Q1 seasonality trends year-over-year  
- Track marketing activity and inventory availability  

**Why:**
- Prevents reacting to incomplete or misleading performance signals.


---

## Technical Implementation

### Data Warehouse Layer
- **Architecture**: Medallion (Bronze → Silver → Gold)
- **Fact Table**: Transactional sales data
- **Dimensions**: Customers, Products, Geography, Date
- **Total Records**: 108,127 transactions

### SQL Analysis
- **Queries Written**: 30+ analytical queries
- **Views Created**: 2 business reporting views
- **Techniques**: CTEs, Window Functions, Complex Joins, Date Calculations

### Power BI Dashboard
- **Pages**: 4 analytical pages + 1 overview
- **DAX Measures Created**:
  - Total Sales, Total Cost, Profit
  - Gross Margin %, ROI
  - Category Change, Quarter Change
  - Previous Quarter Sales, YOY comparisons
  - Quarter Label
  - Waterfall calculations

- **Features Implemented**:
  - Interactive bookmarks for filtering (Year, Country, Subcategory)
  - Drill-through capabilities
  - Dynamic titles and labels
  - Custom tooltips
  - Cross-page filtering

### Calendar Table
Custom date dimension with:
- Date, DayName, DayOfWeek, IsWeekend
- Month, MonthName, Quarter, Quarter Num
- Year, YearQuarter

---

## Project Files

- **Power BI Dashboard**: [Download .pbix file](https://github.com/Salah-Ah/sql-exploratory-data-analysis-project/tree/main/Power%20BI%20file)
- **SQL Warehouse Scripts**: [View warehouse repository](https://github.com/Salah-Ah/sql-data-warehouse-project)
- **SQL Analysis Scripts**: [View analysis queries](https://github.com/Salah-Ah/bike-sales-analytics-project/tree/main/scripts)
- **Data Files**: Available in repository `/data` folder

---

## Key Learnings

This project demonstrates:

✅ **End-to-end data pipeline development** from raw data to business insights  
✅ **Data warehouse design** using medallion architecture  
✅ **Advanced SQL analysis** with complex queries and business logic  
✅ **Data modeling** with star schema design  
✅ **Business intelligence visualization** with Power BI  
✅ **DAX proficiency** for calculated measures and KPIs  
✅ **Business acumen** translating data into actionable recommendations  
✅ **Problem-solving approach** to real-world business challenges  

---

## Future Enhancements

- **Predictive Analytics**: Implement forecasting models for sales trends
- **Customer Lifetime Value**: Calculate CLV for customer segments
- **Cohort Analysis**: Track customer retention over time
- **Market Basket Analysis**: Identify product purchase patterns
- **Automated Reporting**: Schedule and distribute reports to stakeholders
- **Real-time Dashboard**: Connect to live data sources for current metrics

---

## 💫 About Me

Hi there! I'm **Salah Ahmed Mohamed Mohamed**, a **Data Analyst | Aspiring Data Engineer** passionate about transforming raw data into meaningful insights.

I specialize in building end-to-end data solutions using **SQL**, **Power BI**, **Excel**, and **statistical analysis**. My technical expertise spans advanced topics like DAX, M Code, data modeling, ETL pipelines, stored procedures, and data warehouse design. I'm particularly drawn to projects in **marketing**, **real estate**, and **supply chain** domains, where data-driven decisions create tangible business impact.

I believe in precision, continuous learning, and delivering work that bridges the gap between technical complexity and business value. Currently, I'm expanding my portfolio with diverse projects in data analytics and engineering—because the best way to learn is by building.

---

### 🔗 Let's Connect!

I'm always excited to connect with fellow data enthusiasts, recruiters, and professionals. Feel free to reach out!

- 💼 **LinkedIn**: [linkedin.com/in/salah-ahmed-](https://www.linkedin.com/in/salah-ahmed-/)
- 💻 **GitHub**: [github.com/Salah-Ah](https://github.com/Salah-Ah)
- 📧 **Email**: [salahahmedofficial99@gmail.com](mailto:salahahmedofficial99@gmail.com)
- 🌐 **Portfolio**: [insights-by-salah.lovable.app](https://insights-by-salah.lovable.app/)

### 📁 Related Projects

- 🏗️ **[Data Warehouse Project](https://github.com/Salah-Ah/sql-data-warehouse-project)** - The foundational warehouse this project builds upon
---

<div align="center">

**⭐ If you find this project helpful, please consider giving it a star! ⭐**

![Profile Picture](https://i.postimg.cc/dtXVJ8Qj/Recent_001.jpg)

*Built with curiosity and analytical rigor by Salah Ahmed*

</div>
