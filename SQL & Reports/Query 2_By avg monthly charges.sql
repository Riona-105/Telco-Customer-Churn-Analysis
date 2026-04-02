'''SQL Query 2: Avg monthly charges for churned vs retained'''
q2 = """
SELECT
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges,
    ROUND(AVG(tenure), 1) AS avg_tenure_months,
    COUNT(*) AS total_customers
FROM telco
GROUP BY Churn
"""
print("\nQuery 2 — Avg Charges & Tenure by Churn Status:")
print(run_sql(q2))