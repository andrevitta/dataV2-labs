use finance;

SELECT 
    (CASE
        WHEN substring(birth_number, 3, 2) > 12 THEN 'F'
        ELSE 'M'
    END) AS gender,
    birth_number
FROM
    client

