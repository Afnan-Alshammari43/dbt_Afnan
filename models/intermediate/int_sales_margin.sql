select
    products_id,
    date_date,
    orders_id,
    revenue,
    quantity,
    cast(purchase_price as float64) as price,
    round(s.quantity*cast(p.purchase_price as float64),2) as purchase_cost,
    s.revenue-round(s.quantity*cast(p.purchase_price as float64),2) as margin
from {{ref("stg_raw__raw_gz_sales")}} s 
left join {{ref("stg_raw__raw_gz_product")}} p 
    using (products_id)