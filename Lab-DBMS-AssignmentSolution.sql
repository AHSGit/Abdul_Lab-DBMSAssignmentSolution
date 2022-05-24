drop database if exists EShop_db;

create database EShop_db;

use EShop_db;

drop table if exists supplier,customer,category,product,supplier_pricing,orders,rating;

create table supplier(SUPP_ID INT PRIMARY KEY, 
					  SUPP_NAME varchar(50) NOT NULL,
                      SUPP_CITY varchar(50) NOT NULL,
                      SUPP_PHONE varchar(50) NOT NULL
);

create table customer(CUS_ID INT PRIMARY KEY,
					  CUS_NAME VARCHAR(20) NOT NULL,
                      CUS_PHONE VARCHAR(10) NOT NULL,
                      CUS_CITY VARCHAR(30) NOT NULL,
                      CUS_GENDER CHAR
);

create table category(CAT_ID INT PRIMARY KEY, 
					  CAT_NAME VARCHAR(20) NOT NULL
);

create table product(PRO_ID INT PRIMARY KEY, 
					 PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
                     PRO_DESC VARCHAR(60),
                     CAT_ID INT,
                     FOREIGN KEY (CAT_ID) REFERENCES category(CAT_ID)
);

create table supplier_pricing(PRICING_ID INT PRIMARY KEY,
							  PRO_ID INT,
                              FOREIGN KEY(PRO_ID) REFERENCES product(PRO_ID),
                              SUPP_ID INT,
                              FOREIGN KEY(SUPP_ID) REFERENCES supplier(SUPP_ID),
                              SUPP_PRICE INT DEFAULT 0
);
 
