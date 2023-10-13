TRUNCATE "Account", "Customer", "Bill", "Book", "Receipt", "Employee", "Dept_History", "Import_History", "Detail_Receipt", "Import_Detail"
RESTART IDENTITY;

INSERT INTO "Account"("Username", "Password", "Permission") VALUES ('quanly1', '144197c225807c5225445289e632b8324773ec570525c3e5fb54c78df11336ba184c383b2ad', '1');
INSERT INTO "Account"("Username", "Password", "Permission") VALUES ('quanly2', '6f10d7a1e401c102edc96bfcdcf5e956fa985d47d0bd1b40253e351728a31fd3184c381c2d5', '1');
INSERT INTO "Account"("Username", "Password", "Permission") VALUES ('nhanvien1', '6fcb7b1796b7c710fedfb82ebfb49d0c832d9b7230397dc64172d30d45ae9bfb184c38549e2', '2');
INSERT INTO "Account"("Username", "Password", "Permission") VALUES ('nhanvien2', '87371200239fd802b53d5cf443178edc1df8d637595c8c7e082970cf7fa01ecc184c386a1c8', '2');

INSERT INTO "Customer"("FullName", "Address", "PhoneNumber", "DateOfBirth", "Email", "DeptMoney") VALUES('Nguyễn Đức Tiến', '270 Huỳnh Tấn Phát, Quận 7, TP.HCM', '0822121792', '11/24/2002', '20120383@student.hcmus.edu.vn', '0');
INSERT INTO "Customer"("FullName", "Address", "PhoneNumber", "DateOfBirth", "Email", "DeptMoney") VALUES('Nguyễn Văn Khiêm', '144 Nguyễn Công Trứ, Quân 12, TP.HCM', '0906537493', '12/01/1996', 'nvkhiem223@gmail.com', '50000');
INSERT INTO "Customer"("FullName", "Address", "PhoneNumber", "DateOfBirth", "Email", "DeptMoney") VALUES('Lê Thị Tuyết Anh', '103/20/1 Nguyễn Bỉnh Khiêm, Quận 1, TP.HCM', '0760463923', '02/17/1998', 'lttanh154@gmail.com', '10000');
INSERT INTO "Customer"("FullName", "Address", "PhoneNumber", "DateOfBirth", "Email", "DeptMoney") VALUES('Bùi Thị Riêng', '65 Nguyễn Thị Thập, Quận 7, TP.HCM', '0902765312', '03/26/2001', 'btrieng220@gmail.com', '45000');
INSERT INTO "Customer"("FullName", "Address", "PhoneNumber", "DateOfBirth", "Email", "DeptMoney") VALUES('Trần Văn An', '47 Cách Mạng Tháng 8, Quận 1, TP.HCM', '0827693152', '05/12/2003', 'tvan1312@gmail.com', '30000');
INSERT INTO "Customer"("FullName", "Address", "PhoneNumber", "DateOfBirth", "Email", "DeptMoney") VALUES('Bùi Xuân Diệp', '9 Lê Văn Lợi, Quận Bình Thạnh, TP.HCM', '0906279142', '07/14/1999', 'bxdiep0909@gmail.com', '30000');

INSERT INTO "Employee"("FullName", "PhoneNumber", "Email", "Type", "Address", "DateOfBirth", "Account_idAccount") VALUES ('Trần Văn An', '0792008367', 'tvan879@gmail.com', 'Quản lý', '87 Trần Văn Ơn, Quận 4, TP.HCM', '05/20/1994', '1000');
INSERT INTO "Employee"("FullName", "PhoneNumber", "Email", "Type", "Address", "DateOfBirth", "Account_idAccount") VALUES ('Bùi Thị Ánh Ngân', '0906892578', 'btangan997@gmail.com', 'Quản lý', '97 Nguyễn Thị Thập, Quận 7, TP.HCM', '06/14/1995', '1001');
INSERT INTO "Employee"("FullName", "PhoneNumber", "Email", "Type", "Address", "DateOfBirth", "Account_idAccount") VALUES ('Lê Thị Mai', '0825189671', 'ltmai9857@gmail.com', 'Nhân viên', '100/2/1 Trần Đình Trọng, Quận 2, TP.HCM', '08/01/1997', '1002');
INSERT INTO "Employee"("FullName", "PhoneNumber", "Email", "Type", "Address", "DateOfBirth", "Account_idAccount") VALUES ('Nguyễn Văn Duy', '0824187956', 'nvduy998@gmail.com', 'Nhân viên', '512/3/1 Huỳnh Tấn Phát, Quận 7, TP.HCM', '07/24/1998', '1003');

