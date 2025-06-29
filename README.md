# 📈 AdWords Data Analysis Project

## 🔍 Overview
This is an end-to-end data analysis project focused on Google Ads (AdWords) keyword and website traffic data. It integrates multiple tools — **Excel**, **Python**, **SQL**, and **Power BI** — to cover the full data analysis lifecycle, from data collection and cleaning to database management and interactive dashboard creation.

The project simulates a real-world marketing analytics scenario where traffic and keyword performance are monitored and visualized to support data-driven decisions.

---

## 🧰 Tools & Technologies Used

- **Python (Jupyter Notebook)** – for initial data preparation, ID assignments, and CSV exports
- **Excel** – for lookup functions (e.g., VLOOKUP, SUMIFS), aggregations, and time-based feature engineering
- **SQL (MySQL)** – to structure data in relational tables using primary/foreign keys and run queries
- **Power BI** – to connect with the SQL database and create interactive dashboards using cards, line charts, and slicers

---

## 🔄 Workflow Breakdown

### 1. Python (Data Preprocessing)
- File used: `Traffic_Keyword.ipynb`
- Loaded raw CSV files and created intermediate tables (`keyword_table`, `search_volume ID`, `traffic ID`)
- Assigned unique `Keyword ID` values to ensure consistent mapping across datasets
- Exported cleaned and structured tables to CSV for Excel and SQL use

### 2. Excel (Data Cleaning & Enrichment)
- Files used: `keyword.csv`, `search_volume.csv`, `keyword_difficulty.csv`, `website_traffic_data.csv`
- Applied **VLOOKUP/XLOOKUP** to combine search volume and difficulty scores using `Keyword ID`
- Created calculated columns (e.g., Traffic %, Cost %)
- Used **SUMIFS** to group metrics (traffic, cost) by time and keywords
- Derived **Year** and **Quarter** columns from `Last Seen` date for time filtering in Power BI

### 3. SQL (Database Setup)
- File used: `Traffic Data SQL script.sql`
- Created `Traffic_project` database and relevant tables (`Keyword_table`, etc.)
- Defined appropriate **Primary Keys** (e.g., `Keyword_ID`) and **Foreign Keys**
- Populated database tables using enriched CSVs from Excel
- Verified data integrity and relationships for use in Power BI

### 4. Power BI (Visualization & Dashboard)
- File used: `Traffic Project dashboard.pbix`
- Connected SQL database to Power BI
- Built a dashboard using:
  - **Cards**: Show top-level KPIs like Total Traffic, Avg. Difficulty, Total Search Volume
  - **Line Chart**: Visualize traffic trends over time
  - **Slicers**: Filter by `Year`, `Quarter`, and `Keyword` dynamically
  - **Bar Charts**: Compare keyword performance, traffic cost, etc.

---

## 📁 Files Included

| File Name                        | Description                                                |
|----------------------------------|------------------------------------------------------------|
| `Traffic_Keyword.ipynb`         | Python script for keyword assignment & CSV creation        |
| `keyword.csv`                   | Keyword to ID mapping                                      |
| `search_volume.csv`             | Search volume data for keywords                           |
| `keyword_difficulty.csv`        | Keyword difficulty scores                                 |
| `website_traffic_data.csv`      | Core website traffic data                                 |
| `Traffic Data SQL script.sql`   | SQL script to create DB schema and tables                 |
| `Traffic Project dashboard.pbix`| Power BI report showing interactive visuals               |

---

## ▶️ How to Run

1. **Run Python Script**
   - Open `Traffic_Keyword.ipynb` in Jupyter Notebook
   - Execute all cells to generate structured keyword data and CSV outputs

2. **Clean Data in Excel**
   - Open CSV files in Excel
   - Use formulas to enrich, lookup, and aggregate data
   - Create new columns for Year and Quarter

3. **Setup SQL Database**
   - Use MySQL or any RDBMS to run `Traffic Data SQL script.sql`
   - Import cleaned Excel CSVs into corresponding SQL tables

4. **Build Dashboard in Power BI**
   - Open `Traffic Project dashboard.pbix`
   - Refresh the connection to your SQL DB
   - Explore dashboards using slicers and charts

---

## 📊 Dashboard Features

- **Cards:** Instant view of key metrics like Total Traffic, Avg. CPC, etc.
- **Slicers:** Filter by Year, Quarter, and Keyword for granular insights
- **Line Chart:** Shows how keyword traffic trends change over time
- **Comparative Views:** Bar charts to compare performance across keywords

---

## 📬 Contact

**Aditya Rajput**  
Aspiring Data Analyst | Excel | SQL | Power BI | Python  
📧 Connect via GitHub or [LinkedIn](#)  

---

