select
    COUNT()
from
    CUSTOMER
    LEFT JOIN (
        SELECT DISTINCT(C_CUSTKEY) AS EXCL_KEYS
        FROM
            CUSTOMER
            LEFT JOIN ORDERS ON ORDERS.O_CUSTKEY = CUSTOMER.C_CUSTKEY
        where
            C_COMMENT NOT LIKE '%special request%' OR
            C_COMMENT LIKE '%unusual package%'
) ON CUSTOMER.C_CUSTKEY = EXCL_KEYS
WHERE EXCL_KEYS IS NULL;