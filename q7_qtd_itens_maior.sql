SELECT
    *
FROM
    (
        SELECT
            N_NAME,
            COUNT() AS qtd
        from
            NATION
            LEFT JOIN (
                SELECT
                    C_NATIONKEY AS ORDERS_NATIONS
                FROM
                    CUSTOMER
                    LEFT JOIN ORDERS ON C_CUSTKEY = O_CUSTKEY
            ) ON NATION.N_NATIONKEY = ORDERS_NATIONS
        GROUP BY
            N_NATIONKEY
        HAVING
            qtd > 62000
        ORDER BY
            qtd DESC
    );