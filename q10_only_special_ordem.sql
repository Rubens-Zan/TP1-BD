select
    COUNT()
from
    CUSTOMER
    LEFT JOIN (
        SELECT
            DISTINCT(C_CUSTKEY) AS EXCL_KEYS
        FROM
            CUSTOMER
            LEFT JOIN ORDERS ON ORDERS.O_CUSTKEY = CUSTOMER.C_CUSTKEY
        where
            O_COMMENT NOT LIKE '%special request%'
            OR O_COMMENT LIKE '%unusual package%'
    ) ON CUSTOMER.C_CUSTKEY = EXCL_KEYS
WHERE
    EXCL_KEYS IS NULL;

SELECT
    COUNT(DISTINCT(C_CUSTKEY))
FROM
    (
        SELECT
            *
        FROM
            orders,CUSTOMER
        WHERE
            customer.c_custkey = orders.o_custkey
    )
WHERE
    NOT EXISTS (
        SELECT
            *
        FROM
            CUSTOMER
            LEFT JOIN ORDERS ON ORDERS.O_CUSTKEY = CUSTOMER.C_CUSTKEY
        where
            O_COMMENT NOT LIKE '%special request%'
            OR O_COMMENT LIKE '%unusual package%'
    );