INSERT INTO "Book"("BookName", "Author", "Topic", "Quantity", "Price") VALUES ('Truy Tìm Ký Ức 1', 'Đình Mặc', 'Tiểu thuyết', '491', '195000');
INSERT INTO "Book"("BookName", "Author", "Topic", "Quantity", "Price") VALUES ('Truy Tìm Ký Ức 2', 'Đình Mặc', 'Tiểu  thuyết', '385', '175000');
INSERT INTO "Book"("BookName", "Author", "Topic", "Quantity", "Price") VALUES ('Harry Potter', 'J. K. Rowling', 'Kỳ ảo', '529', '200000');
INSERT INTO "Book"("BookName", "Author", "Topic", "Quantity", "Price") VALUES ('Doraemon', 'Fujiko Fujio', 'Truyện tranh', '375', '30000');
INSERT INTO "Book"("BookName", "Author", "Topic", "Quantity", "Price") VALUES ('Mắt biếc', 'Nguyễn Nhật Ánh', 'Tiểu thuyết truyện ngắn', '640', '90000');
INSERT INTO "Book"("BookName", "Author", "Topic", "Quantity", "Price") VALUES ('Tâm Lý Học – Phác Họa Chân Dung Kẻ Phạm Tội ', 'Diệp Hồng Vũ', 'Tâm lý', '396', '200000');
INSERT INTO "Book"("BookName", "Author", "Topic", "Quantity", "Price") VALUES ('Sherlock Holmes', 'Athur Conan Doyle', 'Trinh Thám', '308', '280000');
INSERT INTO "Book"("BookName", "Author", "Topic", "Quantity", "Price") VALUES ('Chạng Vạng', 'Stephenie Meyer', 'Tiểu thuyết', '350', '180000');
INSERT INTO "Book"("BookName", "Author", "Topic", "Quantity", "Price") VALUES ('Trăng Non', 'Stephenie Meyer', 'Tiểu thuyết', '548', '185000');
INSERT INTO "Book"("BookName", "Author", "Topic", "Quantity", "Price") VALUES ('Overlord (Vol 1)', 'Kugane Maruyama', 'Light novel', '387', '95000');

