SELECT * FROM products WHERE NAME = 'milk'
SELECT * FROM products WHERE NAME LIKE '%mil%'

SELECT * FROM products 
WHERE summ BETWEEN 10 AND 160
ORDER BY `summ` 

SELECT * FROM orders 
WHERE dateSale BETWEEN '2021-09-14 13:52:41' AND '2021-09-15 13:52:41'
ORDER BY `dateSale` 

SELECT * FROM users 
WHERE email = 'f@gmail.com'

SELECT * FROM users 
WHERE email IN('f@gmail.com', 'test@gmail.com')

SELECT * FROM users d 
LEFT join  products t on d.custumerId = t.userWhoADD