SELECT
    COALESCE(t.product_category_name_english, pr.product_category_name, 'sem categoria') AS categoria,
    COUNT(DISTINCT i.order_id) AS pedidos,
    ROUND(SUM(i.price), 2)     AS receita
FROM order_items i
JOIN orders o   ON o.order_id = i.order_id
JOIN products pr ON pr.product_id = i.product_id
LEFT JOIN product_category_name_translation t
       ON t.product_category_name = pr.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY categoria
ORDER BY receita DESC
LIMIT 10;