create table orders(ORD_ID INT PRIMARY KEY,
					ORD_AMOUNT INT NOT NULL,
                    ORD_DATE DATE NOT NULL,
                    CUS_ID INT,
                    FOREIGN KEY(CUS_ID) REFERENCES customer(CUS_ID),
                    PRICING_ID INT,
                    FOREIGN KEY(PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);

create table rating(RAT_ID INT PRIMARY KEY,
					ORD_ID INT,
                    FOREIGN KEY(ORD_ID) REFERENCES orders(ORD_ID),
                    RAT_RATSTARS INT NOT NULL
);

insert into supplier values(1, "Rajesh Retails", "Delhi", "1234567890");
insert into supplier values(2, "Appario Ltd.", "Mumbai", "2589631470");
insert into supplier values(3, "Knome Products", "Banglore", "9785462315");
insert into supplier values(4, "Bansal Retails", "Kochi", "8975463285");
insert into supplier values(5, "Mittal Ltd.", "Lucknow", "7898456532");

insert into customer values(1, "AAKASH", "9999999999", "DELHI", "M");
insert into customer values(2, "AMAN", "9785463215", "NOIDA", "M");
insert into customer values(3, "NEHA", "9999999999", "MUMBAI", "F");
insert into customer values(4, "MEGHA", "9994562399", "KOLKATA", "F");
insert into customer values(5, "PULKIT", "7895999999", "LUCKNOW", "M");

insert into category values(1, "BOOKS");
insert into category values(2, "GAMES");
insert into category values(3, "GROCERIES");
insert into category values(4, "ELECTRONICS");
insert into category values(5, "CLOTHES");

insert into product values(1, "GTA V", "Windows 7 and above with i5 processor and 8GB RAM", 2);
insert into product values(2, "TSHIRT", "SIZE-L with Black, Blue and White variations", 5);
insert into product values(3, "ROG LAPTOP", "Windows 10 with 15inch screen, i7 processor, 1TB SSD", 4);
insert into product values(4, "OATS", "Highly Nutritious from Nestle", 3);
insert into product values(5, "HARRY POTTER", "Best Collection of all time by J.K Rowling", 1);
insert into product values(6, "MILK", "1L Toned MIlk", 3);
insert into product values(7, "Boat Earphones", "1.5Meter long Dolby Atmos", 4);
insert into product values(8, "Jeans", "Stretchable Denim Jeans with various sizes and color", 5);
insert into product values(9, "Project IGI", "Compatible with windows 7 and above", 2);
insert into product values(10, "Hoodie", "Black GUCCI for 13 yrs and above", 5);
insert into product values(11, "Rich Dad Poor Dad", "Written by Robert Kiyosaki", 1);
insert into product values(12, "Train Your Brain", "By Shireen Stephen", 1);

insert into supplier_pricing values(1, 1, 2, 1500);
insert into supplier_pricing values(2, 3, 5, 30000);
insert into supplier_pricing values(3, 5, 1, 3000);
insert into supplier_pricing values(4, 2, 3, 2500);
insert into supplier_pricing values(5, 4, 1, 1000);
insert into supplier_pricing values(6, 12, 2, 780);
insert into supplier_pricing values(7, 12, 4, 789);
insert into supplier_pricing values(8, 3, 1, 31000);
insert into supplier_pricing values(9, 1, 5, 1450);
insert into supplier_pricing values(10, 4, 2, 999);
insert into supplier_pricing values(11, 7, 3, 549);
insert into supplier_pricing values(12, 7, 4, 529);
insert into supplier_pricing values(13, 6, 2, 105);
insert into supplier_pricing values(14, 6, 1, 99);
insert into supplier_pricing values(15, 2, 5, 2999);
insert into supplier_pricing values(16, 5, 2, 2999);

insert into orders values(101, 1500, '2021-10-06', 2, 1);
insert into orders values(102, 1000, '2021-10-12', 3, 5);
insert into orders values(103, 30000, '2021-09-16', 5, 2);
insert into orders values(104, 1500, '2021-10-05', 1, 1);
insert into orders values(105, 3000, '2021-08-16', 4, 3);
insert into orders values(106, 1450, '2021-08-18', 1, 9);
insert into orders values(107, 789, '2021-09-01', 3, 7);
insert into orders values(108, 780, '2021-09-07', 5, 6);
insert into orders values(109, 3000, '2021-09-10', 5, 3);
insert into orders values(110, 2500, '2021-09-10', 2, 4);
insert into orders values(111, 1000, '2021-09-15', 4, 5);
insert into orders values(112, 789, '2021-09-16', 4, 7);
insert into orders values(113, 31000, '2021-09-16', 1, 8);
insert into orders values(114, 1000, '2021-09-16', 3, 5);
insert into orders values(115, 3000, '2021-09-16', 5, 3);
insert into orders values(116, 99, '2021-09-17', 2, 14);

insert into rating values(1, 101, 4);
insert into rating values(2, 102, 3);
insert into rating values(3, 103, 1);
insert into rating values(4, 104, 2);
insert into rating values(5, 105, 4);
insert into rating values(6, 106, 3);
insert into rating values(7, 107, 4);
insert into rating values(8, 108, 4);
insert into rating values(9, 109, 3);
insert into rating values(10, 110, 5);
insert into rating values(11, 111, 3);
insert into rating values(12, 112, 4);
insert into rating values(13, 113, 2);
insert into rating values(14, 114, 1);
insert into rating values(15, 115, 1);
insert into rating values(16, 116, 0);


/*Q3: Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.*/

select c.CUS_GENDER, count(distinct c.CUS_ID) as ORDER_COUNT
from customer c	
join orders o
on c.CUS_ID = o.CUS_ID where ORD_AMOUNT >= 3000
group by c.CUS_GENDER;


/*Q4: Display all the orders along with product name ordered by a customer having Customer_Id = 2 */

select p.PRO_NAME, o.ORD_AMOUNT, ORD_DATE
from orders o
join supplier_pricing sp
on o.PRICING_ID = sp.PRICING_ID
join product p
on sp.PRO_ID = p.PRO_ID
where o.CUS_ID = 2;


/*Q5: Display the Supplier details who can supply more than one product. */

select s.*, count(sp.SUPP_ID) as PROD_COUNT 
from supplier_pricing sp
join supplier s
on s.SUPP_ID = sp.SUPP_ID
group by sp.SUPP_ID having count(sp.SUPP_ID) > 1;


/*Q6: Find the least expensive product from each category and 
print the table with category id, name, product name and price of the product */

select T4.CAT_ID, T4.CAT_NAME, p.PRO_NAME, T4.MIN_PRICE from 
	(select T3.ID as CAT_ID, T3.CAT as CAT_NAME, T3.PRICE3 as MIN_PRICE, sp.PRO_ID from
		(select c.CAT_ID as ID, c.CAT_NAME as CAT, min(T2.PRICE2) as PRICE3
		from category c
		join (select p.CAT_ID, T1.PRICE1 as PRICE2
			from product p 
			join (select sp.PRO_ID, min(sp.SUPP_PRICE) as PRICE1
				from supplier_pricing sp 
				group by sp.PRO_ID) as T1
			on T1.PRO_ID = p.PRO_ID) as T2
		on c.CAT_ID = T2.CAT_ID
		group by T2.CAT_ID) as T3
	join supplier_pricing sp
	on T3.PRICE3 = sp.SUPP_PRICE) as T4
join product p
on T4.PRO_ID = p.PRO_ID
order by T4.CAT_ID;



/*Q7: Display the Id and Name of the Product ordered after “2021-10-05” */

select p.PRO_ID, p.PRO_NAME
from product p
join (select sp.PRO_ID 
from supplier_pricing sp
join (select PRICING_ID from orders o where ORD_DATE > '2021-10-05') as T1
on T1.PRICING_ID = sp.PRICING_ID) as T2
on T2.PRO_ID = p.PRO_ID;


/*Q8: Display customer name and gender whose names start or end with character 'A'. */

select CUS_NAME, CUS_GENDER 
from customer where CUS_NAME like 'A%' or CUS_NAME like '%A';


/*Q9: Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, 
If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.*/

drop procedure if exists proc;

DELIMITER ##
CREATE PROCEDURE proc()
BEGIN
select report.SUPP_ID, report.SUPP_NAME, report.Average,
CASE
WHEN report.Average = 5 THEN 'Excellent Service'
WHEN report.Average > 4 THEN 'Good Service'
WHEN report.Average > 2 THEN 'Average Service'
ELSE 'Poor Service'
END AS Type_of_Service from
	(select T3.SUPP_ID, supplier.SUPP_NAME, T3.Average from
		(select T2.SUPP_ID, sum(T2.RAT_RATSTARS)/count(T2.RAT_RATSTARS) as Average from
			(select supplier_pricing.SUPP_ID, T1.ORD_ID, T1.RAT_RATSTARS from supplier_pricing inner join
				(select orders.PRICING_ID, rating.ORD_ID, rating.RAT_RATSTARS
				from orders inner join rating 
                on rating.ORD_ID = orders.ORD_ID) as T1 
			on T1.PRICING_ID = supplier_pricing.PRICING_ID) as T2 
		group by supplier_pricing.SUPP_ID) as T3 
	inner join supplier where T3.SUPP_ID = supplier.SUPP_ID) as report;
END ##
DELIMITER ;

call proc();