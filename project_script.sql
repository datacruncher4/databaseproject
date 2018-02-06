
select * from inventory;

insert into inventory (Product_id, ProductCategory_id, Title, Price, instock, onorder, yearreleased) 
values (1, 1, 'Halo', 29, 33, 4, 1992);
insert into inventory (Product_id, ProductCategory_id, Title, Price, instock, onorder, yearreleased) 
values (2, 1, 'Borderlands', 39, 3, 4, 2009);
insert into inventory (Product_id, ProductCategory_id, Title, Price, instock, onorder, yearreleased) 
values (3, 2, 'XboxOne', 299, 9, 25, 2017);
insert into inventory (Product_id, ProductCategory_id, Title, Price, instock, onorder, yearreleased) 
values (4, 3, 'Alienware', 999, 2, 0, 2016);
insert into inventory (Product_id, ProductCategory_id, Title, Price, instock, onorder, yearreleased) 
values (5, 1, 'NeedForSpeed', 39, 13, 0, 2015);
insert into inventory (Product_id, ProductCategory_id, Title, Price, instock, onorder, yearreleased) 
values (6, 2, 'PS4', 399, 15, 5, 2015);
insert into inventory (Product_id, ProductCategory_id, Title, Price, instock, onorder, yearreleased) 
values (7, 2, 'NintendoWii', 249.99, 8, 0, 2012);
insert into inventory (Product_id, ProductCategory_id, Title, Price, instock, onorder, yearreleased) 
values (10, 3, 'ROG', 1199.49, 5, 2, 2017);
insert into inventory (Product_id, ProductCategory_id, Title, Price, instock, onorder, yearreleased) 
values (12, 2, 'Xbox360', 199.29, 35, 0, 2008);
insert into inventory (Product_id, ProductCategory_id, Title, Price, instock, onorder, yearreleased) 
values (14, 1, 'GTA5', 49.99, 45, 0, 2015);


select * from Games;
select * from Inventory;


describe games;
insert into games values (13, 'PC', 4.9, 'No', 'Used');
insert into games values (14, 'PS4', 4.3, 'YES', 'New');


select * from Inventory;
describe consoles;
insert into consoles values (3, 'Microsoft', 'Black', 'No', 'NEW', 'www.xbox.com');
insert into consoles values (12, 'Microsoft', 'White', 'No', 'USED', 'www.xbox360.com');
insert into consoles values (6, 'Sony', 'White', 'Yes', 'NEW', 'www.ps4.com');
insert into consoles values (11, 'Sony', 'Silver', 'No', 'NEW', 'www.ps3.com');
insert into consoles values (7, 'Nintendo', 'Grey', 'Yes', 'NEW', 'www.nintendowii.com');


call gamingPCDetails_proc();

describe gamingpc;

insert into gamingpc values (4, 'Dell', 13, 16, 1024, 'i7');
insert into gamingpc values (8, 'Dell', 15, 12, 512, 'intel i5');
insert into gamingpc values (9, 'HP', 17, 8, 512, 'AMDRadeon');
insert into gamingpc values (10, 'ASUS', 15, 16, 1024, 'intel i7');


select * from GamingPC;
select * from Inventory;


describe ProductCategory;
insert into ProductCategory values (1, 'Games');
insert into ProductCategory values (2, 'Consoles');
insert into ProductCategory values (3, 'GamingPC');


insert into games values (1, 'Xbox', 5, 'YES', 'New');

select * from ProductCategory;

Select p.Product_id, p.ProductCategory_id, p.Title, p.Price, p.instock, p.onorder, p.yearreleased, g.Platform, g.rating, g.3d, g.Condition
from inventory p inner join games g on p.Product_id=g.product_id;

call game_details();

Select * from ProductCategory;
insert into ProductCategory values (3, 'GamingPC');


describe OrderDetails;
insert into orderDetails values (1,1,2,23,1,0);


describe Warehouse;
insert into warehouse values (1,'BostonStorage',1,45);
insert into warehouse values (1,'BostonStorage',2,25);


call gamesDetails_proc();
select * from store;
describe store;
DELETE FROM store where Store_id = 1;
insert into store values (1,'Gamestop','857-233-6453','boston.gamestop@gmail.com','76 Boylston Street','Floor 2','Boston','Massachusetts',20212);
insert into store values (2,'Gamestop','857-866-2961','caligamestop@gmail.com','256 Whistler Street','Block 5','Los Angeles','California',90212);

select * from employee;
describe employee;
alter table employee drop column pay;
DELETE FROM employee where employee_id = 1;
insert into employee values (4,'Don','Serina',41,'MALE','StoreManager',2,4);
insert into employee values (6,'Janet','Majors',29,'FEMALE','SalesRepresentative',2,4);
insert into employee values (5,'Rob','Patton',22,'MALE','SalesRepresentative',2,4);
insert into employee values (3,'Jack','Black',28,'MALE','SalesRepresentative',1,1);



