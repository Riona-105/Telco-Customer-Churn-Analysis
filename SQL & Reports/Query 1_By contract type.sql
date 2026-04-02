'''SQL Query 1: Churn rate by Contract Type'''
q1 = """
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(Churn_Binary) AS churned,
    ROUND(SUM(Churn_Binary) * 100.0 / COUNT(*), 1) AS churn_rate_pct
FROM telco
GROUP BY Contract
ORDER BY churn_rate_pct DESC
"""
print("Query 1 — Churn Rate by Contract Type:")
print(run_sql(q1))