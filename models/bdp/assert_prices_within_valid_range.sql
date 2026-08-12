-- Test that all product prices fall within a valid range (0 to 10000).
-- Co-authored with CoCo
{{ test_column_in_range(
    model=ref('products_enriched'),
    column_name='price',
    min_value=0,
    max_value=10000
) }}