select * from Customer;
describe customer;
alter table customer drop column middlename;
DELETE FROM employee where employee_id = 1;
insert into Customer values (1,'Dave','Lombardo','MALE',34,2,'55 Forsyth Street','Block 4','Boston','Massachusetts',20332);
insert into Customer values (2,'Alissa','Gluze','FEMALE',28,6,'46 Coulombus Street','Apartment 3','Baltimore','Washington DC',10697);
insert into Customer values (3,'Tom','Araya','MALE',42,5,'88 Brookline Ave','Suit 23','Orange County','Massachusetts',20332);


use mydbwoaddress;

select * from inventory;
select * from orders;
select * from orderdetails;
describe orderdetails;
alter table customer drop column middlename;
DELETE FROM employee where employee_id = 1;
insert into orderdetails values (1,1,2,29.99);
insert into orderdetails values (1,3,1,229.99);
insert into orderdetails values (2,7,1,229.99);
insert into orderdetails values (3,14,2,34.99);
insert into orderdetails values (3,13,2,3.99);
insert into orderdetails values (4,4,1,999.99);


alter table OrderDetails
change price priceperpiece decimal(10,2);

use mydbwoaddress;



select * from orders;
describe orders;
alter table orders drop column expecteddate;
DELETE FROM employee where employee_id = 1;
insert into orders values (1,20171201,20171207,'Shipped',1);
insert into orders values (2,20171017,20171027,'Shipped',2);
insert into orders values (3,20171214,20171224,'InProcess',1);
insert into orders values (4,20171109,20171117,'Shipped',2);



describe orders;

alter table orders
add foreign key (Customer_Customer_id) references Customer (Customer_id);



CREATE VIEW SalePerOrder AS
SELECT 
order_id, SUM(Orderquantity * priceperpiece) total
FROM
orderdetails
GROUP by order_id
ORDER BY total DESC;


-- console view

SELECT `console_view`.`Product_id`,
    `console_view`.`Category`,
    `console_view`.`Title`,
    `console_view`.`Price`,
    `console_view`.`Instock`,
    `console_view`.`Onorder`,
    `console_view`.`YearReleased`,
    `console_view`.`Manufacturer`,
    `console_view`.`colour`,
    `console_view`.`VR`,
    `console_view`.`Condition`,
    `console_view`.`website`
FROM `mydbwoaddress`.`console_view`;

-- game view

SELECT `game_view`.`Product_id`,
    `game_view`.`Category`,
    `game_view`.`Title`,
    `game_view`.`Price`,
    `game_view`.`Instock`,
    `game_view`.`Onorder`,
    `game_view`.`YearReleased`,
    `game_view`.`Platform`,
    `game_view`.`Rating`,
    `game_view`.`3D`,
    `game_view`.`Condition`
FROM `mydbwoaddress`.`game_view`;

-- gamingpc view

SELECT `gamingpc_view`.`Product_id`,
    `gamingpc_view`.`Category`,
    `gamingpc_view`.`Title`,
    `gamingpc_view`.`Price`,
    `gamingpc_view`.`Instock`,
    `gamingpc_view`.`Onorder`,
    `gamingpc_view`.`YearReleased`,
    `gamingpc_view`.`Manufacturer`,
    `gamingpc_view`.`Display in inches`,
    `gamingpc_view`.`RAM in GBs`,
    `gamingpc_view`.`HardDiskCapacity`
FROM `mydbwoaddress`.`gamingpc_view`;


-- totalperorder view

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `totalperorder_view` AS
    SELECT 
        `orderdetails`.`Order_id` AS `order_id`,
        SUM((`orderdetails`.`OrderQuantity` * `orderdetails`.`priceperpiece`)) AS `total`
    FROM
        `orderdetails`
    GROUP BY `orderdetails`.`Order_id`
    ORDER BY `total` DESC


-- proc shipping time

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ShippingTime`(in customerNo int(11), out shippingtime varchar(50))
BEGIN
DECLARE custCity varchar(50);
SELECT city INTO custCity
FROM customer
WHERE customer_id = customerNo;
 
CASE custCity
WHEN  'Boston' THEN
SET shippingtime = 'Delivery within 2 days';
WHEN 'Los Angeles' THEN
SET shippingtime = 'Delivery within 3 days';
ELSE
SET shippingtime = 'Delivery within 5 days';
END CASE;
 
END$$
DELIMITER ;

-- proc total items not on order

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `totalitemsNotOnOrder`(IN instorecount int,OUT notonorder INT)
BEGIN
SELECT count(product_id)
INTO notonorder
FROM inventory
WHERE onorder = instorecount;

END$$
DELIMITER ;


select * from saleperorder_view;
select * from gamingpc_view;


Delimiter %%
Create trigger instock_trigger
Before insert on inventory
for each row 
Begin
	if (new.inStock < 1) then 
	signal sqlstate '02000' set message_text = 'ERROR: The product cannot be added as it is not in stock';
    end if;
END %% 
Delimiter ;

insert into inventory (Product_id, ProductCategory_id, Title, Price, instock, onorder, yearreleased) 
values (15, 1, 'SuperMario', 14.99, 0, 0, 2004);


