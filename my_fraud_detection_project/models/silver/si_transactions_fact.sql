{{ config(
    materialized='incremental',
    unique_key='TransactionID'
) }}

WITH transactions_fact AS (
    SELECT *
    FROM {{ ref('br_fraud_detection_raw_data_historical') }}
    {% if is_incremental() %}
        WHERE TransactionID > (SELECT MAX(TransactionID) FROM {{ this }})
    {% endif %}
)

SELECT DISTINCT
    TransactionID,
    UserID,
    TransactionDate,
    TransactionAmount,
    TransactionType,
    MerchantID,
    Currency,
    TransactionStatus,
    DeviceType,
    IP_Address,
    PaymentMethod,
    SuspiciousFlag,
    IsFraud,
    AnomalyScore,
    Age,
    Gender,
    AccountCreationDate,
    Location,
    LocationCoordinates,
    AccountStatus,
    DeviceID,
    UserProfileCompleteness,
    PreviousFraudAttempts
FROM transactions_fact
