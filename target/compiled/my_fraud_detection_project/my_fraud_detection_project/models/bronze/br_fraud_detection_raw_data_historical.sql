

WITH raw_data AS (
    SELECT
        TransactionID::string AS TransactionID,
        UserID::string AS UserID,
        TransactionDate::timestamp AS TransactionDate,
        TransactionAmount::float AS TransactionAmount,
        TransactionType::string AS TransactionType,
        MerchantID::string AS MerchantID,
        Currency::string AS Currency,
        TransactionStatus::string AS TransactionStatus,
        DeviceType::string AS DeviceType,
        IP_Address::string AS IP_Address,
        PaymentMethod::string AS PaymentMethod,
        LocationCoordinates::string AS LocationCoordinates,
        CAST(SuspiciousFlag AS int) AS SuspiciousFlag,  -- Convert boolean to int
        CAST(IsFraud AS int) AS IsFraud,
        ReviewStatus::string AS ReviewStatus,
        AnomalyScore::float AS AnomalyScore,
        TransactionTime::string AS TransactionTime,
        Age::int AS Age,
        Gender::string AS Gender,
        AccountCreationDate::timestamp AS AccountCreationDate,
        Location::string AS Location,
        AccountStatus::string AS AccountStatus,
        DeviceID::string AS DeviceID,
        UserProfileCompleteness::float AS UserProfileCompleteness,
        PreviousFraudAttempts::int AS PreviousFraudAttempts
    FROM DEV_EMEKA_FRAUD_DETECTION.PUBLIC.transactions_staging
    
        WHERE TransactionID::string > (SELECT MAX(TransactionID) FROM DEV_EMEKA_FRAUD_DETECTION.PUBLIC.br_fraud_detection_raw_data_historical)
    
)

-- Deduplicate by TransactionID
SELECT DISTINCT * FROM raw_data