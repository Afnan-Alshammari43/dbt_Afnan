--{{ config(materialized='table') }}
SELECT
    date_date,
    COUNT(orders_id) AS nb_transactions,
    ROUND(SUM(revenue), 0) AS revenue,
    ROUND(AVG(revenue), 1) AS average_basket,
    ROUND(AVG(revenue), 1) AS average_basket_bis,
    ROUND(SUM(margin), 0) AS margin,
    ROUND(SUM(operational_margin), 0) AS operational_margin,
    ROUND(SUM(CAST(purchase_cost AS DECIMAL)), 0) AS purchase_cost,
    ROUND(SUM(CAST(shipping_fee AS DECIMAL)), 0) AS shipping_fee,
    ROUND(SUM(logcost), 0) AS logcost,
    ROUND(SUM(CAST(ship_cost AS DECIMAL)), 0) AS ship_cost,
    SUM(quantity) AS quantity
FROM {{ref("int_orders_operational")}}
GROUP BY date_date
ORDER BY date_date DESC