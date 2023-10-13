--Báo cáo tồn
SELECT B."BookName", B."Author", IP."quantity_import", Purchase."incurred", 
	IP."quantity_import" - Purchase."incurred" Quantity_Stock
FROM "Book" B, 
	(SELECT IHD."Book_idBook", sum(IHD."Quantity_Import") AS quantity_import
	FROM "Import_History" IH INNER JOIN "Import_Detail" IHD ON IH."idImport_History" = IHD."Import_History_idImport_History"
	WHERE EXTRACT(MONTH FROM IH."DateCreate") = 12
		AND EXTRACT(YEAR FROM IH."DateCreate") = 2020
	GROUP BY IHD."Book_idBook") AS IP,
	(SELECT DR."Book_idBook", sum(DR."Quantity_Purchase") AS incurred
	FROM "Detail_Receipt" DR INNER JOIN "Receipt" R ON R."idReceipt" = DR."Receipt_idReceipt"
	WHERE EXTRACT(MONTH FROM R."DateCreate") = 12 
		AND EXTRACT(YEAR FROM R."DateCreate") = 2020
	GROUP BY DR."Book_idBook") AS Purchase
WHERE IP."Book_idBook" = B."idBook" AND Purchase."Book_idBook" = B."idBook"


--Báo cáo công nợ
SELECT C."FullName", C."PhoneNumber", DHC."dept_money", BC."paid",
	DHC."dept_money" - BC."paid" last_money
FROM "Customer" C, 
	(SELECT B."Customer_idCustomer", SUM(B."Money") paid
	FROM "Bill" B
	WHERE EXTRACT(MONTH FROM B."DateCreate") = 12
	AND EXTRACT(YEAR FROM B."DateCreate") = 2020
	GROUP BY B."Customer_idCustomer") AS BC,
	(SELECT DH."Customer_idCustomer", SUM(DH."Dept_Money") dept_money
	FROM "Dept_History" DH
	WHERE EXTRACT(MONTH FROM DH."DateCreate") = 12
		AND EXTRACT(YEAR FROM DH."DateCreate") = 2020
	GROUP BY DH."Customer_idCustomer") AS DHC
WHERE BC."Customer_idCustomer" = C."idCustomer"
	AND DHC."Customer_idCustomer" = C."idCustomer"

--Báo cáo doanh thu 1 tháng
SELECT date_part('month', R."DateCreate") monthly, SUM(R."TotalMoney") money, SUM(DR."Quantity_Purchase") numberBook 
FROM "Receipt" R, "Detail_Receipt" DR
WHERE EXTRACT(MONTH FROM R."DateCreate") = 12
	AND EXTRACT(YEAR FROM R."DateCreate") = 2020
	AND R."idReceipt" = DR."Receipt_idReceipt"
GROUP BY date_part('month', R."DateCreate")