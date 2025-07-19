# Zepto Inventory Analysis

This project involves SQL-based analysis of inventory data inspired by Zepto, focusing on deriving meaningful business insights from raw product-level data. The dataset includes product names, pricing, stock status, weight, discount metrics, and more.

## 📌 Objective

To perform structured data exploration and analysis using SQL to uncover trends and patterns in inventory, pricing strategies, product availability, and category-based revenue.

## 🛠️ Tools & Technologies

- **SQL** (MySQL syntax)
- **Relational Database Concepts**
- **Data Cleaning & Transformation**

## 🔍 Key Analyses Performed

- Null value detection and removal
- Duplicate product identification
- Stock status grouping (in stock vs out of stock)
- High MRP out-of-stock products
- Category-wise revenue calculation
- Price-per-gram value analysis
- Discount-based best value product ranking
- Product weight classification (Low / Medium / Bulk)

## 🧹 Data Cleaning Steps

- Removed rows with null or zero values in key columns
- Converted pricing from paise to rupees
- Deduplicated SKU entries
- Handled inconsistent formats in weight and stock data

## 📈 Insights

- Identified top discounted products
- Found categories generating the highest revenue
- Analyzed pricing patterns for bulk vs low-weight products
- Classified inventory for strategic stocking


## ✅ How to Use

1. Import the dataset into your MySQL environment.
2. Execute the queries in `Trend_Analysis.sql` sequentially.
3. Modify queries as needed for advanced analysis or visualizations.

## 📄 License

This project is for educational purposes only and is not affiliated with Zepto. Dataset is either mock or publicly available.

## 👨‍💻 Author

**Prakhar Tripathi**  



