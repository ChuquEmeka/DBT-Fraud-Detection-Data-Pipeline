-- age_range_test.sql
SELECT *
FROM {{ ref('si_users_dimension') }}
WHERE Age < 18 OR Age > 75

