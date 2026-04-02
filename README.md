# Telco-Customer-Churn-Analysis

**Tools:** Python (pandas, seaborn, matplotlib) · SQL (SQLite)  
**Dataset:** [IBM Telco Customer Churn — Kaggle](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)  
**Status:** Complete

---

## Business Question
A telecom company is losing customers. Which customer segments are most at risk of churning, and what should the business do to retain them?

---

## Key Findings

1. **Overall churn rate is ~26.5%** — roughly 1 in 4 customers leaves.

2. **Contract type is the strongest predictor of churn:**
   - Month-to-month contracts: ~43% churn rate
   - One-year contracts: ~11% churn rate
   - Two-year contracts: ~3% churn rate

3. **New customers churn the most:**
   - Tenure 0–12 months: ~47% churn rate
   - Tenure 24+ months: ~14% churn rate
   - The first year is the highest-risk window for retention.

4. **Fiber optic customers churn more than DSL** (~42% vs ~19%), suggesting a possible pricing or service quality issue.

5. **Electronic check users have the highest churn rate** among all payment methods.

---

## Recommendations

1. **Prioritise Month-to-month + new customer (0–12m) segment** for retention campaigns — offer incentives to upgrade to annual contracts.

2. **Investigate Fiber Optic churn** — survey this segment to understand whether pricing, reliability, or competition is the driver.

3. **Set up an early-warning flag** for high-risk customers: month-to-month contract + tenure < 12 months + monthly charges > $65 → proactive outreach.

---

## Project Structure

```
telco-churn-analysis/
│
├── README.md
│
├── notebooks/
│   └── telco_eda.ipynb          # Full EDA: data cleaning, visualisations, findings
│
└── sql/
    ├── query1_churn_by_contract.sql     # Churn rate by contract type
    ├── query2_avg_charges_by_churn.sql  # Avg monthly charges: churned vs retained
    └── query3_top_risk_segments.sql     # Top 3 highest-churn customer segments
```

---

## Analysis Process

**1. Data cleaning**  
Fixed `TotalCharges` column (stored as string with blank spaces for new customers). Converted to numeric and filled nulls with 0.

**2. Exploratory data analysis**  
Analysed churn rate across key dimensions: contract type, payment method, internet service type, tenure, and monthly charges. Added a custom tenure bucketing (0–12m / 12–24m / 24m+) to quantify the new-customer risk window.

**3. SQL analysis**  
Loaded cleaned data into SQLite and wrote 3 queries to validate Python findings and identify the highest-risk customer segments using window functions.

**4. Findings & recommendations**  
Translated data findings into 3 actionable business recommendations targeting the highest-impact retention levers.
