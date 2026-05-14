select
    id,
    product,
    price,
    case
        when price > 50 then 'premium'
        when price > 20 then 'standard'
        else 'budget'
    end as price_tier
from {{ source('iceberg_data', 'kw-cld-glue-created-table') }}