{% macro limit_data_in_dev(col_name) %}
    {% if target.name == 'dev' %}
        where {{col_name}} >= dateadd('date', -3, current_timestamp )
    {% endif%}
{% endmacro%}