select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select AccountStatus
from EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.si_users_dimension
where AccountStatus is null



      
    ) dbt_internal_test