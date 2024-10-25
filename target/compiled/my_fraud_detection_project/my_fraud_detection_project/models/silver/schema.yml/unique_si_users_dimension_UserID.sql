
    
    

select
    UserID as unique_field,
    count(*) as n_records

from EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.si_users_dimension
where UserID is not null
group by UserID
having count(*) > 1


