

WITH fraud_detection_dashboard_metrics AS (
    SELECT
        COUNT(TransactionID) AS total_transactions,
        SUM(CASE WHEN IsFraud = 1 THEN 1 ELSE 0 END) AS total_fraud_transactions,
        SUM(CASE WHEN IsFraud = 1 THEN TransactionAmount ELSE 0 END) AS total_fraudulent_amount,
        COUNT(DISTINCT UserID) AS unique_users,
        COUNT(DISTINCT MerchantID) AS unique_merchants,
        AVG(AnomalyScore) AS avg_anomaly_score,
        MAX(TransactionDate) AS last_transaction_date
    FROM EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.si_transactions_fact  -- Correctly referencing the transactions fact model
)

SELECT DISTINCT * FROM fraud_detection_dashboard_metrics