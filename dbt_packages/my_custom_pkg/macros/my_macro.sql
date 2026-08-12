{% macro hello_world() %}
  SELECT 'Hello from my custom package!' AS message
{% endmacro %}