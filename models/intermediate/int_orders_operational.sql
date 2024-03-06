SELECT
  o.orders_id
  ,o.date_date
  ,ROUND(s.shipping_fee - (s.logCost + cast(s.ship_cost as float64)),2) AS operational_margin 
  ,o.quantity
  ,o.revenue
  ,o.purchase_cost
  ,o.margin
  ,s.shipping_fee
  ,s.logCost
  ,s.ship_cost
FROM {{ref("int_orders_margin")}} o
LEFT JOIN {{ref("stg_raw__raw_gz_ship")}} s 
  USING(orders_id)
ORDER BY orders_id desc