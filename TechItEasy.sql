create table users 
(
	username varchar(50) primary key not null,
	password varchar(50) not null,
	address  varchar(150),
	role varchar(150),
	payScale int,
	vacationDays int
);

create table products 
(
	id serial primary key not null,
	name varchar(150),
	brand varchar(50),
	price real,
	currentStock int,
	sold int,
	dateSold date,
	type varchar(50)
);

create table televisions 
(
	product_id int primary key,
	foreign key (product_id) references products(id),
	height real,
	width real,
	screenQuality varchar(50),
	screenType varchar(50),
	wifi boolean,
	smartTv boolean,
	voiceControl boolean,
	HDR boolean
);

create table remoteControllers 
(
	product_id int primary key,
	foreign key (product_id) references products(id),
	television_id int,
	foreign key (television_id) references televisions(product_id),
	smart boolean,
	batteryType varchar(50)
);

create table ciModules 
(
	product_id int primary key,
	foreign key (product_id) references products(id),
	television_id int,
	foreign key (television_id) references televisions(product_id),
	provider varchar(150),
	encoding varchar(150)
);

create table wallBrackets
(
	product_id int primary key,
	foreign key (product_id) references products(id),
	television_id int,
	foreign key (television_id) references televisions(product_id),
	adjustable boolean,
	attachmentMethod varchar(150),
	height real,
	width real
);

insert into products (name, brand, price, type) 
values
	('Crystal', 'Samsung', 549, 'UHD 55AU7040'),
	('4K TV', 'Philips', 379, '43PUS6504/12' ),
	('HD smart TV', 'Nikkei', 159, 'NH3216SMART'),
	('4K QLED TV', 'Samsung', 709, 'QE55Q60T'),
	('Ultra HD SMART TV', 'Hitachi', 349, '43HAK6152'),
	('The Terrace Wall-Mount', 'Samsung', 127, 'WMN4070TT'),
	('No Gap Wall-Mount', 'Samsung', 127, 'WMN-M15EA'),

insert into televisions (product_id, screenQuality, screenType, wifi, smartTv, voiceControl, HDR)
values
	(1, 'Ultra HD/4K', 'LED-LCD', true, true, false, true),
	(2, 'Ultra HD/4K', 'LED', true, true, false, true),
	(3, 'HD ready', 'LED', true, true, false, false),
	(4, 'Ultra HD/4K', 'QLED', true, true, true, true),
	(5, 'Ultra HD/4K', 'LCD', true, true, true, true);

insert into wallBrackets (product_id, adjustable, attachmentMethod)
values
	(6, true, 'bolts'),
	(7, true, 'bolts');

select * from products

select * from televisions

select * from wallBrackets

select p.name, p.brand, p.price, t.screenQuality
from products p
inner join televisions t 
on p.id = t.product_id;