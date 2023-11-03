DROP TABLE IF EXISTS ProductOrder;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;

CREATE TABLE Product(
    id              VARCHAR(15) NOT NULL,
    pname           VARCHAR(255) NOT NULL,
    price           INT UNSIGNED NOT NULL,
    stock           INT UNSIGNED NOT NULL,
    manufacturer    VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Customer(
    id              VARCHAR(15) NOT NULL,
    cname           VARCHAR(255) NOT NULL,
    city            VARCHAR(255) NOT NULL,
    phone_number    VARCHAR(31) NOT NULL,
    balance         INT UNSIGNED NOT NULL,
    credit          INT UNSIGNED NOT NULL DEFAULT 1000,
    PRIMARY KEY (id)
);

CREATE TABLE ProductOrder(
    id              VARCHAR(15) NOT NULL,
    create_date     DATE NOT NULL,
    customer_id     VARCHAR(15) NOT NULL,
    product_id      VARCHAR(15) NOT NULL,
    quantity        INT UNSIGNED NOT NULL,
    is_filled       BOOLEAN NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (product_id) REFERENCES Product(id)
);

DROP TABLE IF EXISTS OrderAudit;
CREATE TABLE OrderAudit(
    change_time         TIMESTAMP NOT NULL,
    operator            VARCHAR(255) NOT NULL,
    old_order_id        VARCHAR(15),
    old_create_date     DATE,
    old_customer_id     VARCHAR(15),
    old_product_id      VARCHAR(15),
    old_quantity        INT,
    old_is_filled       BOOLEAN,
    new_order_id        VARCHAR(15),
    new_create_date     DATE,
    new_customer_id     VARCHAR(15),
    new_product_id      VARCHAR(15),
    new_quantity        INT,
    new_is_filled       BOOLEAN
);

DROP TABLE IF EXISTS Coupon;
CREATE TABLE Coupon(
    customer_id     VARCHAR(15) NOT NULL,
    discount        DOUBLE NOT NULL
);

INSERT INTO Product (`id`,`pname`,`price`,`stock`,`manufacturer`) VALUES ('P00000000000001','Conveyors',65,3100,'Rodriguez-Ellis');
INSERT INTO Product (`id`,`pname`,`price`,`stock`,`manufacturer`) VALUES ('P00000000000002','Laser Cutters',15,7900,'Boyd, Gutierrez and Lawrence');
INSERT INTO Product (`id`,`pname`,`price`,`stock`,`manufacturer`) VALUES ('P00000000000003','Packaging Machinery',95,5100,'Reed LLC');
INSERT INTO Product (`id`,`pname`,`price`,`stock`,`manufacturer`) VALUES ('P00000000000004','Filters',35,9300,'Lewis, Cunningham and Mcdonald');
INSERT INTO Product (`id`,`pname`,`price`,`stock`,`manufacturer`) VALUES ('P00000000000005','Mixers',75,8700,'Rowe-Anderson');
INSERT INTO Product (`id`,`pname`,`price`,`stock`,`manufacturer`) VALUES ('P00000000000006','CNC Routers',45,10000,'Jarvis-Lang');
INSERT INTO Product (`id`,`pname`,`price`,`stock`,`manufacturer`) VALUES ('P00000000000007','Conveyor Belt',15,6200,'Cox and Sons');
INSERT INTO Product (`id`,`pname`,`price`,`stock`,`manufacturer`) VALUES ('P00000000000008','Hydraulic Press',30,200,'Grant PLC');
INSERT INTO Product (`id`,`pname`,`price`,`stock`,`manufacturer`) VALUES ('P00000000000009','Conveyor Rollers',10,2200,'Grant PLC');
INSERT INTO Product (`id`,`pname`,`price`,`stock`,`manufacturer`) VALUES ('P00000000000010','Industrial Fans',20,6400,'Jarvis-Lang');

INSERT INTO Customer (`id`,`cname`,`city`,`phone_number`,`balance`,`credit`) VALUES ('C00000000000001','Julie Warren','Kirkport','(857)227-8912x455',2900,100);
INSERT INTO Customer (`id`,`cname`,`city`,`phone_number`,`balance`,`credit`) VALUES ('C00000000000002','Jennifer Pace','Leahberg','294.427.6574x60880',98900,800);
INSERT INTO Customer (`id`,`cname`,`city`,`phone_number`,`balance`,`credit`) VALUES ('C00000000000003','Logan Smith','Campbellport','(880)448-2428x610',32600,1000);
INSERT INTO Customer (`id`,`cname`,`city`,`phone_number`,`balance`,`credit`) VALUES ('C00000000000004','Lindsey Baker','Melissabury','769.401.4598x3269',43900,200);
INSERT INTO Customer (`id`,`cname`,`city`,`phone_number`,`balance`,`credit`) VALUES ('C00000000000005','Gary Johnson','Mooreview','+1-362-292-3043x3235',49700,700);
INSERT INTO Customer (`id`,`cname`,`city`,`phone_number`,`balance`,`credit`) VALUES ('C00000000000006','James Maxwell','Rogersberg','001-857-241-7818x401',38900,700);
INSERT INTO Customer (`id`,`cname`,`city`,`phone_number`,`balance`,`credit`) VALUES ('C00000000000007','Michael Sampson','West Christopher','(617)321-5621',81600,1000);
INSERT INTO Customer (`id`,`cname`,`city`,`phone_number`,`balance`,`credit`) VALUES ('C00000000000008','Mariah Morris','Melissabury','576.967.7057x693',77500,100);
INSERT INTO Customer (`id`,`cname`,`city`,`phone_number`,`balance`,`credit`) VALUES ('C00000000000009','Alexandra Wu','Port Katherine','7173093773',69500,500);
INSERT INTO Customer (`id`,`cname`,`city`,`phone_number`,`balance`,`credit`) VALUES ('C00000000000010','Mrs. Amanda Kennedy DDS','Bradleyton','2588714576',2400,100);

INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000001','2015-06-30','C00000000000003','P00000000000010',4670,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000002','2015-10-04','C00000000000005','P00000000000008',6980,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000003','2022-09-30','C00000000000010','P00000000000007',7200,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000004','2020-06-09','C00000000000008','P00000000000003',3200,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000005','2016-12-31','C00000000000005','P00000000000010',9770,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000006','2019-04-13','C00000000000001','P00000000000003',3950,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000007','2020-09-06','C00000000000005','P00000000000004',7760,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000008','2020-10-21','C00000000000003','P00000000000003',5700,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000009','2020-09-09','C00000000000004','P00000000000010',3720,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000010','2013-09-07','C00000000000010','P00000000000009',7610,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000011','2011-03-11','C00000000000009','P00000000000001',5020,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000012','2017-05-28','C00000000000009','P00000000000010',400,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000013','2014-07-29','C00000000000001','P00000000000009',4290,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000014','2013-05-26','C00000000000010','P00000000000004',750,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000015','2011-12-27','C00000000000007','P00000000000003',1000,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000016','2012-10-10','C00000000000003','P00000000000006',3550,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000017','2018-04-22','C00000000000005','P00000000000008',5900,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000018','2011-05-01','C00000000000008','P00000000000009',4070,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000019','2017-02-10','C00000000000005','P00000000000008',9410,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000020','2011-09-09','C00000000000009','P00000000000006',4330,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000021','2018-09-12','C00000000000004','P00000000000004',2780,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000022','2012-01-05','C00000000000010','P00000000000009',6390,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000023','2013-05-01','C00000000000007','P00000000000001',9430,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000024','2022-08-08','C00000000000002','P00000000000006',8180,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000025','2011-12-13','C00000000000003','P00000000000007',6620,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000026','2015-01-20','C00000000000003','P00000000000004',5130,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000027','2013-07-09','C00000000000006','P00000000000002',8860,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000028','2010-04-14','C00000000000005','P00000000000009',4100,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000029','2020-07-06','C00000000000008','P00000000000001',400,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000030','2020-01-13','C00000000000002','P00000000000001',630,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000031','2021-10-18','C00000000000009','P00000000000005',7070,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000032','2021-03-24','C00000000000002','P00000000000001',2470,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000033','2019-05-23','C00000000000007','P00000000000002',6140,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000034','2017-05-13','C00000000000006','P00000000000007',7620,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000035','2016-07-30','C00000000000003','P00000000000003',9820,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000036','2012-02-15','C00000000000009','P00000000000007',5650,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000037','2010-11-13','C00000000000009','P00000000000002',2100,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000038','2012-11-04','C00000000000001','P00000000000010',4570,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000039','2013-02-26','C00000000000001','P00000000000009',480,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000040','2015-03-25','C00000000000010','P00000000000006',1410,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000041','2018-10-16','C00000000000010','P00000000000003',1380,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000042','2010-11-28','C00000000000009','P00000000000003',9320,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000043','2013-01-24','C00000000000004','P00000000000003',8280,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000044','2016-06-14','C00000000000006','P00000000000006',5640,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000045','2014-01-25','C00000000000004','P00000000000005',2650,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000046','2019-07-21','C00000000000006','P00000000000009',2380,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000047','2018-03-28','C00000000000007','P00000000000008',2480,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000048','2022-10-29','C00000000000008','P00000000000006',5140,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000049','2022-04-24','C00000000000007','P00000000000006',4660,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000050','2019-01-15','C00000000000001','P00000000000005',3720,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000051','2019-12-15','C00000000000007','P00000000000005',5950,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000052','2014-02-13','C00000000000009','P00000000000001',6050,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000053','2010-08-19','C00000000000002','P00000000000003',4290,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000054','2012-05-04','C00000000000007','P00000000000010',9660,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000055','2018-02-14','C00000000000010','P00000000000006',8430,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000056','2013-12-01','C00000000000007','P00000000000002',2030,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000057','2021-10-04','C00000000000007','P00000000000009',8710,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000058','2015-09-09','C00000000000007','P00000000000003',2250,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000059','2014-05-07','C00000000000009','P00000000000002',3440,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000060','2021-03-10','C00000000000004','P00000000000002',7800,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000061','2011-03-22','C00000000000007','P00000000000009',9810,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000062','2013-10-17','C00000000000010','P00000000000006',3480,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000063','2013-10-28','C00000000000005','P00000000000008',7770,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000064','2017-06-06','C00000000000007','P00000000000008',9580,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000065','2021-03-07','C00000000000006','P00000000000008',4260,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000066','2022-01-17','C00000000000001','P00000000000008',4340,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000067','2017-10-05','C00000000000001','P00000000000001',5320,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000068','2014-07-27','C00000000000002','P00000000000001',6950,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000069','2013-09-24','C00000000000001','P00000000000005',7150,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000070','2022-07-15','C00000000000006','P00000000000004',6350,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000071','2019-09-15','C00000000000001','P00000000000003',1630,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000072','2018-01-18','C00000000000010','P00000000000004',4670,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000073','2014-06-25','C00000000000002','P00000000000003',6200,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000074','2018-09-13','C00000000000002','P00000000000002',3080,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000075','2021-08-20','C00000000000004','P00000000000003',9690,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000076','2018-05-15','C00000000000002','P00000000000002',4030,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000077','2012-09-26','C00000000000007','P00000000000002',3970,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000078','2010-03-12','C00000000000005','P00000000000010',4610,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000079','2018-08-14','C00000000000006','P00000000000007',9930,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000080','2011-01-14','C00000000000002','P00000000000009',6910,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000081','2014-07-06','C00000000000001','P00000000000008',460,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000082','2012-09-27','C00000000000003','P00000000000009',1070,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000083','2022-11-28','C00000000000002','P00000000000009',2160,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000084','2018-10-13','C00000000000007','P00000000000004',960,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000085','2020-09-03','C00000000000001','P00000000000008',6180,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000086','2016-03-08','C00000000000010','P00000000000002',4090,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000087','2013-01-15','C00000000000001','P00000000000003',4230,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000088','2012-01-09','C00000000000001','P00000000000002',2160,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000089','2012-05-07','C00000000000010','P00000000000005',7000,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000090','2015-09-23','C00000000000006','P00000000000008',2500,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000091','2012-06-01','C00000000000005','P00000000000006',3250,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000092','2017-06-21','C00000000000004','P00000000000004',2640,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000093','2016-05-05','C00000000000009','P00000000000004',6700,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000094','2018-09-12','C00000000000002','P00000000000009',330,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000095','2015-11-08','C00000000000005','P00000000000001',7280,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000096','2021-10-18','C00000000000006','P00000000000007',4630,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000097','2015-12-08','C00000000000002','P00000000000006',4740,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000098','2014-03-04','C00000000000009','P00000000000009',8860,1);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000099','2014-08-12','C00000000000008','P00000000000001',9840,0);
INSERT INTO ProductOrder (`id`,`create_date`,`customer_id`,`product_id`,`quantity`,`is_filled`) VALUES ('O00000000000100','2015-10-22','C00000000000007','P00000000000010',2380,0);

INSERT INTO Coupon VALUES ('C00000000000005', 0.98);
INSERT INTO Coupon VALUES ('C00000000000005', 0.95);
INSERT INTO Coupon VALUES ('C00000000000005', 0.90);
INSERT INTO Coupon VALUES ('C00000000000006', 0.98);
INSERT INTO Coupon VALUES ('C00000000000006', 0.95);
INSERT INTO Coupon VALUES ('C00000000000006', 0.85);
INSERT INTO Coupon VALUES ('C00000000000002', 0.98);
INSERT INTO Coupon VALUES ('C00000000000002', 0.95);
INSERT INTO Coupon VALUES ('C00000000000002', 0.90);
INSERT INTO Coupon VALUES ('C00000000000009', 0.98);
INSERT INTO Coupon VALUES ('C00000000000009', 0.95);
INSERT INTO Coupon VALUES ('C00000000000009', 0.90);
INSERT INTO Coupon VALUES ('C00000000000001', 0.99);
INSERT INTO Coupon VALUES ('C00000000000001', 0.98);