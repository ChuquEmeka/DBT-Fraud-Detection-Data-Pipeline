

WITH user_behavior_metrics AS (
    SELECT
        UserID,
        COUNT(TransactionID) AS total_transactions,
        AVG(TransactionAmount) AS avg_transaction_amount,
        COUNT(CASE WHEN IsFraud = 1 THEN 1 END) AS total_fraud_transactions,
        COUNT(DISTINCT DeviceID) AS unique_devices,
        MAX(TransactionDate) AS last_transaction_date,
        MIN(TransactionDate) AS first_transaction_date
    FROM DEV_EMEKA_FRAUD_DETECTION.PUBLIC.si_transactions_fact
    GROUP BY UserID
)

SELECT DISTINCT * FROM user_behavior_metrics