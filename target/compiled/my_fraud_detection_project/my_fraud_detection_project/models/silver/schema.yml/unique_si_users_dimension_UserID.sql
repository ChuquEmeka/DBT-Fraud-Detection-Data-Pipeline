
    
    

select
    UserID as unique_field,
    count(*) as n_records

from DEV_EMEKA_FRAUD_DETECTION.PUBLIC.si_users_dimension
where UserID is not null
group by UserID
having count(*) > 1


