-- Assert that all product prices are positive values.
-- Co-authored with CoCo

select id, product, price
from {{ ref('products_enriched') }}
where price <= 0
