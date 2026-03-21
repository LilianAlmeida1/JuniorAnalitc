Create DATABASE ECOMMERCEBR
GO

insert into



SELECT TOP 10 *
FROM product_category_name_translation;

SELECT TOP 10 *
FROM dbo.olist_customers_dataset;


SELECT TOP 10 *
FROM dbo.olist_order_items_dataset;

--Objetivo: Criar um ranking dos 10 estados brasileiros com o maior faturamento total.
SELECT TOP (10) 
    OC.customer_state,
    OP.[payment_value]
FROM [dbo].[olist_customers_dataset] AS OC
JOIN [dbo].[olist_orders_dataset] AS O 
    ON OC.customer_id = O.customer_id
JOIN [dbo].[olist_order_payments_dataset]  AS OP
    ON O.order_id = OP.order_id
    GROUP BY 
      OP.[payment_value], 
     OC.customer_state
     ORDER BY OP.[payment_value] DESC;


-- Listar as 5 categorias de produtos mais vendidas (em quantidade), mas exibir o nome da categoria em inglês.
SELECT TOP (5)
   E.[product_category_name_english],
   I.[order_item_id]
FROM [dbo].[olist_order_items_dataset] AS I
JOIN
[dbo].[olist_products_dataset] AS P
ON
I.[product_id] = P.[product_id]
JOIN
[dbo].[product_category_name_translation] AS E
ON
E.[product_category_name] = P.[product_category_name]
ORDER BY  I.[order_item_id] DESC;


--Renomeando o nome das colunas da tabela dbo.product_category_name 
EXEC sp_rename 'dbo.product_category_name_translation.column1', 'product_category_name', 'COLUMN';
EXEC sp_rename 'dbo.product_category_name_translation.Column2', 'product_category_name_english', 'COLUMN';

DELETE FROM dbo.product_category_name_translation WHERE product_category_name = 'product_category_name';


--Calcular o tempo médio de entrega (em dias) por estado e a porcentagem de pedidos que foram entregues após a data estimada.

SELECT 
  C.[customer_state],
  AVG(DATEDIFF(DAY,order_estimated_delivery_date, order_delivered_customer_date)) AS TempoMedioParaEntrega
FROM [dbo].[olist_orders_dataset] AS O
JOIN
[dbo].[olist_customers_dataset] AS C
ON
O.[customer_id] = C.[customer_id]
WHERE O.[order_delivered_customer_date] IS NOT NULL
GROUP BY C.[customer_state]
ORDER BY TempoMedioParaEntrega DESC;


--Identificar quantos clientes (customer_unique_id) realizaram mais de uma compra e qual o intervalo médio de dias entre a primeira e a segunda compra.
SELECT

FROM

JOIN

ON