select
    id,
    product,
    price,
    price_tier
from {{ ref('products_enriched') }}
order by price desc
limit 10
