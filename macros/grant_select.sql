(% macro grant_select(schema = target.schema, role = target.role) %)
    (% set query %)
        grant usage to schema {{ schema }} to role {{ role }};
        grant select on all table  in schema {{ schema }} to role {{ role }};
        grant select on all views  in schema {{ schema }} to role {{ role }};
    (% endset %)

    (% do run_query(query) %)

(% endmacro %)