# SQL Job Market Analysis – Data Analyst Jobs

## 📌 Project Overview

This project analyzes a Data Analyst job postings dataset using SQL to identify:

- Top-paying Data Analyst jobs
- Companies offering the highest salaries
- Most in-demand technical skills
- Skills required for top-paying remote Data Analyst positions

The project demonstrates SQL concepts such as **JOINs, filtering, aggregation, sorting, and data exploration**.

---

## 📂 Database Tables

The analysis uses the following tables:

| Table | Description |
|--------|-------------|
| `job_postings_fact` | Contains job posting information including salary, location, company, and job details |
| `company_dim` | Contains company names and company IDs |
| `skills_job_dim` | Bridge table connecting jobs with required skills |
| `skills_dim` | Contains skill IDs and skill names |

---

## 🛠 SQL Concepts Used

- SELECT
- WHERE
- LEFT JOIN
- GROUP BY
- ORDER BY
- COUNT()
- LIMIT
- Aggregate Functions
- Data Filtering

---

# Project Queries

## 1. Top 10 Highest Paying Data Analyst Jobs

### Objective

Identify the highest-paying Data Analyst jobs with available salary information.

### Query Features

- Filters only Data Analyst roles
- Removes NULL salaries
- Joins company information
- Orders by highest annual salary
- Returns Top 10 jobs

---

## 2. Top 10 Highest Paying Remote Data Analyst Jobs

### Objective

Find the highest-paying remote Data Analyst jobs.

### Filters Applied

- Job Title = Data Analyst
- Salary is available
- Job Location = Anywhere (Remote)

---

## 3. Most In-Demand Skills

### Objective

Identify the most frequently requested skills across all job postings.

### Query

- Joins job postings with skill tables
- Counts occurrences of every skill
- Returns the Top 5 most demanded skills

---

## 4. Skills Required for Top Paying Remote Jobs

### Objective

Determine which technical skills are required for the highest-paying remote Data Analyst jobs.

### Query Features

- Multiple LEFT JOINs
- Company names included
- Skill IDs mapped to skill names
- Ordered by salary

---

# Key Findings

## Highest Paying Jobs

Some of the highest-paying remote Data Analyst positions include:

| Company | Job Title | Salary |
|---------|-----------|---------|
| Mantys | Data Analyst | \$650,000 |
| Meta | Director of Analytics | \$336,500 |
| AT&T | Associate Director – Data Insights | \$255,829.50 |

---

## Skills Found in Top Paying Jobs

The following skills were identified:

- SQL
- Python
- R
- Azure
- Databricks
- AWS
- Pandas
- PySpark

---

## Dataset Insights

After analyzing the results:

- 10 records were returned
- 8 records contained valid skills
- 2 records had missing skill information
- 8 unique skills were identified
- Every listed skill appeared only once in the filtered dataset

Because the dataset only contained skills from **3 unique job postings**, it is too small to determine statistically significant demand among the highest-paying jobs.

---

# Sample SQL Skills Demonstrated

✔ Data Exploration

✔ Data Cleaning

✔ Multi-table Joins

✔ Aggregation

✔ Filtering

✔ Sorting

✔ Salary Analysis

✔ Skill Analysis

---

# Future Improvements

Potential extensions to this project include:

- Analyze salary by country
- Compare remote vs onsite salaries
- Identify highest-paying companies
- Analyze skills by salary range
- Calculate average salary by job title
- Build dashboards using Power BI or Tableau
- Create SQL views for reusable analysis

---

# Tools Used

- SQL
- PostgreSQL
- Job Market Dataset
- GitHub

---

# Author

**Jigar Shah**

Aspiring Data Analyst | SQL | Power BI | Python | Excel


## Project Goal

This project demonstrates practical SQL skills for real-world job market analysis and showcases the ability to extract meaningful business insights from relational databases.
