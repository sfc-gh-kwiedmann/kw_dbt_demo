-- Assert that product_count and avg_price are positive in products_summary.
-- Co-authored with CoCo

select price_tier, product_count, avg_price
from {{ ref('products_summary') }}
where product_count <= 0
   or avg_price <= 0
