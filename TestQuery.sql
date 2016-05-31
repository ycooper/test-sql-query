SELECT Name FROM users
WHERE users.CustomerId IN
	(SELECT CustomerId FROM purchases
	WHERE ProductName = 'Milk'
	AND
	CustomerId NOT IN
		(SELECT CustomerId FROM purchases
		WHERE PurchaseDateTime > SUBDATE(NOW(), INTERVAL '0000-01' YEAR_MONTH)
		AND
		ProductName = 'Sour cream'
		)
	)
;