

WITH users_dimension AS (
    SELECT
        UserID,
        FIRST_VALUE(Age) OVER (PARTITION BY UserID ORDER BY TransactionDate) AS Age,
        FIRST_VALUE(Gender) OVER (PARTITION BY UserID ORDER BY TransactionDate) AS Gender,
        FIRST_VALUE(AccountCreationDate) OVER (PARTITION BY UserID ORDER BY TransactionDate) AS AccountCreationDate,
        FIRST_VALUE(AccountStatus) OVER (PARTITION BY UserID ORDER BY TransactionDate) AS AccountStatus,
        FIRST_VALUE(UserProfileCompleteness) OVER (PARTITION BY UserID ORDER BY TransactionDate) AS UserProfileCompleteness,
        FIRST_VALUE(PreviousFraudAttempts) OVER (PARTITION BY UserID ORDER BY TransactionDate) AS PreviousFraudAttempts,
        FIRST_VALUE(Location) OVER (PARTITION BY UserID ORDER BY TransactionDate) AS UserLocation
    FROM EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.br_fraud_detection_raw_data_historical
    
        WHERE UserID > (SELECT MAX(UserID) FROM EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.si_users_dimension)
    
)

SELECT DISTINCT * FROM users_dimension