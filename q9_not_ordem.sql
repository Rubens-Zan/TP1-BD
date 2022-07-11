SELECT
    COUNT(DISTINCT(CUSTOMER_KEY))
FROM
    (
        SELECT
            C_CUSTKEY AS CUSTOMER_KEY,
            O_CUSTKEY AS ORDER_KEY
        FROM
            CUSTOMER
            LEFT JOIN ORDERS ON ORDERS.O_CUSTKEY = CUSTOMER.C_CUSTKEY
    )
WHERE
    ORDER_KEY IS NULL;

SELECT COUNT(DISTINCT(CUSTOMER_KEY))
FROM customer
WHERE NOT EXISTS
(SELECT *
FROM orders
WHERE
customer.c_custkey=orders.o_custkey);