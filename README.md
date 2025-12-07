# SQL Exploratory Data Analysis Project

Welcome to the SQL Exploratory Data Analysis (EDA) Project!

This project builds on the [Data Warehouse (medallion architecture) Project](https://github.com/Salah-Ah/sql-data-warehouse-project) by performing thorough exploratory analysis and creating analytical views on the Gold layer tables. Through careful exploration and structured analysis, this project shows SQL techniques for uncovering insights and answering business questions.

---

## Project Overview

This project emphasizes data exploration and analytical reporting using SQL Server. It works with a fully modeled data warehouse (Bronze, Silver, Gold layers). The analysis explores the data structure and builds analytical views that address key business questions about customers, products, and sales performance.

**Key Objectives:**

- Understand the data warehouse structure and relationships
- Measure the data size and distribution
- Create reusable analytical views for business reporting
- Practice various analytical techniques, including segmentation, ranking, time-series, and cumulative analysis
- Prepare for future BI dashboard development

---

## Project Context

This project represents Phase 2 of a data analytics journey:

- **Phase 1**: [Data Warehouse Project](https://github.com/Salah-Ah/sql-data-warehouse-project) - Established the foundational data warehouse using Medallion Architecture
- **Phase 2**: Current Project - Exploratory analysis and view creation on the Gold layer
- **Phase 3** (Planned): Power BI integration for interactive dashboards and in-depth business insights

---

## Technologies & Techniques

**Tools:**
- SQL Server (Database Engine)
- SQL Server Management Studio (SSMS)
- T-SQL (Transact-SQL)

**SQL Techniques Demonstrated:**
- Common Table Expressions (CTEs)
- Window Functions (RANK, ROW_NUMBER, LAG/LEAD)
- Aggregate Functions (SUM, COUNT, AVG, MAX, MIN)
- Complex JOINs (INNER, LEFT)
- CASE statements for conditional logic
- Date calculations (DATEDIFF, date arithmetic)
- Subqueries
- VIEW creation for reusable queries
- GROUP BY with advanced grouping
- ORDER BY for result ranking

---

## Repository Structure

```
sql-exploratory-data-analysis-project/
│
├── datasets/                                    # Reference data (linked from warehouse project)
│
├── scripts/
│   ├── exploration/                            # Data exploration queries
│   │   ├── 00_init_database.sql               # Database initialization
│   │   ├── 01_database_exploration.sql        # Schema and table structure analysis
│   │   ├── 02_dimensions_exploration.sql      # Dimension table exploration
│   │   ├── 03_date_range_exploration.sql      # Date range and temporal coverage
│   │   └── 04_measures_exploration.sql        # Measure/metric exploration
│   │
│   └── analysis/                               # Analytical queries and views
│       ├── 01_magnitude_analysis.sql          # Data distribution and volume analysis
│       ├── 02_ranking_analysis.sql            # Top/bottom performers ranking
│       ├── 03_change_over_time_analysis.sql   # Temporal trends and patterns
│       ├── 04_cumulative_analysis.sql         # Running totals and cumulative metrics
│       ├── 05_performance_analysis.sql        # Performance comparison and benchmarking
│       ├── 06_data_segmentation.sql           # Categorical grouping and segmentation
│       ├── 07_part_to_whole_analysis.sql      # Proportion and percentage analysis
│       ├── 08_report_customers.sql            # Customer analytical view
│       └── 09_report_products.sql             # Product analytical view
│
├── README.md                                   # Project documentation (this file)
├── LICENSE                                     # MIT License
└── .gitignore                                  # Git ignore rules
```

---

## Phase 1: Exploration

The exploration phase lays a foundational understanding of the data warehouse structure, content, and relationships.

### 00. Database Initialization
**Purpose**: Set up the database context for exploration.

**Key Actions**:
- Connect to the data warehouse database
- Verify Gold layer schema and objects

**[View Script](https://github.com/Salah-Ah/sql-exploratory-data-analysis-project/blob/main/scripts/exploration/00_init_database.sql)**

---

### 01. Database Exploration
**Purpose**: Understand the overall database structure and schema organization.

**What We Explore**:
- Available schemas (gold, silver, bronze)
- Tables and views in each schema
- Object types and relationships
- Naming conventions

**Key Questions Answered**:
- What tables can we analyze?
- How are fact and dimension tables structured?
- What views exist in the Gold layer?

**[View Script](https://github.com/Salah-Ah/sql-exploratory-data-analysis-project/blob/main/scripts/exploration/01_database_exploration.sql)**

---

### 02. Dimensions Exploration
**Purpose**: Examine dimension tables to understand the available analytical attributes.

**What We Explore**:
- **Customer Dimension** (`gold.dim_customers`):
  - Customer demographics (age, gender, country)
  - Customer attributes and keys
  - Data quality (null values, completeness)
  
- **Product Dimension** (`gold.dim_products`):
  - Product categories and subcategories
  - Product attributes (cost, maintenance)
  - Product hierarchy

**Key Questions Answered**:
- What customer segments are there?
- How many products are in each category?
- What is the demographic distribution?

**[View Script](https://github.com/Salah-Ah/sql-exploratory-data-analysis-project/blob/main/scripts/exploration/02_dimensions_exploration.sql)**

---

### 03. Date Range Exploration
**Purpose**: Understand the data's temporal coverage.

**What We Explore**:
- Earliest and latest transaction dates
- Date gaps or missing periods
- Temporal distribution of data

**Key Questions Answered**:
- What time period does our data cover?
- Are there significant gaps?
- What is the granularity of our temporal data?

**[View Script](https://github.com/Salah-Ah/sql-exploratory-data-analysis-project/blob/main/scripts/exploration//03_date_range_exploration.sql)**

---

### 04. Measures Exploration
**Purpose**: Identify and understand the quantitative metrics available for analysis.

**What We Explore**:
- Key measures in the fact table (`gold.fact_sales`):
  - Sales amount
  - Quantity sold
  - Transaction counts
  
- Statistical properties:
  - Min, max, average values
  - Data ranges and outliers
  - Handling of null values

**Key Questions Answered**:
- What are typical order sizes?
- What is the range of sales values?
- Are there data quality issues with measures?

**[View Script](https://github.com/Salah-Ah/sql-exploratory-data-analysis-project/blob/main/scripts/exploration/04_measures_exploration.sql)**

---

## Phase 2: Analysis

The analysis phase builds on insights from exploration to create reusable analytical views and address specific business questions.

### 01. Magnitude Analysis
**Purpose**: Measure data and understand distribution across specific dimensions.

**Analysis Type**: Part-to-Whole / Distribution

**Key Analyses**:
- Total customers by country
- Total customers by gender
- Total products by category
- Average product costs by category
- Total revenue by category
- Total revenue by customer

**SQL Techniques Used**:
- `COUNT()`, `SUM()`, `AVG()` aggregate functions
- `GROUP BY` for dimensional grouping
- `ORDER BY` for ranking results
- `LEFT JOIN` to include dimension details

**Business Value**: Understand the size and distribution of customers, products, and revenue across key dimensions.

**[View Script](https://github.com/Salah-Ah/sql-exploratory-data-analysis-project/blob/main/scripts/analysis/01_magnitude_analysis.sql)**

---

### 02. Ranking Analysis
**Purpose**: Identify top and bottom performers across various metrics.

**Analysis Type**: Ranking / Performance Comparison

**Key Analyses**:
- Top customers by total revenue
- Top products by quantity sold
- Top categories by revenue
- Identification of bottom performers

**SQL Techniques Used**:
- `RANK()`, `ROW_NUMBER()` window functions
- `TOP N` queries
- Ordering and filtering for rankings

**Business Value**: Identify high-value customers and best-selling products for focused marketing and inventory management.

**[View Script](https://github.com/Salah-Ah/sql-exploratory-data-analysis-project/blob/main/scripts/analysis/02_ranking_analysis.sql)**

---

### 03. Change Over Time Analysis
**Purpose**: Analyze trends, patterns, and changes in data over time.

**Analysis Type**: Time-Series / Temporal Analysis

**Key Analyses**:
- Monthly sales trends
- Year-over-year growth rates
- Seasonal patterns
- Period-over-period comparisons

**SQL Techniques Used**:
- Date functions (`YEAR()`, `MONTH()`, `DATEDIFF()`)
- `LAG()`, `LEAD()` window functions for period comparisons
- Grouping by time periods
- Percentage change calculations

**Business Value**: Identify growth trends, seasonal patterns, and assist in forecasting.

**[View Script](https://github.com/Salah-Ah/sql-exploratory-data-analysis-project/blob/main/scripts/analysis/03_change_over_time_analysis.sql)**

---

### 04. Cumulative Analysis
**Purpose**: Calculate running totals and cumulative metrics over time.

**Analysis Type**: Cumulative / Running Total

**Key Analyses**:
- Running total of sales
- Cumulative revenue by date
- Year-to-date (YTD) calculations
- Progressive accumulation metrics

**SQL Techniques Used**:
- `SUM() OVER()` window function with frame clauses
- Ordered window frames
- Partition-based cumulative calculations

**Business Value**: Track progress toward goals, visualize growth, and monitor cumulative performance.

**[View Script](https://github.com/Salah-Ah/sql-exploratory-data-analysis-project/blob/main/scripts/analysis/04_cumulative_analysis.sql)**

---

### 05. Performance Analysis
**Purpose**: Compare performance across entities and identify differences from benchmarks.

**Analysis Type**: Comparative Performance / Benchmarking

**Key Analyses**:
- Product performance vs. category average
- Customer spending vs. segment average
- Performance variance identification
- Deviation from benchmarks

**SQL Techniques Used**:
- `AVG() OVER()` for calculating benchmarks
- Comparison logic with `CASE` statements
- Subqueries for reference calculations

**Business Value**: Identify overperformers and underperformers, set realistic targets, and highlight exceptional performance.

**[View Script](https://github.com/Salah-Ah/sql-exploratory-data-analysis-project/blob/main/scripts/analysis/05_performance_analysis.sql)**

---

### 06. Data Segmentation
**Purpose**: Group and categorize data into meaningful segments for targeted analysis.

**Analysis Type**: Segmentation / Categorization

**Key Analyses**:
- Customer segmentation (VIP, Regular, New)
- Age group categorization
- Product tier classification
- Geographic segmentation

**SQL Techniques Used**:
- `CASE` statements for conditional logic
- Custom segmentation rules
- Multi-level categorization

**Business Value**: Enable targeted marketing strategies, personalized customer experiences, and tailored product offerings.

**[View Script](https://github.com/Salah-Ah/sql-exploratory-data-analysis-project/blob/main/scripts/analysis/06_data_segmentation.sql)**

---

### 07. Part-to-Whole Analysis
**Purpose**: Calculate proportions and understand how parts contribute to the whole.

**Analysis Type**: Proportion / Percentage Contribution

**Key Analyses**:
- Category contribution to total revenue (%)
- Customer contribution to total sales (%)
- Geographic distribution percentages
- Product mix analysis

**SQL Techniques Used**:
- `SUM() OVER()` for total calculations
- Percentage calculations
- Ratio analysis

**Business Value**: Understand which segments drive the most value and inform resource allocation.

**[View Script](https://github.com/Salah-Ah/sql-exploratory-data-analysis-project/blob/main/scripts/analysis/07_part_to_whole_analysis.sql)**

---

### 08. Customer Report View
**Purpose**: Create a consolidated, reusable customer analytical view for reporting.

**View**: `gold.report_customers`

**What It Provides**:
- Customer demographic information (name, age, gender, country)
- Customer segmentation (VIP, Regular, New)
- Customer-level aggregations:
  - Total orders
  - Total sales
  - Total quantity purchased
  - Total products purchased
  - Lifespan (in months)
- Calculated KPIs:
  - Recency (months since last order)
  - Average order value (AOV)
  - Average monthly spend

**SQL Techniques Used**:
- CTEs for multi-step logic
- Complex `CASE` statements for segmentation
- Multiple joins across fact and dimension tables
- Aggregate functions with `GROUP BY`
- Date calculations for temporal metrics

**Business Value**: A single source of truth for customer analytics, ready for BI tools and reporting.

**[View Script](https://github.com/Salah-Ah/sql-exploratory-data-analysis-project/blob/main/scripts/analysis/08_report_customers.sql)**

---

### 09. Product Report View
**Purpose**: Create a consolidated, reusable product analytical view for reporting.

**View**: `gold.report_products`

**What It Provides**:
- Product information (name, category, subcategory, cost)
- Product-level aggregations:
  - Total orders containing the product
  - Total quantity sold
  - Total revenue generated
- Calculated KPIs:
  - Average selling price
  - Profit margin
  - Revenue contribution (%)

**SQL Techniques Used**:
- CTEs for query structure
- Joins across fact and dimension tables
- Aggregate calculations
- Profit and margin calculations
- Percentage contribution calculations

**Business Value**: Comprehensive product performance metrics for inventory management, pricing strategies, and product development.

**[View Script](https://github.com/Salah-Ah/sql-exploratory-data-analysis-project/blob/main/scripts/analysis/09_report_products.sql)**

---

## Analytical Methodology

This project follows a clear approach to exploratory data analysis and reporting:

1. **Understand the Data Structure** (Exploration Phase)
   - Identify tables, schemas, and relationships
   - Examine dimension attributes
   - Assess temporal coverage
   - Explore available measures

2. **Ask Business Questions** (Analysis Planning)
   - What patterns are in the data?
   - Who are our most valuable customers?
   - Which products generate the most revenue?
   - How do metrics change over time?

3. **Apply Analytical Techniques** (Analysis Execution)
   - Use suitable SQL techniques for each analysis type
   - Build incrementally from simple to complex queries
   - Document assumptions and business logic

4. **Create Reusable Views** (Reporting Layer)
   - Consolidate complex logic into views
   - Provide clean interfaces for BI tools
   - Enable self-service analytics

5. **Validate and Iterate** (Quality Assurance)
   - Verify calculations against business rules
   - Check for edge cases and null handling
   - Refine based on feedback

---

## Getting Started

### Prerequisites

- SQL Server (Express or Developer Edition)
- SQL Server Management Studio (SSMS)
- Completed [Data Warehouse Project](https://github.com/Salah-Ah/sql-data-warehouse-project) with Gold layer populated

### How to Use This Project

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Salah-Ah/sql-exploratory-data-analysis-project.git
   ```

2. **Connect to Your Data Warehouse**
   - Open SSMS and connect to your SQL Server instance
   - Ensure your data warehouse database is accessible

3. **Run Exploration Scripts**
   - Start with `00_init_database.sql` to set the context
   - Run exploration scripts (01-04) to understand the data
   - Review results to familiarize yourself with the data

4. **Execute Analysis Scripts**
   - Run analysis scripts (01-09) in order
   - Each script operates independently and can be run separately
   - Review the VIEW definitions created

5. **Query the Analytical Views**
   - Use `gold.report_customers` and `gold.report_products` in your queries
   - Build further analyses on top of these views
   - Export results for reports or BI tools

---

## Learning Outcomes

By completing this project, you will show proficiency in:

- **Exploratory Data Analysis**: Systematically understanding data structure, content, and quality
- **SQL Mastery**: Advanced query techniques, including CTEs, window functions, and complex joins
- **Analytical Thinking**: Selecting suitable analytical techniques for business questions
- **View Design**: Creating reusable, maintainable analytical views
- **Business Acumen**: Translating analysis into business insights
- **Documentation**: Clear commenting and well-organized queries
---

## 🔮 Future Enhancements

**Phase 3 - Power BI Integration** (Planned):
- Connect Power BI to the analytical views
- Build interactive dashboards for customer and product analytics
- Create visual storytelling with insights
- Implement drill-through and filtering capabilities
- Share reports with stakeholders

**Additional Analysis Ideas**:
- Cohort analysis (customer retention over time)
- RFM (Recency, Frequency, Monetary) segmentation
- Market basket analysis (products purchased together)
- Customer lifetime value (CLV) prediction
- Advanced time-series forecasting

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
- 📊 **Power BI Dashboard Project** (Coming Soon) - Interactive visualizations of these analyses

---

<div align="center">

**⭐ If you find this project helpful, please consider giving it a star! ⭐**

![Profile Picture](https://i.postimg.cc/dtXVJ8Qj/Recent_001.jpg)

*Built with curiosity and analytical rigor by Salah Ahmed*

</div>