INSERT INTO "Receipt"("TotalMoney", "DateCreate", "Customer_idCustomer", "Employee_idEmployee") VALUES ('400000', '01/05/2022', '2005', '3004');
INSERT INTO "Receipt"("TotalMoney", "DateCreate", "Customer_idCustomer", "Employee_idEmployee") VALUES ('645000', '01/16/2022', '2004', '3003');
INSERT INTO "Receipt"("TotalMoney", "DateCreate", "Customer_idCustomer", "Employee_idEmployee") VALUES ('585000', '01/19/2022', '2002', '3004');
INSERT INTO "Receipt"("TotalMoney", "DateCreate", "Customer_idCustomer", "Employee_idEmployee") VALUES ('670000', '01/22/2022', '2002', '3003');
INSERT INTO "Receipt"("TotalMoney", "DateCreate", "Customer_idCustomer", "Employee_idEmployee") VALUES ('380000', '01/28/2022', '2003', '3004');
INSERT INTO "Receipt"("TotalMoney", "DateCreate", "Customer_idCustomer", "Employee_idEmployee") VALUES ('280000', '02/06/2022', '2001', '3003');
INSERT INTO "Receipt"("TotalMoney", "DateCreate", "Customer_idCustomer", "Employee_idEmployee") VALUES ('570000', '02/14/2022', '2002', '3003');
INSERT INTO "Receipt"("TotalMoney", "DateCreate", "Customer_idCustomer", "Employee_idEmployee") VALUES ('580000', '02/19/2022', '2006', '3004');
INSERT INTO "Receipt"("TotalMoney", "DateCreate", "Customer_idCustomer", "Employee_idEmployee") VALUES ('565000', '02/27/2022', '2004', '3003');
INSERT INTO "Receipt"("TotalMoney", "DateCreate", "Customer_idCustomer", "Employee_idEmployee") VALUES ('365000', '03/09/2022', '2003', '3004');
INSERT INTO "Receipt"("TotalMoney", "DateCreate", "Customer_idCustomer", "Employee_idEmployee") VALUES ('520000', '03/18/2022', '2002', '3004');
INSERT INTO "Receipt"("TotalMoney", "DateCreate", "Customer_idCustomer", "Employee_idEmployee") VALUES ('290000', '03/20/2022', '2006', '3004');
INSERT INTO "Receipt"("TotalMoney", "DateCreate", "Customer_idCustomer", "Employee_idEmployee") VALUES ('295000', '03/25/2022', '2002', '3003');
INSERT INTO "Receipt"("TotalMoney", "DateCreate", "Customer_idCustomer", "Employee_idEmployee") VALUES ('280000', '03/29/2022', '2004', '3003');
INSERT INTO "Receipt"("TotalMoney", "DateCreate", "Customer_idCustomer", "Employee_idEmployee") VALUES ('760000', '04/13/2022', '2002', '3004');
INSERT INTO "Receipt"("TotalMoney", "DateCreate", "Customer_idCustomer", "Employee_idEmployee") VALUES ('475000', '04/16/2022', '2003', '3003');
INSERT INTO "Receipt"("TotalMoney", "DateCreate", "Customer_idCustomer", "Employee_idEmployee") VALUES ('845000', '04/20/2022', '2005', '3004');

INSERT INTO "Detail_Receipt" VALUES ('10006', '20000', '2');
INSERT INTO "Detail_Receipt" VALUES ('10009', '20001', '1');
INSERT INTO "Detail_Receipt" VALUES ('10008', '20001', '1');
INSERT INTO "Detail_Receipt" VALUES ('10007', '20001', '1');
INSERT INTO "Detail_Receipt" VALUES ('10010', '20002', '1');
INSERT INTO "Detail_Receipt" VALUES ('10004', '20002', '4');
INSERT INTO "Detail_Receipt" VALUES ('10001', '20002', '1');
INSERT INTO "Detail_Receipt" VALUES ('10002', '20002', '1');
INSERT INTO "Detail_Receipt" VALUES ('10001', '20003', '1');
INSERT INTO "Detail_Receipt" VALUES ('10010', '20003', '1');
INSERT INTO "Detail_Receipt" VALUES ('10006', '20003', '1');
INSERT INTO "Detail_Receipt" VALUES ('10008', '20003', '1');
INSERT INTO "Detail_Receipt" VALUES ('10003', '20004', '1');
INSERT INTO "Detail_Receipt" VALUES ('10005', '20004', '2');
INSERT INTO "Detail_Receipt" VALUES ('10005', '20005', '1');
INSERT INTO "Detail_Receipt" VALUES ('10010', '20005', '2');
INSERT INTO "Detail_Receipt" VALUES ('10003', '20006', '1');
INSERT INTO "Detail_Receipt" VALUES ('10002', '20006', '1');
INSERT INTO "Detail_Receipt" VALUES ('10001', '20006', '1');
INSERT INTO "Detail_Receipt" VALUES ('10007', '20007', '1');
INSERT INTO "Detail_Receipt" VALUES ('10004', '20007', '10');
INSERT INTO "Detail_Receipt" VALUES ('10009', '20008', '1');
INSERT INTO "Detail_Receipt" VALUES ('10008', '20008', '1');
INSERT INTO "Detail_Receipt" VALUES ('10006', '20008', '1');
INSERT INTO "Detail_Receipt" VALUES ('10009', '20009', '1');
INSERT INTO "Detail_Receipt" VALUES ('10008', '20009', '1');
INSERT INTO "Detail_Receipt" VALUES ('10004', '20010', '5');
INSERT INTO "Detail_Receipt" VALUES ('10002', '20010', '1');
INSERT INTO "Detail_Receipt" VALUES ('10001', '20010', '1');
INSERT INTO "Detail_Receipt" VALUES ('10006', '20011', '1');
INSERT INTO "Detail_Receipt" VALUES ('10005', '20011', '1');
INSERT INTO "Detail_Receipt" VALUES ('10003', '20012', '1');
INSERT INTO "Detail_Receipt" VALUES ('10010', '20012', '1');
INSERT INTO "Detail_Receipt" VALUES ('10007', '20013', '1');
INSERT INTO "Detail_Receipt" VALUES ('10006', '20014', '1');
INSERT INTO "Detail_Receipt" VALUES ('10010', '20014', '2');
INSERT INTO "Detail_Receipt" VALUES ('10002', '20014', '1');
INSERT INTO "Detail_Receipt" VALUES ('10001', '20014', '1');
INSERT INTO "Detail_Receipt" VALUES ('10010', '20015', '1');
INSERT INTO "Detail_Receipt" VALUES ('10005', '20015', '1');
INSERT INTO "Detail_Receipt" VALUES ('10004', '20015', '3');
INSERT INTO "Detail_Receipt" VALUES ('10003', '20015', '1');
INSERT INTO "Detail_Receipt" VALUES ('10009', '20016', '1');
INSERT INTO "Detail_Receipt" VALUES ('10008', '20016', '1');
INSERT INTO "Detail_Receipt" VALUES ('10007', '20016', '1');
INSERT INTO "Detail_Receipt" VALUES ('10006', '20016', '1');

