-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.0.67-community-nt - MySQL Community Edition (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 mpet 的数据库结构
CREATE DATABASE IF NOT EXISTS `mpet` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mpet`;


-- 导出  表 mpet.account 结构
CREATE TABLE IF NOT EXISTS `account` (
  `username` varchar(80) NOT NULL,
  `password` varchar(60) default NULL,
  `email` varchar(80) NOT NULL,
  `xm` varchar(80) NOT NULL,
  `address` varchar(40) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 7168 kB; InnoDB free: 6144 kB';

-- 正在导出表  mpet.account 的数据：~36 rows (大约)
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`username`, `password`, `email`, `xm`, `address`) VALUES
	('0000', '0000', '1109478911@qq.com', '0000', '0000'),
	('123', '111', '1109478911@qq.com', '1111', '12132'),
	('221123', '123', '123@123.com', '123', '12'),
	('44443', '111', 'wk2003119@163.com', 'sdsdsd', '1212'),
	('6767', '6767', 'wk2003119@163.com', '4554', '3434'),
	('67679', '6767', 'wk2003119@163.com', '4554', '3434'),
	('8888', '111', 'w@123.com', '111', '23232'),
	('8989uuu', '111', 'wk2003119@163.com', '222', '12222'),
	('898y', '111', 'wk2003119@163.com', 'ddd', '121212'),
	('9999', '111', 'w@123.com', 'xsssss', 'dddd'),
	('a', '111', '1109478911@qq.com', 'a', '1'),
	('aa', '111', '1109478911@qq.com', 'aa', 'a'),
	('aaaaa', '111', '1109478911@qq.com', 'aaaaa', 'a'),
	('admin', '111', '110@qq.com', '不知道', 'dniandi'),
	('haha', '1234', '123@123.com', '哈哈', '上海'),
	('hhhh', '111', 'wk@163.com', '111', '4444'),
	('KKK12', '999', 'wk@163.com', 'dffdfd', '221'),
	('LLLL', '111', 'wk2003119@163.com', 'LLLL', 'dslflfsl'),
	('nihao', '111', '123@123.com', 'nihao', '111'),
	('ninini', '123', '123@123.com', '你你你', '你你你'),
	('qwqw', '111111', '1109478911@qq.com', '111111', '111111'),
	('UUU', '111', 'wk@163.com', 'UUU', 'UUU'),
	('weikun', '119', 'wk2003119@163.com', '卫昆', '哈尔滨'),
	('www', '111', 'Q@123.com', 'rrr', '2121'),
	('wxc', '123', '1109478911@qq.com', 'wwwwww', '1431'),
	('ytytytu', '111', 'wk2003119@163.com', '222', '121212'),
	('yyyy', '111', 'w@123.com', 'yyy', 'sdfdsfd');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;


-- 导出  过程 mpet.addCart 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `addCart`(IN `in_itemid` vaRCHAR(50), IN `in_qty` INT)
BEGIN
	
	set @maxid=0;
	set @orderdate='';
	set @count=0;
	set @qty=0;
	
	select max(orderid),orderdate into @maxid,@orderdate from orders; 
	
	if  @orderdate is null then -- 代表订单还可以添加新商品
		
		 -- 查询本次添加的商品是否在同一订单下还有同种商品，
		-- 如果有，将进行修改数量，如果没有，是真正的新商品，只需要insert。
		
		select count(*) into @count
		
		from cart
		where orderid=@maxid and 
				itemid=in_itemid;
		if @count=0 then
		
			insert into cart(orderid,itemid,quantity)
			values( @maxid ,in_itemid,in_qty);
			commit;
			
			
	   else
	   		select quantity into @qty
	   		from cart
	   		where orderid=@maxid and
	   		      itemid=in_itemid;
				
				call updateCart(@maxid,in_itemid,@qty+in_qty);	
		
			
		end if;
		
		
	else -- 日期为空的时候
		
			select max(orderid)+1 into @maxid from orders; 
			
			insert into orders(orderid)
			values( @maxid );
			
			insert into cart(orderid,itemid,quantity)
			values( @maxid ,in_itemid,in_qty);
		
	end if;
	call queryCart(@maxid);
	
	
	
END//
DELIMITER ;


-- 导出  表 mpet.banner 结构
CREATE TABLE IF NOT EXISTS `banner` (
  `favcategory` varchar(80) NOT NULL,
  `bannername` varchar(255) default NULL,
  PRIMARY KEY  (`favcategory`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`favcategory`) REFERENCES `category` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB';

-- 正在导出表  mpet.banner 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` (`favcategory`, `bannername`) VALUES
	('BIRDS', '<image src="../images/banner_birds.gif">'),
	('CATS', '<image src="../images/banner_cats.gif">'),
	('DOGS', '<image src="../images/banner_dogs.gif">'),
	('FISH', '<image src="../images/banner_fish.gif">'),
	('REPTILES', '<image src="../images/banner_reptiles.gif">');
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;


-- 导出  表 mpet.cart 结构
CREATE TABLE IF NOT EXISTS `cart` (
  `orderid` int(11) NOT NULL default '0',
  `itemid` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY  (`orderid`,`itemid`),
  KEY `FK_FK_Reference_51` (`itemid`),
  CONSTRAINT `FK_FK_Reference_51` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`),
  CONSTRAINT `FK_Relationship_71` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`),
  CONSTRAINT `FK_Relationship_733` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 7168 kB; InnoDB free: 6144 kB; (`itemid`) REFER';

-- 正在导出表  mpet.cart 的数据：~94 rows (大约)
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`orderid`, `itemid`, `quantity`) VALUES
	(1, 'EST_4', 3),
	(1000, 'EST_4', 3),
	(1001, 'EST_4', 3),
	(1002, 'EST_4', 3),
	(1003, 'EST_1', 4),
	(1003, 'EST_19', 6),
	(1003, 'EST_2', 2),
	(1003, 'EST_20', 3),
	(1004, 'EST_2', 2),
	(1004, 'EST_20', 2),
	(1004, 'EST_3', 4),
	(1005, 'EST_21', 3),
	(1006, 'EST_20', 8),
	(1006, 'EST_21', 3),
	(1006, 'EST_9', 7),
	(1007, 'EST_1', 4),
	(1007, 'EST_28', 3),
	(1007, 'EST_5', 7),
	(1008, 'EST_21', 3),
	(1008, 'EST_28', 3),
	(1009, 'EST_21', 3),
	(1010, 'EST_2', 2),
	(1010, 'EST_21', 3),
	(1011, 'EST_2', 2),
	(1011, 'EST_9', 1),
	(1012, 'EST_1', 4),
	(1012, 'EST_9', 1),
	(1013, 'EST_1', 4),
	(1013, 'EST_21', 3),
	(1014, 'EST_1', 4),
	(1014, 'EST_21', 3),
	(1014, 'EST_5', 6),
	(1015, 'EST_21', 3),
	(1015, 'EST_4', 3),
	(1016, 'EST_21', 3),
	(1016, 'EST_3', 4),
	(1017, 'EST_21', 3),
	(1018, 'EST_2', 2),
	(1018, 'EST_27', 1),
	(1018, 'EST_3', 4),
	(1018, 'EST_5', 1),
	(1019, 'EST_5', 4),
	(1020, 'EST_2', 2),
	(1021, 'EST_1', 4),
	(1021, 'EST_2', 2),
	(1022, 'EST_1', 4),
	(1022, 'EST_2', 2),
	(1022, 'EST_21', 3),
	(1023, 'EST_2', 2),
	(1023, 'EST_4', 3),
	(1023, 'EST_5', 3),
	(1024, 'EST_4', 3),
	(1025, 'EST_20', 2),
	(1027, 'EST_2', 2),
	(1027, 'EST_21', 3),
	(1027, 'EST_3', 4),
	(1027, 'EST_5', 1),
	(1028, 'EST_1', 4),
	(1028, 'EST_2', 2),
	(1029, 'EST_21', 3),
	(1029, 'EST_3', 4),
	(1030, 'EST_5', 6),
	(1031, 'EST_20', 100),
	(1031, 'EST_21', 3),
	(1032, 'EST_1', 4),
	(1032, 'EST_15', 1),
	(1032, 'EST_2', 2),
	(1032, 'EST_3', 4),
	(1032, 'EST_5', 3),
	(1033, 'EST_1', 4),
	(1033, 'EST_2', 2),
	(1034, 'EST_28', 3),
	(1034, 'EST_4', 3),
	(1035, 'EST_27', 1),
	(1036, 'EST_10', 10),
	(1036, 'EST_12', 10),
	(1036, 'EST_13', 10),
	(1036, 'EST_19', 20),
	(1036, 'EST_20', 10),
	(1036, 'EST_26', 10),
	(1036, 'EST_5', 10),
	(1036, 'EST_8', 10),
	(1036, 'EST_9', 10),
	(1037, 'EST_6', 5),
	(1038, 'EST_10', 5),
	(1038, 'EST_18', 2),
	(1038, 'EST_19', 1),
	(1038, 'EST_4', 1),
	(1038, 'EST_6', 2),
	(1039, 'EST_13', 1),
	(1040, 'EST_23', 1),
	(1041, 'EST_12', 1),
	(1041, 'EST_17', 2),
	(1041, 'EST_4', 5);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;


