SELECT
    *
FROM
    (
        SELECT
            N_NAME,
            SUM(qtd_itens) AS total_itens
        from
            NATION
            LEFT JOIN (
                SELECT
                    C_NATIONKEY AS ORDERS_NATIONS,
                    O_ORDERKEY AS ORDER_KEY,
                    LINEITEM.L_QUANTITY AS qtd_itens
                FROM
                    CUSTOMER
                    LEFT JOIN ORDERS ON C_CUSTKEY = O_CUSTKEY
                    LEFT JOIN LINEITEM ON LINEITEM.L_ORDERKEY = ORDER_KEY
            ) ON NATION.N_NATIONKEY = ORDERS_NATIONS
        GROUP BY
            N_NATIONKEY
    )
WHERE
    total_itens > 62000
ORDER BY
    total_itens DESC;