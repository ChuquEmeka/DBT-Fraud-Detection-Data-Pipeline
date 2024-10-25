
  
    

        create or replace transient table PROD_EMEKA_FRAUD_DETECTION2.PUBLIC.go_fraud_detection_dashboard_metrics
         as
        (

WITH fraud_detection_dashboard_metrics AS (
    SELECT
        COUNT(TransactionID) AS total_transactions,
        SUM(CASE WHEN IsFraud = 1 THEN 1 ELSE 0 END) AS total_fraud_transactions,
        SUM(CASE WHEN IsFraud = 1 THEN TransactionAmount ELSE 0 END) AS total_fraudulent_amount,
        COUNT(DISTINCT UserID) AS unique_users,
        COUNT(DISTINCT MerchantID) AS unique_merchants,
        AVG(AnomalyScore) AS avg_anomaly_score,
        MAX(TransactionDate) AS last_transaction_date
    FROM PROD_EMEKA_FRAUD_DETECTION2.PUBLIC.si_transactions_fact  -- Correct reference to your transactions fact table
)

SELECT DISTINCT * FROM fraud_detection_dashboard_metrics
        );
      
  