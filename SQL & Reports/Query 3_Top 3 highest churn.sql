'''SQL Query 3: Top 3 highest-churn customer segments'''
# Combine Contract + InternetService to find the riskiest combinations
q3 = """
SELECT
    Contract,
    InternetService,
    COUNT(*) AS total,
    SUM(Churn_Binary) AS churned,
    ROUND(SUM(Churn_Binary) * 100.0 / COUNT(*), 1) AS churn_rate_pct,
    ROW_NUMBER() OVER (ORDER BY SUM(Churn_Binary) * 100.0 / COUNT(*) DESC) AS rank
FROM telco
GROUP BY Contract, InternetService
HAVING COUNT(*) > 50   -- only include segments with meaningful sample size
ORDER BY churn_rate_pct DESC
LIMIT 3
"""
print("\nQuery 3 — Top 3 Highest-Churn Customer Segments:")
print(run_sql(q3))