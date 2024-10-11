{%- set payment_method = ['bank_transfer', 'credit_card', 'coupon', 'gift_card'] -%} 

with payments as (
    select * from {{ref('stg_stripe__payments')}}
),

pivoted as (
 
    select 
        order_id,
        {% for method in payment_method -%}

        sum(case when payment_method = '{{method}}' then amount else 0 end) as {{method}}_amount

        {%- if loop.last == false -%}
        ,
        {% endif -%}
        {% endfor %}
    from payments
    where status = 'success'
    group by 1
)

select * from pivoted