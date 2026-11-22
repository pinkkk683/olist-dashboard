SELECT
    strftime('%Y-%m', o.order_purchase_timestamp) AS mes,
    COUNT(DISTINCT o.order_id)                    AS pedidos,
    ROUND(SUM(p.payment_value), 2)                AS faturamento,
    ROUND(SUM(p.payment_value) / COUNT(DISTINCT o.order_id), 2) AS ticket_medio
FROM orders o
JOIN order_payments p ON p.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY mes
ORDER BY mes;