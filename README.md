# 🚆 UK Train Rides Analysis
### Passenger Behavior, Revenue Performance & Train Delay Insights

![Project Dashboard](A_modern_data_analytics_scene_showing_uk_train_tra_delpmaspu.png)

---

## 👥 Project Team

| Name | Role |
|-----|-----|
| Dina Ezzat | Instructor |
| Mohamed Omar | Data Analysis |
| Kerols Raafat | Data Analysis |
| Joseph Milad | Data Analysis |
| Yahya Ebrahim | Data Analysis |
| Ahmed Reda | Data Analysis |
| Ahmed Elsayed | Data Analysis |

---

## 📌 Project Description

This project analyzes UK railway ticket sales and journey performance to uncover valuable insights related to passenger behavior, ticket revenue, and train operational efficiency.

The dataset contains detailed information about railway journeys, including ticket purchase details, departure and arrival stations, travel times, ticket types, ticket classes, payment methods, journey status, delays, and refund requests.

The main objective of this project is to apply data analysis techniques to understand travel demand patterns, evaluate revenue distribution, analyze train delay patterns, and assess overall railway service performance.

The project involves several stages including **data cleaning, exploratory data analysis (EDA), KPI calculation, and data visualization**. Through these steps, the analysis highlights key insights about passenger trends, operational delays, and ticket revenue performance.

The final results are presented through **visualizations and an interactive dashboard**, providing a clear and data-driven overview of railway operations and passenger travel patterns.

---

## ✨ Project Features

- Data Cleaning and preprocessing  
- Handling missing values and duplicate records  
- Exploratory Data Analysis (EDA)  
- Passenger demand analysis across stations and routes  
- Train delay analysis and operational performance evaluation  
- Ticket sales and revenue analysis  
- Customer purchase behavior analysis (payment methods, ticket types)  
- Data visualization and dashboard creation  

---

## 📂 Dataset Description

The dataset contains information about train journeys and ticket transactions.  
Each row represents **a single passenger ticket purchase**.

### Dataset Columns Explanation

| Column | Description |
|------|-------------|
| Transaction ID | Unique identifier assigned to each ticket purchase |
| Date of Purchase | Date when the passenger purchased the ticket |
| Time of Purchase | Time when the ticket purchase occurred |
| Purchase Type | Indicates whether the ticket was purchased online or at a station |
| Payment Method | Method used to pay for the ticket |
| Railcard | Discount card used for reduced ticket prices |
| Ticket Class | Travel class such as Standard or First Class |
| Ticket Type | Type of ticket such as Single or Return |
| Price | Ticket price paid by the passenger |
| Departure Station | Station where the journey begins |
| Arrival Destination | Destination station |
| Date of Journey | The date when the journey takes place |
| Departure Time | Scheduled train departure time |
| Arrival Time | Scheduled train arrival time |
| Actual Arrival Time | Actual arrival time of the train |
| Journey Status | On Time, Delayed, or Cancelled |
| Reason for Delay | Reason for delay such as weather or technical issues |
| Refund Request | Indicates whether the passenger requested a refund |

---

## 🛠 Tools & Technologies Used

- **Python**
- **Pandas** – data manipulation and cleaning  
- **NumPy** – numerical computations  
- **Matplotlib** – data visualization  
- **Seaborn** – statistical visualization  
- **Jupyter Notebook** – development environment  
- **Power BI** – interactive dashboard creation  

---

## 📊 Key Performance Indicators (KPIs)

- **Total Revenue** – Total revenue generated from ticket sales  
- **Total Passengers** – Total number of passengers  
- **Average Ticket Price** – Average cost of tickets  
- **Delay Rate** – Percentage of delayed journeys  
- **On-Time Performance** – Percentage of trains arriving on schedule  
- **Refund Requests** – Number of refund requests due to delays or cancellations  

---

## 📂 Project Structure

```bash
UK-Train-Rides-Analysis
│
├── data
│   └── railway.csv
│
├── notebooks
│   └── data_analysis.ipynb
│
├── dashboard
│   └── powerbi_dashboard.pbix
│
├── images
│   └── dashboard.png
│
└── README.md
```

### File Explanation

- **data/** → Contains the dataset used for analysis  
- **notebooks/** → Contains the Jupyter Notebook used for data analysis  
- **dashboard/** → Contains the Power BI dashboard file  
- **images/** → Contains project images and dashboard screenshots  
- **README.md** → Documentation describing the project
## 💻 How to Clone the Repository

Clone the repository using Git:

```bash
git clone https://github.com/teamelmolok44-rgb/UK-Train-Rides-Analysis.git
```

Then navigate to the project folder:

```bash
cd UK-Train-Rides-Analysis
```

---

## ⚙️ Installation

Install the required Python libraries before running the project:

```bash
pip install pandas numpy matplotlib seaborn jupyter
```

---

## ▶️ How to Run the Project

Launch Jupyter Notebook:

```bash
jupyter notebook
```

Open the analysis notebook:

```bash
notebooks/data_analysis.ipynb
```
