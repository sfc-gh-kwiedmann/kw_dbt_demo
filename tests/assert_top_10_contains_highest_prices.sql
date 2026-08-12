-- Validate that the top 10 products are actually the highest priced in the catalog.
-- Co-authored with CoCo

-- Fails if any product NOT in top_10_products_by_price has a higher price
-- than the lowest-priced product in the top 10 list.

with top_10_min_price as (
    select min(price) as min_top_price
    from {{ ref('top_10_products_by_price') }}
),

products_above_threshold as (
    select
        e.id,
        e.product,
        e.price
    from {{ ref('products_enriched') }} e
    cross join top_10_min_price t
    where e.price > t.min_top_price
      and e.id not in (select id from {{ ref('top_10_products_by_price') }})
)

select * from products_above_threshold
