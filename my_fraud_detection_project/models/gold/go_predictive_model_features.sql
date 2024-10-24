{{ config(
    materialized='incremental',
    unique_key='TransactionID'
) }}

WITH transactions_fact AS (
    SELECT * FROM {{ ref('si_transactions_fact') }}
),
user_behavior_metrics AS (
    SELECT * FROM {{ ref('go_user_behavior_metrics') }}
),
merchant_risk_assessment AS (
    SELECT * FROM {{ ref('go_merchant_risk_assessment') }}
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
{% if is_incremental() %}
    WHERE tf.TransactionID > (SELECT MAX(TransactionID) FROM {{ this }})
{% endif %}
