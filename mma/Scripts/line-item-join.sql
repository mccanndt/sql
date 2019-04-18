use mma;
SELECT i.OrderNumber as 'Order Number',
	   l.ID as 'Line Item',
	   i.CustomerName as 'Customer Name',
       i.OrderDate as 'Order Date',
       p.Code as 'Item Code',
       p.Description,
       p.Price as 'Item Price',
       l.Quantity,
       l.Quantity * p.Price as 'Line Total'
	FROM lineitem l
		JOIN invoice i ON i.ID = l.InvoiceID
		JOIN product p ON p.ID = l.ProductID
        
        
