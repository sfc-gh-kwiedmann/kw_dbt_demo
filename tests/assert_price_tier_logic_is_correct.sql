-- Validate that price tier boundaries are correctly applied in products_enriched.
-- Co-authored with CoCo

-- This test returns rows where the price_tier does NOT match
-- the expected classification logic. If any rows are returned, the test FAILS.
--
-- Business rules:
--   price > 50  → 'premium'
--   price > 20  → 'standard'
--   price <= 20 → 'budget'

select
    id,
    product,
    price,
    price_tier,
    case
        when price > 50 then 'premium'
        when price > 20 then 'standard'
        else 'budget'
    end as expected_tier
from {{ ref('products_enriched') }}
where price_tier != case
    when price > 50 then 'premium'
    when price > 20 then 'standard'
    else 'budget'
end
