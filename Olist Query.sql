select * from olist_customers_dataset;

select distinct customer_state from olist_customers_dataset;

SELECT 
    CASE customer_state
        WHEN 'AC' THEN 'Acre'
        when 'AL' then 'Alagoas'
        when 'AP' then 'Amapá'
        when 'AM' then 'Amazonas'
		when 'BA' then 'Bahia'
		when 'CE' then 'Ceará'
		when 'DF' then 'Distrito Federal' 
		when 'ES' then 'Espírito Santo'
		when 'GO' then 'Goiás'
		when 'MA' then 'Maranhão'
		when 'MT' then 'Mato Grosso'
		when 'MS' then 'Mato Grosso do Sul'
		when 'MG' then 'Minas Gerais'
		when 'PA' then 'Pará'
		when 'PB' then 'Paraíba'
		when 'PR' then 'Paraná'
		when 'PE' then 'Pernambuco'
		when 'PI' then 'Piauí'
		when 'RJ' then 'Rio de Janeiro'
		when 'RN' then 'Rio Grande do Norte'
		when 'RS' then 'Rio Grande do Sul'
		when 'RO' then 'Rondônia'
		when 'RR' then 'Roraima'
		when 'SC' then 'Santa Catarina'
		when 'SP' then 'São Paulo'
		when 'SE' then 'Sergipe'
		when 'TO' then 'Tocantins' 
        ELSE 'state'
    END AS state
FROM
    olist_customers_dataset;

ALTER TABLE olist_customers_dataset
ADD customer_state_full VARCHAR(50);

UPDATE olist_customers_dataset
SET customer_state_full =
	CASE customer_state
        WHEN 'AC' THEN 'Acre'
        when 'AL' then 'Alagoas'
        when 'AP' then 'Amapá'
        when 'AM' then 'Amazonas'
		when 'BA' then 'Bahia'
		when 'CE' then 'Ceará'
		when 'DF' then 'Distrito Federal' 
		when 'ES' then 'Espírito Santo'
		when 'GO' then 'Goiás'
		when 'MA' then 'Maranhão'
		when 'MT' then 'Mato Grosso'
		when 'MS' then 'Mato Grosso do Sul'
		when 'MG' then 'Minas Gerais'
		when 'PA' then 'Pará'
		when 'PB' then 'Paraíba'
		when 'PR' then 'Paraná'
		when 'PE' then 'Pernambuco'
		when 'PI' then 'Piauí'
		when 'RJ' then 'Rio de Janeiro'
		when 'RN' then 'Rio Grande do Norte'
		when 'RS' then 'Rio Grande do Sul'
		when 'RO' then 'Rondônia'
		when 'RR' then 'Roraima'
		when 'SC' then 'Santa Catarina'
		when 'SP' then 'São Paulo'
		when 'SE' then 'Sergipe'
		when 'TO' then 'Tocantins' 
        ELSE 'state'
    END;
    
select * from olist_customers_dataset;

Alter Table olist_customers_dataset
drop column customer_zip_code_prefix;

select * from olist_order_items_dataset;

Alter Table olist_order_items_dataset
drop column order_item_id;

Alter Table olist_order_items_dataset
drop column seller_id;

Alter Table olist_order_items_dataset
drop column shipping_limit_date;

SELECT 
    price + freight_value AS Total_Cost
FROM
    olist_order_items_dataset;  

alter table olist_order_items_dataset
add column Total_cost decimal(10,2);

update olist_order_items_dataset
set Total_cost =  price + freight_value;

select * from olist_order_items_dataset;

select * from olist_order_payments_dataset;

alter table olist_order_payments_dataset
drop column payment_sequential;

select * from olist_order_payments_dataset;

select * from olist_order_reviews_dataset;

alter table olist_order_reviews_dataset
drop column review_id;

alter table olist_order_reviews_dataset
drop column review_comment_title;

alter table olist_order_reviews_dataset
drop column  review_comment_message;