INSERT INTO "Dept_History"("DateCreate", "Dept_Money", "Customer_idCustomer") VALUES ('01/22/2022', '200000', '2002');
INSERT INTO "Dept_History"("DateCreate", "Dept_Money", "Customer_idCustomer") VALUES ('01/19/2022', '100000', '2002');
INSERT INTO "Dept_History"("DateCreate", "Dept_Money", "Customer_idCustomer") VALUES ('01/16/2022', '150000', '2004');
INSERT INTO "Dept_History"("DateCreate", "Dept_Money", "Customer_idCustomer") VALUES ('01/05/2022', '200000', '2005');
INSERT INTO "Dept_History"("DateCreate", "Dept_Money", "Customer_idCustomer") VALUES ('01/28/2022', '100000', '2003');
INSERT INTO "Dept_History"("DateCreate", "Dept_Money", "Customer_idCustomer") VALUES ('02/27/2022', '170000', '2004');
INSERT INTO "Dept_History"("DateCreate", "Dept_Money", "Customer_idCustomer") VALUES ('02/19/2022', '200000', '2006');
INSERT INTO "Dept_History"("DateCreate", "Dept_Money", "Customer_idCustomer") VALUES ('02/14/2022', '200000', '2002');
INSERT INTO "Dept_History"("DateCreate", "Dept_Money", "Customer_idCustomer") VALUES ('02/06/2022', '130000', '2001');
INSERT INTO "Dept_History"("DateCreate", "Dept_Money", "Customer_idCustomer") VALUES ('03/29/2022', '145000', '2004');
INSERT INTO "Dept_History"("DateCreate", "Dept_Money", "Customer_idCustomer") VALUES ('03/25/2022', '175000', '2002');
INSERT INTO "Dept_History"("DateCreate", "Dept_Money", "Customer_idCustomer") VALUES ('03/20/2022', '100000', '2006');
INSERT INTO "Dept_History"("DateCreate", "Dept_Money", "Customer_idCustomer") VALUES ('03/18/2022', '200000', '2002');
INSERT INTO "Dept_History"("DateCreate", "Dept_Money", "Customer_idCustomer") VALUES ('03/09/2022', '180000', '2003');
INSERT INTO "Dept_History"("DateCreate", "Dept_Money", "Customer_idCustomer") VALUES ('04/16/2022', '200000', '2003');
INSERT INTO "Dept_History"("DateCreate", "Dept_Money", "Customer_idCustomer") VALUES ('04/13/2022', '200000', '2002');
INSERT INTO "Dept_History"("DateCreate", "Dept_Money", "Customer_idCustomer") VALUES ('04/20/2022', '200000', '2005');

