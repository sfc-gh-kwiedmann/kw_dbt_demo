select
    price_tier,
    count(*) as product_count,
    avg(price) as avg_price
from {{ ref('products_enriched') }}
group by price_tier
