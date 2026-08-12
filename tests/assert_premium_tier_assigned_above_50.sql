-- Assert that products with price > 50 are classified as premium tier.
-- Co-authored with CoCo

select id, product, price, price_tier
from {{ ref('products_enriched') }}
where price > 50
  and price_tier != 'premium'
