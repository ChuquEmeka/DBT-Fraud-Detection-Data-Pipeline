select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select Age
from DEV_EMEKA_FRAUD_DETECTION.PUBLIC.si_users_dimension
where Age is null



      
    ) dbt_internal_test