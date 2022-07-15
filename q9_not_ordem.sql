SELECT
    COUNT(DISTINCT(C_CUSTKEY))
FROM
    customer
WHERE
    NOT EXISTS (
        SELECT
            *
        FROM
            orders
        WHERE
            customer.c_custkey = orders.o_custkey
    );