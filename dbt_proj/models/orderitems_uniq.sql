select *
from {{ source('landing', 'orderitems') }}
qualify row_number() over (
    partition by orderid
    order by updated_at desc
) = 1
