select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select UserID
from DEV_EMEKA_FRAUD_DETECTION.PUBLIC.si_users_dimension
where UserID is null



      
    ) dbt_internal_test