-- 导出  表 mpet.category 结构
CREATE TABLE IF NOT EXISTS `category` (
  `catid` varchar(10) NOT NULL,
  `name` varchar(80) default NULL,
  `descn` varchar(255) default NULL,
  PRIMARY KEY  (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 7168 kB; InnoDB free: 6144 kB';

-- 正在导出表  mpet.category 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`catid`, `name`, `descn`) VALUES
	('BIRDS', '鸟类', '<image src="${ppath}/static/images/birds_icon.gif"><font size="5" color="blue"> Birds</font>'),
	('CATS', '猫类', '<image src="${ppath}/static/images/cats_icon.gif"><font size="5" color="blue"> Cats</font>'),
	('DOGS', '狗类', '<image src="${ppath}/static/images/dogs_icon.gif"><font size="5" color="blue"> Dogs</font>'),
	('FISH', '鱼类', '<image src="${ppath}/static/images/fish_icon.gif"><font size="5" color="blue"> Fish</font>'),
	('REPTILES', '爬行动物类', '<image src="${ppath}/static/images/reptiles_icon.gif"><font size="5" color="blue"> Reptiles</font>');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


-- 导出  过程 mpet.delCart 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `delCart`(IN `in_orderid` INT, IN `in_itemid` vARCHAR(50))
BEGIN
	
	delete from Cart
	where orderid=in_orderid and
	  		itemid=in_itemid;
	commit;

	call queryCart(in_orderid);
END//
DELIMITER ;


-- 导出  函数 mpet.func_get_split_string 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `func_get_split_string`(`f_string` varchar(1000), `f_delimiter` varchar(5), `f_order` int) RETURNS varchar(255) CHARSET utf8
BEGIN
  -- Get the separated number of given string.
  declare result varchar(255) default '';
  set result = reverse(substring_index(reverse(substring_index(f_string,f_delimiter,f_order)),f_delimiter,1));
  return result;
END//
DELIMITER ;


-- 导出  函数 mpet.func_get_split_string_total 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `func_get_split_string_total`(`f_string` varchar(1000), `f_delimiter` varchar(5)
) RETURNS int(11)
BEGIN
  -- Get the total number of given string.
  return 1+(length(f_string) - length(replace(f_string,f_delimiter,'')));
END//
DELIMITER ;


-- 导出  表 mpet.item 结构
CREATE TABLE IF NOT EXISTS `item` (
  `itemid` varchar(10) NOT NULL,
  `productid` varchar(10) NOT NULL,
  `listprice` decimal(10,2) default NULL,
  `unitcost` decimal(10,2) default NULL,
  `status` varchar(2) default NULL,
  `attr1` varchar(80) default NULL,
  `attr2` varchar(80) default NULL,
  `attr3` varchar(80) default NULL,
  `attr4` varchar(80) default NULL,
  `attr5` varchar(80) default NULL,
  PRIMARY KEY  (`itemid`),
  KEY `FK_fk_item_1` (`productid`),
  CONSTRAINT `FK_fk_item_1` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 7168 kB; (`productid`) REFER `jpetstore/product';

-- 正在导出表  mpet.item 的数据：~28 rows (大约)
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`itemid`, `productid`, `listprice`, `unitcost`, `status`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`) VALUES
	('EST_1', 'FI-SW-01', 16.50, 10.00, 'P', 'Large', NULL, NULL, NULL, NULL),
	('EST_10', 'K9-DL-01', 18.50, 12.00, 'P', 'Spotted Adult Female', NULL, NULL, NULL, NULL),
	('EST_11', 'RP-SN-01', 18.50, 12.00, 'P', 'Venomless', NULL, NULL, NULL, NULL),
	('EST_12', 'RP-SN-01', 18.50, 12.00, 'P', 'Rattleless', NULL, NULL, NULL, NULL),
	('EST_13', 'RP-LI-02', 18.50, 12.00, 'P', 'Green Adult', NULL, NULL, NULL, NULL),
	('EST_14', 'FL-DSH-01', 58.50, 12.00, 'P', 'Tailless', NULL, NULL, NULL, NULL),
	('EST_15', 'FL-DSH-01', 23.50, 12.00, 'P', 'With tail', NULL, NULL, NULL, NULL),
	('EST_16', 'FL-DLH-02', 93.50, 12.00, 'P', 'Adult Female', NULL, NULL, NULL, NULL),
	('EST_17', 'FL-DLH-02', 93.50, 12.00, 'P', 'Adult Male', NULL, NULL, NULL, NULL),
	('EST_18', 'AV-CB-01', 193.50, 92.00, 'P', 'Adult Male', NULL, NULL, NULL, NULL),
	('EST_19', 'AV-SB-02', 15.50, 2.00, 'P', 'Adult Male', NULL, NULL, NULL, NULL),
	('EST_2', 'FI-SW-01', 16.50, 10.00, 'P', 'Small', NULL, NULL, NULL, NULL),
	('EST_20', 'FI-FW-02', 5.50, 2.00, 'P', 'Adult Male', NULL, NULL, NULL, NULL),
	('EST_21', 'FI-FW-02', 5.29, 1.00, 'P', 'Adult Female', NULL, NULL, NULL, NULL),
	('EST_22', 'K9-RT-02', 135.50, 100.00, 'P', 'Adult Male', NULL, NULL, NULL, NULL),
	('EST_23', 'K9-RT-02', 145.49, 100.00, 'P', 'Adult Female', NULL, NULL, NULL, NULL),
	('EST_24', 'K9-RT-02', 255.50, 92.00, 'P', 'Adult Male', NULL, NULL, NULL, NULL),
	('EST_25', 'K9-RT-02', 325.29, 90.00, 'P', 'Adult Female', NULL, NULL, NULL, NULL),
	('EST_26', 'K9-CW-01', 125.50, 92.00, 'P', 'Adult Male', NULL, NULL, NULL, NULL),
	('EST_27', 'K9-CW-01', 155.29, 90.00, 'P', 'Adult Female', NULL, NULL, NULL, NULL),
	('EST_28', 'K9-RT-01', 155.29, 90.00, 'P', 'Adult Female', NULL, NULL, NULL, NULL),
	('EST_3', 'FI-SW-02', 18.50, 12.00, 'P', 'Toothless', NULL, NULL, NULL, NULL),
	('EST_4', 'FI-FW-01', 18.50, 12.00, 'P', 'Spotted', NULL, NULL, NULL, NULL),
	('EST_5', 'FI-FW-01', 18.50, 12.00, 'P', 'Spotless', NULL, NULL, NULL, NULL),
	('EST_6', 'K9-BD-01', 18.50, 12.00, 'P', 'Male Adult', NULL, NULL, NULL, NULL),
	('EST_7', 'K9-BD-01', 18.50, 12.00, 'P', 'Female Puppy', NULL, NULL, NULL, NULL),
	('EST_8', 'K9-PO-02', 18.50, 12.00, 'P', 'Male Puppy', NULL, NULL, NULL, NULL),
	('EST_9', 'K9-DL-01', 18.50, 12.00, 'P', 'Spotless Male Puppy', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;


-- 导出  表 mpet.orders 结构
CREATE TABLE IF NOT EXISTS `orders` (
  `orderid` int(11) NOT NULL default '0' COMMENT '订单序号',
  `orderdate` date default NULL COMMENT '订单日期',
  `totalprice` decimal(10,2) default '0.00' COMMENT '总价格',
  PRIMARY KEY  (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 7168 kB; InnoDB free: 6144 kB; (`linenum` `orde';

-- 正在导出表  mpet.orders 的数据：~42 rows (大约)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`orderid`, `orderdate`, `totalprice`) VALUES
	(1, NULL, 0.00),
	(1000, '2013-09-13', 0.00),
	(1001, NULL, 0.00),
	(1002, '2013-09-18', 0.00),
	(1003, '2014-01-14', 0.00),
	(1004, '2014-06-27', 0.00),
	(1005, '2014-06-27', 0.00),
	(1006, '2014-06-27', 0.00),
	(1007, '2014-06-27', 0.00),
	(1008, '2014-06-27', 0.00),
	(1009, '2014-06-27', 0.00),
	(1010, '2014-06-27', 0.00),
	(1011, '2014-06-27', 0.00),
	(1012, '2014-06-27', 0.00),
	(1013, '2014-06-27', 0.00),
	(1014, '2014-06-27', 0.00),
	(1015, '2014-06-27', 0.00),
	(1016, '2014-06-27', 0.00),
	(1017, '2014-06-27', 0.00),
	(1018, '2014-06-27', 0.00),
	(1019, '2014-06-27', 0.00),
	(1020, '2014-06-27', 0.00),
	(1021, '2014-06-27', 0.00),
	(1022, '2013-03-01', 0.00),
	(1023, '2014-09-16', 0.00),
	(1024, '2014-09-16', 0.00),
	(1025, '2014-09-16', 0.00),
	(1027, '2014-12-26', 0.00),
	(1028, '2014-12-26', 0.00),
	(1029, '2014-12-26', 0.00),
	(1030, '2014-12-28', 0.00),
	(1031, '2014-12-28', 0.00),
	(1032, '2015-02-23', 0.00),
	(1033, '2015-02-23', 0.00),
	(1034, '2015-04-06', 0.00),
	(1035, '2016-12-09', 0.00),
	(1036, '2016-12-10', 2730.00),
	(1037, '2016-12-10', 92.00),
	(1038, '2016-12-10', 550.00),
	(1039, '2016-12-10', 18.00),
	(1040, '2016-12-10', 145.00),
	(1041, '2016-12-10', 298.00);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


-- 导出  表 mpet.product 结构
CREATE TABLE IF NOT EXISTS `product` (
  `productid` varchar(10) NOT NULL,
  `catid` varchar(10) NOT NULL,
  `name` varchar(80) default NULL,
  `descn` varchar(255) default NULL,
  `pic` varchar(50) default NULL,
  PRIMARY KEY  (`productid`),
  KEY `FK_fk_product_1` (`catid`),
  CONSTRAINT `FK_fk_product_1` FOREIGN KEY (`catid`) REFERENCES `category` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 7168 kB; (`category`) REFER `jpetstore/category';

-- 正在导出表  mpet.product 的数据：~16 rows (大约)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`productid`, `catid`, `name`, `descn`, `pic`) VALUES
	('AV-CB-01', 'BIRDS', 'Amazon Parrot', 'Great companion for up to 75 years', 'bird4.gif'),
	('AV-SB-02', 'BIRDS', 'Finch', 'Great stress reliever', 'bird1.gif'),
	('FI-FW-01', 'FISH', 'Koi', 'Fresh Water fish from Japan', 'fish3.gif'),
	('FI-FW-02', 'FISH', 'Goldfish', 'Fresh Water fish from China', 'fish2.gif'),
	('FI-SW-01', 'FISH', 'Angelfish', 'Salt Water fish from Australia', 'fish1.jpg'),
	('FI-SW-02', 'FISH', 'Tiger Shark', 'Salt Water fish from Australia', 'fish4.gif'),
	('FL-DLH-02', 'CATS', 'Persian', 'Friendly house cat, doubles as a princess', 'cat1.gif'),
	('FL-DSH-01', 'CATS', 'Manx', 'Great for reducing mouse populations', 'cat3.gif'),
	('K9-BD-01', 'DOGS', 'Bulldog', 'Friendly dog from England', 'dog2.gif'),
	('K9-CW-01', 'DOGS', 'Chihuahua', 'Great companion dog', 'dog4.gif'),
	('K9-DL-01', 'DOGS', 'Dalmation', 'Great dog for a Fire Station', 'dog5.gif'),
	('K9-PO-02', 'DOGS', 'Poodle', 'Cute dog from France', 'dog6.gif'),
	('K9-RT-01', 'DOGS', 'Golden Retriever', 'Great family dog', 'dog1.gif'),
	('K9-RT-02', 'DOGS', 'Labrador Retriever', 'Great hunting dog', 'dog5.gif'),
	('RP-LI-02', 'REPTILES', 'Iguana', 'Friendly green friend', 'lizard2.gif'),
	('RP-SN-01', 'REPTILES', 'Rattlesnake', 'Doubles as a watch dog', 'lizard3.gif');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


-- 导出  表 mpet.profile 结构
CREATE TABLE IF NOT EXISTS `profile` (
  `username` varchar(80) NOT NULL,
  `lang` varchar(80) NOT NULL,
  `catid` varchar(30) default NULL,
  PRIMARY KEY  (`username`),
  KEY `FK_Reference_7` (`catid`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`catid`) REFERENCES `category` (`catid`),
  CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`username`) REFERENCES `account` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 7168 kB; InnoDB free: 6144 kB; (`username`) REF';

-- 正在导出表  mpet.profile 的数据：~16 rows (大约)
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` (`username`, `lang`, `catid`) VALUES
	('0000', '中文', 'REPTILES'),
	('44443', 'english', 'BIRDS'),
	('8888', 'chinese', 'REPTILES'),
	('8989uuu', 'english', 'BIRDS'),
	('9999', 'chinese', 'BIRDS'),
	('a', '中文', 'DOGS'),
	('aa', '中文', 'CATS'),
	('aaaaa', '中文', 'DOGS'),
	('haha', 'chinese', 'BIRDS'),
	('hhhh', 'chinese', 'DOGS'),
	('nihao', 'chinese', 'REPTILES'),
	('ninini', 'chinese', 'BIRDS'),
	('weikun', 'english', 'FISH'),
	('www', 'english', 'FISH'),
	('wxc', 'english', 'REPTILES'),
	('yyyy', 'english', 'DOGS');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;


-- 导出  过程 mpet.pro_addCart 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_addCart`(IN `in_itemid` varchar(16), IN `in_quantity` int
)
begin

	set @old_orderid = 0;# 旧的订单时间
	set @old_date = null;# 订单的时间
	set @old_itemid = null;# 订单号 为了判断新加入cart的宠物是否已经存在
	set @old_quantity = 0;# 已经有的宠物的数量
	
	# 在orders表中找到最大订单号的订单和时间
	select orderid,orderdate into @old_orderid,@old_date
	from orders
	where orderid = (select max(orderid) from orders limit 1);
	
	if @old_date is null then 
		# 如果时间为空，说明上一笔虽然已经买了但是还没提交订单.
		# 所以有新添加东西还是在这个订单上
		# 但是还得判断添加的东西，在此订单是否已经有了，有 数量加  没有 新加入
		
		select itemid,quantity into @old_itemid,@old_quantity
		from cart
		where orderid = @old_orderid and itemid = in_itemid;
		
		# 注意判断；一开始设置如果为 '' 则应该与 '' 判断。而不是 null
		if @old_itemid is null then # 如果不存在这商品，直接添加
			insert into cart(orderid,itemid,quantity) values(@old_orderid,in_itemid,in_quantity);
		else # 存在这商品，数量加
			update cart set quantity = @old_quantity + in_quantity
			where orderid = @old_orderid and itemid = @old_itemid;
			
			# 此时功能相当于pro_updateCart()的功能可以直接使用
			call pro_updateCart(@old_itemid,@old_orderid,@old_quantity + in_quantity);
			
		end if;
	
	else 
		# 订单已经提交了,需要生成新的订单
		
		insert into orders(orderid) values(@old_orderid+1);
		# 购物车表中的订单编号也得加
		insert into cart(orderid,itemid,quantity) values(@old_orderid+1,in_itemid,in_quantity);
		
		set @old_orderid = @old_orderid+1;
	end if;
	commit;
	# 必须查询 不然没有结果集
	call pro_queryCart(@old_orderid);
end//
DELIMITER ;


-- 导出  过程 mpet.pro_delCart 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_delCart`(
	in in_itemid varchar(16),
	in in_orderid int
)
begin
	delete from cart 
	where itemid = in_itemid and 
			orderid = in_orderid;
	commit;
	call pro_queryCart(in_orderid);
end//
DELIMITER ;


-- 导出  过程 mpet.pro_queryCart 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_queryCart`(IN `in_orderid` int
)
begin 
	select *
	from cart c,item i,product p,category ca
	where c.orderid = in_orderid and 
			c.itemid = i.itemid and 
			i.productid = p.productid and 
			p.catid = ca.catid;
end//
DELIMITER ;


-- 导出  过程 mpet.pro_updateCart 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_updateCart`(IN `in_itemid` varchar(16), IN `in_orderid` int, IN `in_quantity` int
)
begin
	update cart set quantity = in_quantity
	where orderid = in_orderid and 
			itemid = in_itemid;
	commit;
	# 因为可能会修改多次，但是只有最后一次会用到查询，如果加上的话每次修改都查询，速度很慢
   #	call queryCart(in_orderid);
end//
DELIMITER ;


-- 导出  过程 mpet.queryCart 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `queryCart`(IN `in_orderid` INT)
BEGIN
		select * 
		from 	product p,category c,item i,cart a
		where  
		      p.catid=c.catid and
		      i.productid=p.productid and
		      a.itemid=i.itemid and
		      a.orderid=in_orderid;
	
END//
DELIMITER ;


-- 导出  过程 mpet.queryPet 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `queryPet`(IN `in_category` CHAR(10), IN `in_pro` CHAR(10), IN `in_item` CHAR(10))
BEGIN

	
	/*
		in_category:宠物种类，为了查询product表
		in_pro:宠物产品,为了查询item表
		in_item:宠物项目，为了查询单个项目 为了查询item表
		

	*/
	if in_category!='' then
	
		select * from 
			product p,category c
		where  
		      p.catid=in_category and
				p.catid=c.catid;      
		      
	elseif in_pro!='' then
		
		select * 
		from 	product p,category c,item i
		where  i.productid=in_pro and
		       p.catid=c.catid and
		       i.productid=p.productid;
		      
	
		      
	elseif in_item!='' then	      
			select * 
			from 	item i,product p
			where  i.itemid=in_item and
			       i.productid=p.productid;
			      
		
	end if;

	


END//
DELIMITER ;


-- 导出  过程 mpet.sp_print_result 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_print_result`(
IN f_string varchar(1000),IN f_delimiter varchar(5)
)
BEGIN
  -- Get the separated string.
  declare cnt int default 0;
  declare i int default 0;
  set cnt = func_get_split_string_total(f_string,f_delimiter);
  drop table if exists tmp_print;
  create temporary table tmp_print (num int not null);
  while i < cnt
  do
    set i = i + 1;
    insert into tmp_print(num) values (func_get_split_string(f_string,f_delimiter,i));
  end while;
  select * from tmp_print;
  
END//
DELIMITER ;


-- 导出  过程 mpet.updateCartB 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateCartB`(IN `in_olist` varchar(1000), IN `in_qlist` varchar(1000), IN `in_dlist` varchar(1000), IN `f_delimiter` varchar(5)
)
BEGIN
	
  /*
	  in_olist-- 要分割的orderid字符串
	  in_qlist-- 要分割的quantity字符串
	  in_dlist-- 要分割的itemid字符串
	  f_delimiter-- 分隔符
	*/	

  declare cnt int default 0;
  declare i int default 0;
  declare orderid int default 0;
  set @cnt = func_get_split_string_total(in_olist,f_delimiter); 
  
  while i < @cnt  do
    set i = i + 1;    
    set orderid=0+func_get_split_string(in_olist,f_delimiter,i);
    set @itemid=func_get_split_string(in_dlist,f_delimiter,i);
    set @quantity=0+func_get_split_string(in_qlist,f_delimiter,i);    
    update cart set quantity=@quantity	 
	 where orderid=orderid
	 and itemid=@itemid;   
  end while;
  commit;
  
  call queryCart(orderid+0);
END//
DELIMITER ;


-- 导出  过程 mpet.updateOrders 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateOrders`(IN `in_orderid` INT)
BEGIN
	update orders 
	set orderdate=now() 
	where orderid=in_orderid;
	commit;
END//
DELIMITER ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
