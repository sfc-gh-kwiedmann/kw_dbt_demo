-- Generic test macro: asserts a numeric column is within a specified range.
-- Co-authored with CoCo
{% macro test_column_in_range(model, column_name, min_value, max_value) %}

select
    {{ column_name }} as value_out_of_range
from {{ model }}
where {{ column_name }} < {{ min_value }}
   or {{ column_name }} > {{ max_value }}

{% endmacro %}
