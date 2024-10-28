

WITH transactions_fact AS (
    SELECT *
    FROM DEV_EMEKA_FRAUD_DETECTION.PUBLIC.br_fraud_detection_raw_data_historical
    
        WHERE TransactionID > (SELECT MAX(TransactionID) FROM DEV_EMEKA_FRAUD_DETECTION.PUBLIC.si_transactions_fact)
    
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