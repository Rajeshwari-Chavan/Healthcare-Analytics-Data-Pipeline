# 🩺 End-to-End Healthcare Analytics & Data Pipeline

## 📌 Project Overview
In this project, I built an end-to-end data pipeline starting from a transactional healthcare database all the way to an executive-level dashboard. The main goal of this solution is to help hospital management quickly identify operational bottlenecks (such as appointment no-shows) and track financial trends (insurance and billing distributions) at a glance.

To keep the data clean and ensure the dashboard loads fast, I divided the entire workflow into three distinct stages.

---

## ⚙️ How I Built This Project (Step-by-Step)

### 🗄️ Stage 1: Data Setup & Extraction (SQL)
First, I analyzed the relational structure of the healthcare database and wrote SQL scripts to pull data from key tables including Patients, Doctors, Appointments, Billing, and Treatments.
* **What I did:** I set up table schemas and wrote clean queries to extract the necessary columns with correct joins so the data was perfectly structured for analysis.
* *Folder Location:* `/Data-Extraction-SQL/`

### 🐍 Stage 2: Data Cleaning & Preprocessing (Python)
Since raw healthcare data often contains missing values and inconsistent formatting, I used Python within Google Colab to clean the dataset.
* **What I did:** Using the `pandas` library, I handled missing fields, standardized data types, and cleaned up whitespace or duplicate issues in doctor names to prevent data clustering errors during analysis.
* *Folder Location:* `/Data-Cleaning-Python/`

### 📊 Stage 3: Data Modeling & 3-Page Dashboard (Power BI)
After importing the cleaned data into Power BI, I established a robust data model between the tables and wrote 100% explicit DAX measures (avoiding default implicit columns). I broke the dashboard down into three strategic pages:

1. **Clinical & Operations Overview:** Tracks general patient load, top-demanding medical departments, and appointment statuses (Completed, Scheduled, No-shows).
2. **Financial & Insurance Performance:** Displays total revenue, average bill sizing, payment channels (using a Treemap visual), and the revenue contribution of top insurance providers like MedCare Plus.

* *Folder Location:* `/PowerBI-Dashboard/`

---

## 🛠️ Tools & Tech Used
* **SQL:** For backend database querying and relational data mapping.
* **Python (Google Colab):** Utilizing Pandas and Numpy for ETL and data cleansing.
* **Power BI:** For custom UI/UX design, relational data modeling, and DAX calculations.

---

## 📅 Data Source
* **Dataset Used:** The raw healthcare datasets were sourced from Kaggle. You can access the original dataset here: [Kaggle Healthcare Dataset Link](https://www.kaggle.com/datasets/kanakbaghel/hospital-management-dataset)

---

## 📷 Dashboard Previews

<img width="1212" height="771" alt="dashboard1" src="https://github.com/user-attachments/assets/2cc05bed-cf5b-4de1-a767-57eb74bfa604" />

<img width="1125" height="797" alt="dashboard2" src="https://github.com/user-attachments/assets/4f0bb206-55f1-4b37-8779-9cfc25e711ab" />


