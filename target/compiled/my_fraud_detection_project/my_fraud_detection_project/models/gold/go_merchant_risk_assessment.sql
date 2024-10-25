

WITH merchant_risk_assessment AS (
    SELECT
        MerchantID,
        COUNT(TransactionID) AS total_transactions,
        COUNT(CASE WHEN IsFraud = 1 THEN 1 END) AS total_fraud_transactions,
        SUM(CASE WHEN IsFraud = 1 THEN TransactionAmount ELSE 0 END) AS total_fraudulent_amount,
        AVG(AnomalyScore) AS avg_anomaly_score,
        COUNT(DISTINCT UserID) AS unique_users
    FROM PROD_EMEKA_FRAUD_DETECTION2.PUBLIC.si_transactions_fact
    GROUP BY MerchantID
)

SELECT DISTINCT * FROM merchant_risk_assessment