

WITH real_time_fraud_detection AS (
    SELECT
        TransactionID,
        TransactionDate,
        TransactionAmount,
        TransactionType,
        UserID,
        MerchantID,
        DeviceID,
        IP_Address,
        AnomalyScore,
        IsFraud,
        CASE
            WHEN AnomalyScore > 0.8 THEN 'High Risk'
            WHEN AnomalyScore > 0.5 THEN 'Moderate Risk'
            ELSE 'Low Risk'
        END AS fraud_risk_level
    FROM DEV_EMEKA_FRAUD_DETECTION.PUBLIC.si_transactions_fact
    WHERE AnomalyScore > 0.5 OR IsFraud = 1
)

SELECT DISTINCT * FROM real_time_fraud_detection