-- transaction_amount_range_test.sql
SELECT *
FROM {{ ref('si_transactions_fact') }}
WHERE TransactionAmount < 1.0 OR TransactionAmount > 1000.0
