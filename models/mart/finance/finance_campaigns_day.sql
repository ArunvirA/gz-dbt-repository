SELECT 
date_date,
ROUND(SUM(operational_margin - ads_cost),2) AS ads_margin,
ROUND(SUM(average_basket),2) AS average_basket,
ROUND(SUM(operational_margin),2) AS operational_margin
FROM {{ ref("int_campaigns_day") }}
LEFT JOIN `{{ ref("finance_days") }}
USING (date_date)
GROUP BY date_date
ORDER BY date_date DESC