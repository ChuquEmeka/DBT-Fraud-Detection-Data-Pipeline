
  
    

        create or replace transient table PROD_EMEKA_FRAUD_DETECTION2.PUBLIC.si_transactions_fact
         as
        (

WITH transactions_fact AS (
    SELECT *
    FROM PROD_EMEKA_FRAUD_DETECTION2.PUBLIC.br_fraud_detection_raw_data_historical
    
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
        );
      
  