alter table olist_order_reviews_dataset
drop column review_creation_date;

alter table olist_order_reviews_dataset
drop column review_answer_timestamp;

select * from olist_orders_dataset;

alter table olist_orders_dataset
drop column order_approved_at;

alter table olist_orders_dataset
drop column order_delivered_carrier_date;

alter table olist_orders_dataset
drop column order_delivered_customer_date;

alter table olist_orders_dataset
drop column order_estimated_delivery_date;

select * from olist_orders_dataset;

Alter table olist_orders_dataset
modify order_purchase_timestamp date;

select * from olist_orders_dataset;

SELECT 
    order_purchase_timestamp,
    YEAR(order_purchase_timestamp) AS purchase_year,
    MONTHNAME(order_purchase_timestamp) AS purchase_month,
    DAY(order_purchase_timestamp) AS purchase_day
FROM
    olist_orders_dataset;

alter table olist_orders_dataset
add column purchase_year int,
add column purchase_month varchar(20),
add column purchase_day int;

update olist_orders_dataset
set purchase_year = YEAR(order_purchase_timestamp),
    purchase_month = MONTHNAME(order_purchase_timestamp),
    purchase_day = DAY(order_purchase_timestamp);

select * from olist_orders_dataset;

select * from olist_products_dataset;

alter table olist_products_dataset
drop column product_name_lenght;

alter table olist_products_dataset
drop column product_description_lenght;

alter table olist_products_dataset
drop column product_photos_qty;

alter table olist_products_dataset
drop column product_weight_g;

alter table olist_products_dataset
drop column product_length_cm;

alter table olist_products_dataset
drop column product_height_cm;

alter table olist_products_dataset
drop column product_width_cm;

select * from olist_products_dataset;

SELECT 
    o.order_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.purchase_year,
    o.purchase_month,
    o.purchase_day,
    c.customer_id,
    c.customer_city,
    c.customer_state_full,
    oi.product_id,
    oi.price,
    oi.freight_value,
    oi.Total_cost,
    p.product_category_name,
    op.payment_type,
    op.payment_installments,
    op.payment_value,
    r.review_score
FROM olist_orders_dataset o
LEFT JOIN olist_customers_dataset c
    ON o.customer_id = c.customer_id
LEFT JOIN olist_order_items_dataset oi
    ON o.order_id = oi.order_id
LEFT JOIN olist_products_dataset p
    ON oi.product_id = p.product_id
LEFT JOIN olist_order_payments_dataset op
    ON o.order_id = op.order_id
LEFT JOIN olist_order_reviews_dataset r
    ON o.order_id = r.order_id;
    
create table olist_master_table as
SELECT 
    o.order_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.purchase_year,
    o.purchase_month,
    o.purchase_day,
    c.customer_id,
    c.customer_city,
    c.customer_state_full,
    oi.product_id,
    oi.price,
    oi.freight_value,
    oi.Total_cost,
    p.product_category_name,
    op.payment_type,
    op.payment_installments,
    op.payment_value,
    r.review_score
FROM olist_orders_dataset o
LEFT JOIN olist_customers_dataset c
    ON o.customer_id = c.customer_id
LEFT JOIN olist_order_items_dataset oi
    ON o.order_id = oi.order_id
LEFT JOIN olist_products_dataset p
    ON oi.product_id = p.product_id
LEFT JOIN olist_order_payments_dataset op
    ON o.order_id = op.order_id
LEFT JOIN olist_order_reviews_dataset r
    ON o.order_id = r.order_id;
    
select * from olist_master_table;

select distinct purchase_year from olist_master_table;

SELECT DISTINCT
    purchase_year, SUM(total_cost)
FROM
    olist_master_table
GROUP BY purchase_year
ORDER BY purchase_year DESC;

select * from olist_master_table;

SELECT 
    product_category_name, 
    SUM(total_cost) AS category_revenue
