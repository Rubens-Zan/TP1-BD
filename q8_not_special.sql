SELECT
    COUNT(C_CUSTKEY)
FROM
    (
        SELECT
            DISTINCT(C_CUSTKEY)
        FROM
            CUSTOMER,
            ORDERS
        WHERE
            CUSTOMER.C_CUSTKEY = ORDERS.O_CUSTKEY
        EXCEPT
        SELECT
            C_CUSTKEY
        FROM
            orders,
            CUSTOMER
        WHERE
            customer.c_custkey = orders.o_custkey
            AND O_COMMENT LIKE '%special request%'
    );