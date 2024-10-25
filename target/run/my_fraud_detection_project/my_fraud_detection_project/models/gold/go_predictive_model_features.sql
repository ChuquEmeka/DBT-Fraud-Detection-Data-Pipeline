
  
    

        create or replace transient table PROD_EMEKA_FRAUD_DETECTION2.PUBLIC.go_predictive_model_features
         as
        (

WITH transactions_fact AS (
    SELECT * FROM PROD_EMEKA_FRAUD_DETECTION2.PUBLIC.si_transactions_fact
),
user_behavior_metrics AS (
    SELECT * FROM PROD_EMEKA_FRAUD_DETECTION2.PUBLIC.go_user_behavior_metrics
),
merchant_risk_assessment AS (
    SELECT * FROM PROD_EMEKA_FRAUD_DETECTION2.PUBLIC.go_merchant_risk_assessment
)

SELECT
    tf.TransactionID,
    tf.TransactionAmount,
    tf.TransactionType,
    tf.AnomalyScore,
    ubm.total_transactions AS user_total_transactions,
    ubm.avg_transaction_amount AS user_avg_transaction_amount,
    ubm.total_fraud_transactions AS user_fraud_transactions,
    mra.total_fraud_transactions AS merchant_fraud_transactions,
    mra.avg_anomaly_score AS merchant_avg_anomaly_score,
    tf.IsFraud
FROM transactions_fact tf
JOIN user_behavior_metrics ubm ON tf.UserID = ubm.UserID
JOIN merchant_risk_assessment mra ON tf.MerchantID = mra.MerchantID

        );
      
  