INSERT INTO "Bill"("Money", "DateCreate", "Customer_idCustomer") VALUES ('180000', '01/28/2022', '2002');
INSERT INTO "Bill"("Money", "DateCreate", "Customer_idCustomer") VALUES ('70000', '01/19/2022', '2005');
INSERT INTO "Bill"("Money", "DateCreate", "Customer_idCustomer") VALUES ('70000', '01/21/2022', '2002');
INSERT INTO "Bill"("Money", "DateCreate", "Customer_idCustomer") VALUES ('100000', '01/10/2022', '2005');
INSERT INTO "Bill"("Money", "DateCreate", "Customer_idCustomer") VALUES ('100000', '01/23/2022', '2004');
INSERT INTO "Bill"("Money", "DateCreate", "Customer_idCustomer") VALUES ('80000', '01/29/2022', '2003');
INSERT INTO "Bill"("Money", "DateCreate", "Customer_idCustomer") VALUES ('100000', '02/15/2022', '2001');
INSERT INTO "Bill"("Money", "DateCreate", "Customer_idCustomer") VALUES ('170000', '02/18/2022', '2002');
INSERT INTO "Bill"("Money", "DateCreate", "Customer_idCustomer") VALUES ('150000', '02/22/2022', '2006');
INSERT INTO "Bill"("Money", "DateCreate", "Customer_idCustomer") VALUES ('130000', '02/28/2022', '2004');
INSERT INTO "Bill"("Money", "DateCreate", "Customer_idCustomer") VALUES ('90000', '03/17/2022', '2003');
INSERT INTO "Bill"("Money", "DateCreate", "Customer_idCustomer") VALUES ('70000', '03/12/2022', '2003');
INSERT INTO "Bill"("Money", "DateCreate", "Customer_idCustomer") VALUES ('80000', '03/20/2022', '2002');
INSERT INTO "Bill"("Money", "DateCreate", "Customer_idCustomer") VALUES ('70000', '03/22/2022', '2002');
INSERT INTO "Bill"("Money", "DateCreate", "Customer_idCustomer") VALUES ('70000', '03/25/2022', '2006');
INSERT INTO "Bill"("Money", "DateCreate", "Customer_idCustomer") VALUES ('150000', '03/29/2022', '2002');
INSERT INTO "Bill"("Money", "DateCreate", "Customer_idCustomer") VALUES ('100000', '03/31/2022', '2004');
INSERT INTO "Bill"("Money", "DateCreate", "Customer_idCustomer") VALUES ('190000', '04/20/2022', '2003');
INSERT INTO "Bill"("Money", "DateCreate", "Customer_idCustomer") VALUES ('150000', '04/15/2022', '2002');
INSERT INTO "Bill"("Money", "DateCreate", "Customer_idCustomer") VALUES ('170000', '04/27/2022', '2005');

INSERT INTO "Regulation"("Detail", "Status", "Value") VALUES ('Số tiền nợ tối đa khách hàng có thể nợ', 'Đang sử dụng', '200000');
INSERT INTO "Regulation"("Detail", "Status", "Value") VALUES ('Lượng tồn tối thiểu sau khi bán', 'Đang sử dụng', '20');
INSERT INTO "Regulation"("Detail", "Status", "Value") VALUES ('Số lượng nhập tối thiểu', 'Đang sử dụng', '150');
INSERT INTO "Regulation"("Detail", "Status", "Value") VALUES ('Số lượng tồn tối thiểu trước khi nhập', 'Đang sử dụng', '300');

