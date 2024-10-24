{{ config(
    materialized='incremental',
    unique_key='UserID'
) }}

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
    FROM {{ ref('br_fraud_detection_raw_data_historical') }}
    {% if is_incremental() %}
        WHERE UserID > (SELECT MAX(UserID) FROM {{ this }})
    {% endif %}
)

SELECT DISTINCT * FROM users_dimension
