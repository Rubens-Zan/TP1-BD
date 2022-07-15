SELECT
    distinct(C_MKTSEGMENT),
    COUNT(C_CUSTKEY)
from
    CUSTOMER
group by
    C_MKTSEGMENT;