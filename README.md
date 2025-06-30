# Adword-Data-Analysis

![Python Version](https://img.shields.io/badge/Python-3.9-blue)
![MySQL](https://img.shields.io/badge/Database-MySQL-informational)
![Power BI](https://img.shields.io/badge/Visualization-Power_BI-yellow)
![License](https://img.shields.io/badge/License-MIT-blue)

A complete, real-world AdWords Data Analysis pipeline from raw Excel to fully interactive dashboards using **Excel**, **Python (pandas)**, **MySQL**, and **Power BI**.

This project mimics an enterprise-level ETL (Extract, Transform, Load) and BI (Business Intelligence) solution, showcasing data cleaning, relational modeling, and dashboarding — ideal for both recruiters and students studying data analytics, BI, or SQL-based solutions.

---

## 📘 Table of Contents

- [🎯 Project Objective](#-project-objective)
- [📊 Tools & Technologies](#-tools--technologies)
- [🔁 End-to-End Workflow](#-end-to-end-workflow)
- [🧹 Excel + Python Processing](#-excel--python-processing)
- [🗃️ SQL Schema & Relationships](#️-sql-schema--relationships)
- [🧠 EER Diagram](#-eer-diagram)
- [📈 Power BI Dashboard](#-power-bi-dashboard)
- [⚙️ How to Use This Project](#️-how-to-use-this-project)
- [📂 Repository Structure](#-repository-structure)
- [📝 License](#-license)

---

## 🎯 Project Objective

This project analyzes Google AdWords traffic data with the goal of uncovering performance trends, keyword effectiveness, and cost dynamics. It simulates a **real-life advertising analytics pipeline**, commonly used in marketing and digital performance teams.

---

## 📊 Tools & Technologies

| Tool        | Purpose                                             |
|-------------|-----------------------------------------------------|
| Excel       | Initial data entry, manual formulas, CSV exports    |
| Python      | DataFrame manipulation, ID generation, CSV output   |
| MySQL       | Relational schema modeling & querying               |
| Power BI    | Data modeling, DAX metrics, visual analytics        |

---

## 🔁 End-to-End Workflow

```
Raw Excel (.xlsx)
   ↓
Python (assign IDs, transform, create CSVs)
   ↓
MySQL (schema creation, primary/foreign keys)
   ↓
Power BI (DAX, relationships, dashboard)
```

Each stage builds on the last. The result is a smooth, production-style pipeline from messy input to insights.

---

## 🧹 Excel + Python Processing

### ✅ Step 1: Raw Data (Raw_data.xlsx)
- Contains columns like `title`, `keyword`, `positions`, `traffic`, `CPC`, etc.
- This is the simulated export from Google AdWords.

### ✅ Step 2: Assigning Keyword IDs with Python
Using `pandas`, we:
- Loaded Excel using `pd.read_excel()`.
- Created unique `keyword_ID` values by mapping each keyword to a number.
- Example (conceptual):
  ```python
  df['keyword_ID'] = df['keyword'].astype('category').cat.codes
  ```

### ✅ Step 3: Splitting Clean Tables
Created three new CSVs:
- `keyword.csv`: Unique list of keywords + IDs.
- `search_volume.csv`: Total volume using `SUMIF`.
- `keyword_difficulty.csv`: Average difficulty using `AVERAGEIF`.

Also used this formula in Excel to flag difficulty:
```excel
=IF(B2>=50,"Hard","Moderate")
```

These CSVs form lookup/reference tables for later use in SQL.

---

## 🗃️ SQL Schema & Relationships

Created a MySQL database:  
```sql
CREATE DATABASE IF NOT EXISTS Traffic_project;
USE Traffic_project;
```

### 🔧 Main Table: `website_traffic_data`
This is the fact table containing AdWords metrics.

```sql
CREATE TABLE website_traffic_data (
    title VARCHAR(250) NOT NULL,
    keyword VARCHAR(250) NOT NULL,
    keyword_ID INT NOT NULL,
    positions INT NOT NULL,
    previous_positions INT NOT NULL,
    last_seen DATE NOT NULL,
    Search_Volume INT NOT NULL,
    CPC decimal(10,2) NOT NULL,
    Traffic INT NOT NULL,
    Traffic_Percent decimal(10,2) NOT NULL,
    Traffic_Cost int NOT NULL,
    Traffic_Cost_Percent decimal(10,2) NOT NULL,
    Competition decimal(10,2) NOT NULL,
    Number_of_Results INT NOT NULL,
    Keyword_difficulty INT NOT NULL
);
```

### 🔑 Keys & Normalization

We imported the other CSVs into MySQL:
- `keyword`
- `search_volume`
- `keyword_difficulty`

Then established relational integrity:
```sql
ALTER TABLE website_traffic_data
ADD FOREIGN KEY (keyword_ID) REFERENCES keyword(keyword_ID);
```

These keys ensure consistent data joins between tables.

---

## 🧠 EER Diagram

### 📘 Schema Screenshot
![Schema Screenshot](68159bd6-a58b-42e7-8934-b2809087d9e7.png)

### 📘 Relationship Diagram (EER)
![EER Diagram](0f2806fa-c76d-4052-81d0-ebf3f9c87ebc.png)

These diagrams visualize the 1-to-many relationships between:
- Keywords → Traffic Data
- Keyword Difficulty → Traffic Data
- Search Volume → Traffic Data

---

## 📈 Power BI Dashboard

Connected Power BI to MySQL database and created an interactive dashboard.

### 📌 Visual Elements
- **Cards**: Total Traffic, Search Volume, Cost, Results
- **Line Chart**: Traffic over time
- **Bar Chart**: Traffic by Keyword
- **Treemap**: Search Volume by Keyword
- **Pie/Donut**: Traffic by Difficulty, by Month
- **Slicers**: Year, Quarter, Keyword filter

### 🔢 DAX Measures
```DAX
Average CPC = AVERAGE(website_traffic_data[CPC])
Last Date = MAX('website_traffic_data'[last_seen])
Start Date = MIN('website_traffic_data'[last_seen])
Total Results = SUM(website_traffic_data[Number_of_Results])
Total Search Volume = SUM(website_traffic_data[Search_Volume])
Total Traffic = SUM('website_traffic_data'[Traffic])
Total Traffic Cost = SUM(website_traffic_data[Traffic_Cost])
Traffic Percent = AVERAGE(website_traffic_data[Traffic_Percent])

Calender = CALENDAR([Start Date],[Last Date])
Months = FORMAT(Calender[Date],"MMMM")
Quarter = QUARTER(Calender[Date])
Year = YEAR(Calender[Date])
Year and QTR = 'Calender'[Year] & " QTR " & 'Calender'[Quarter]
```

These enable filtering, aggregation, and time-based visualizations.

---

## ⚙️ How to Use This Project

### 🔹 1. Clone the Repo
```bash
git clone https://github.com/your-username/Adword-Data-Analysis.git
```

### 🔹 2. Open Excel Files
- View and understand `Raw_data.xlsx`, CSVs
- Optionally edit and export again using Excel formulas

### 🔹 3. Set Up MySQL
- Import all `.csv` using MySQL Workbench
- Use provided SQL schema to create and relate tables

### 🔹 4. Open Power BI Dashboard
- Use `Traffic Project dashboard.pbix` to view interactive report
- Or connect manually via: `Home → Get Data → MySQL`

---

## 📂 Repository Structure

```
├── Raw_data.xlsx
├── website_traffic_data.csv
├── keyword.csv
├── keyword_difficulty.csv
├── search_volume.csv
├── Traffic Data SQL script.sql
├── Traffic Project dashboard.pbix
├── 68159bd6...schema.png
├── 0f2806fa...eer_diagram.png
└── README.md
```

---

## 📝 License

This project is licensed under the **MIT License** — you are free to use, modify, and share with attribution.

---

> 📌 _If you're a recruiter: This demonstrates strong knowledge in data pipelines, transformation, relational modeling, and BI reporting._  
> 📌 _If you're a student: Feel free to use this structure to learn data integration and dashboarding step by step._
