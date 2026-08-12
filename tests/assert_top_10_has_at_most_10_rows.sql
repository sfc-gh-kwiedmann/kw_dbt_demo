-- Assert that top_10_products_by_price never exceeds 10 rows.
-- Co-authored with CoCo

select count(*) as row_count
from {{ ref('top_10_products_by_price') }}
having count(*) > 10