INSERT INTO "Import_History"("DateCreate") VALUES ('01/02/2022');
INSERT INTO "Import_History"("DateCreate") VALUES ('01/06/2022');
INSERT INTO "Import_History"("DateCreate") VALUES ('01/16/2022');
INSERT INTO "Import_History"("DateCreate") VALUES ('02/04/2022');
INSERT INTO "Import_History"("DateCreate") VALUES ('02/09/2022');
INSERT INTO "Import_History"("DateCreate") VALUES ('03/01/2022');
INSERT INTO "Import_History"("DateCreate") VALUES ('03/15/2022');
INSERT INTO "Import_History"("DateCreate") VALUES ('04/04/2022');
INSERT INTO "Import_History"("DateCreate") VALUES ('04/13/2022');

INSERT INTO "Import_Detail" VALUES ('10001', '5000', '200');
INSERT INTO "Import_Detail" VALUES ('10001', '5002', '150');
INSERT INTO "Import_Detail" VALUES ('10002', '5000', '150');
INSERT INTO "Import_Detail" VALUES ('10003', '5000', '200');
INSERT INTO "Import_Detail" VALUES ('10004', '5000', '150');
INSERT INTO "Import_Detail" VALUES ('10005', '5000', '180');
INSERT INTO "Import_Detail" VALUES ('10006', '5001', '160');
INSERT INTO "Import_Detail" VALUES ('10006', '5002', '150');
INSERT INTO "Import_Detail" VALUES ('10007', '5001', '200');
INSERT INTO "Import_Detail" VALUES ('10008', '5002', '150');
INSERT INTO "Import_Detail" VALUES ('10009', '5002', '160');
INSERT INTO "Import_Detail" VALUES ('10010', '5002', '170');
INSERT INTO "Import_Detail" VALUES ('10007', '5003', '180');
INSERT INTO "Import_Detail" VALUES ('10006', '5003', '170');
INSERT INTO "Import_Detail" VALUES ('10004', '5003', '160');
INSERT INTO "Import_Detail" VALUES ('10002', '5003', '150');
INSERT INTO "Import_Detail" VALUES ('10010', '5004', '150');
INSERT INTO "Import_Detail" VALUES ('10009', '5004', '230');
INSERT INTO "Import_Detail" VALUES ('10008', '5004', '160');
INSERT INTO "Import_Detail" VALUES ('10005', '5004', '180');
INSERT INTO "Import_Detail" VALUES ('10003', '5004', '170');
INSERT INTO "Import_Detail" VALUES ('10001', '5004', '200');
INSERT INTO "Import_Detail" VALUES ('10010', '5005', '400');
INSERT INTO "Import_Detail" VALUES ('10009', '5005', '300');
INSERT INTO "Import_Detail" VALUES ('10001', '5005', '150');
INSERT INTO "Import_Detail" VALUES ('10008', '5006', '190');
INSERT INTO "Import_Detail" VALUES ('10007', '5006', '200');
INSERT INTO "Import_Detail" VALUES ('10006', '5006', '180');
INSERT INTO "Import_Detail" VALUES ('10005', '5006', '200');
INSERT INTO "Import_Detail" VALUES ('10004', '5006', '150');
INSERT INTO "Import_Detail" VALUES ('10003', '5006', '220');
INSERT INTO "Import_Detail" VALUES ('10002', '5006', '200');
INSERT INTO "Import_Detail" VALUES ('10001', '5006', '170');
INSERT INTO "Import_Detail" VALUES ('10008', '5007', '220');
INSERT INTO "Import_Detail" VALUES ('10003', '5007', '170');
INSERT INTO "Import_Detail" VALUES ('10010', '5007', '180');
INSERT INTO "Import_Detail" VALUES ('10007', '5007', '200');
INSERT INTO "Import_Detail" VALUES ('10002', '5007', '190');
INSERT INTO "Import_Detail" VALUES ('10006', '5008', '210');
INSERT INTO "Import_Detail" VALUES ('10005', '5008', '180');
INSERT INTO "Import_Detail" VALUES ('10004', '5008', '190');
INSERT INTO "Import_Detail" VALUES ('10003', '5008', '160');
INSERT INTO "Import_Detail" VALUES ('10002', '5008', '170');
INSERT INTO "Import_Detail" VALUES ('10001', '5008', '150');
INSERT INTO "Import_Detail" VALUES ('10009', '5008', '200');

