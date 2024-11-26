{% macro convert_to_usd(amount, currency, rates) %}
case  
    when {{ currency }} = 'USD' 
        then {{ amount }}
    else {{ amount }} / {{ rates }}
end
{% endmacro %}