FROM olist_master_table
GROUP BY product_category_name
ORDER BY category_revenue DESC
LIMIT 10;

select * from olist_master_table;

SELECT DISTINCT order_status,
    COUNT(order_status),
    purchase_year,
    purchase_month,
    purchase_day
FROM
    olist_master_table
GROUP BY order_status, purchase_year , purchase_month , purchase_day
order by order_status, purchase_year , purchase_month , purchase_day;

select * from olist_master_table;

SELECT 
    SUM(payment_value) AS total_revenue, purchase_year
FROM
    olist_master_table
GROUP BY purchase_year
ORDER BY total_revenue DESC;

select * from olist_master_table;

SELECT 
    SUM(payment_value) AS total_revenue, customer_state_full
FROM
    olist_master_table
GROUP BY customer_state_full
ORDER BY total_revenue DESC
limit 10;

select * from olist_master_table;

SELECT 
    product_category_name,
    AVG(review_score) AS avg_review
FROM olist_master_table
GROUP BY product_category_name
ORDER BY avg_review DESC;

select * from olist_master_table;

SELECT 
    customer_state_full, round(avg(payment_value)) AS avg_order_value
FROM
    olist_master_table
GROUP BY customer_state_full
ORDER BY avg_order_value DESC
limit 10;

select * from olist_master_table;

SELECT 
    customer_city,
    round(SUM(payment_value)) AS revenue
FROM olist_master_table
GROUP BY customer_city
ORDER BY revenue DESC
LIMIT 10;

select * from olist_master_table;

SELECT 
    product_id, COUNT(order_id) AS total_orders
FROM
    olist_master_table
WHERE
    product_id IS NOT NULL
GROUP BY product_id
ORDER BY total_orders DESC
LIMIT 10;

select * from olist_master_table;

SELECT 
    product_id, SUM(review_score) AS total_score
FROM
    olist_master_table
GROUP BY product_id
ORDER BY total_score DESC
LIMIT 10;

select * from olist_master_table;

SELECT 
    customer_id,
    COUNT(DISTINCT order_id) AS total_orders,
    CASE
        WHEN COUNT(DISTINCT order_id) = 1 THEN 'one-time buyer'
        ELSE 'repeat customer'
    END AS customer_type
FROM
    olist_master_table
GROUP BY customer_id
order by total_orders desc;

select * from olist_master_table;

SELECT 
    purchase_year, purchase_month, SUM(payment_value) AS revenue
FROM
    olist_master_table
GROUP BY purchase_year , purchase_month
ORDER BY purchase_year , purchase_month;

select * from olist_master_table;

SELECT 
    payment_type, COUNT(*) AS total_transaction
FROM
    olist_master_table
GROUP BY payment_type
ORDER BY total_transaction DESC;

select * from olist_master_table;

SELECT 
    payment_installments, COUNT(*) AS total_orders
FROM
    olist_master_table
WHERE
    payment_installments IS NOT NULL
GROUP BY payment_installments
ORDER BY payment_installments;

select * from olist_master_table;

SELECT 
    review_score, COUNT(*) AS total_reviews
FROM
    olist_master_table
WHERE
    review_score IS NOT NULL
GROUP BY review_score
ORDER BY review_score;

select * from olist_master_table;

SELECT 
    product_category_name,
    SUM(payment_value) AS revenue,
    AVG(review_score) AS avg_rating
FROM olist_master_table
GROUP BY product_category_name
ORDER BY revenue DESC;

select * from olist_master_table;

SELECT 
    order_status,
    COUNT(*) AS total_orders
FROM olist_master_table
GROUP BY order_status
ORDER BY total_orders DESC;

select * from olist_master_table;

SELECT 
    customer_state_full,
    AVG(payment_value) AS avg_order_value
FROM olist_master_table
GROUP BY customer_state_full
ORDER BY avg_order_value DESC
LIMIT 10;

select * from olist_master_table;