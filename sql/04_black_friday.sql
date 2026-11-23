-- Pedidos e faturamento por dia em novembro de 2017 (somente entregues)
-- Objetivo: conferir se o pico mensal vem da Black Friday (24/11/2017)
SELECT
    DATE(o.order_purchase_timestamp)        AS dia,
    COUNT(DISTINCT o.order_id)              AS pedidos,
    ROUND(SUM(p.payment_value), 2)          AS faturamento
FROM orders o
JOIN order_payments p ON p.order_id = o.order_id
WHERE o.order_status = 'delivered'
  AND o.order_purchase_timestamp LIKE '2017-11%'
GROUP BY dia
ORDER BY faturamento DESC;