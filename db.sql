/*
SQLyog Ultimate - MySQL GUI v8.21 
MySQL - 5.1.29-rc-community : Database - persons
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`persons` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `persons`;

/*Table structure for table `book_issue_return_records` */

DROP TABLE IF EXISTS `book_issue_return_records`;

CREATE TABLE `book_issue_return_records` (
  `firstName` text,
  `lastName` text,
  `bookName` text,
  `authorName` text,
  `email` text,
  `cnic` double DEFAULT NULL,
  `issueDate` date DEFAULT NULL,
  `dueDate` date DEFAULT NULL,
  `returnedDate` date DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  `fine` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `book_issue_return_records` */

insert  into `book_issue_return_records`(`firstName`,`lastName`,`bookName`,`authorName`,`email`,`cnic`,`issueDate`,`dueDate`,`returnedDate`,`status`,`fine`) values ('zain','sattar','introduction to computing','david millar','zainsattar17@gmail.com',34,'2022-01-06','2022-01-11','0000-00-00',0,0),('zain','sattar','introduction to computing','david millar','zainsattar17@gmail.com',35103,'2022-01-06','2022-01-11','0000-00-00',0,0),('zain','sattar','urdu','noman','zainsattar17@gmail.com',34,'2022-01-06','2022-01-11','0000-00-00',1,0),('zain','sattar','urdu','noman','zainsattar17@gmail.com',34,'2022-01-06','2022-01-11','0000-00-00',1,0),('zain','sattar','urdu','noman','zainsattar17@gmail.com',34,'2022-01-06','2022-01-11','0000-00-00',1,0),('zain','sattar','introduction to computing','john pk','zainsattar17@gmail.com',35,'2022-01-06','2022-01-11','2022-01-07',1,0),('zain','sattar','introduction to computing','john pk','zainsattar17@gmail.com',351,'2022-01-06','2022-01-11','0000-00-00',0,0),('zain','sattar','urdu','noman','zainsattar17@gmail.com',3510353827009,'2022-01-06','2022-01-11','0000-00-00',0,0),('zain','sattar','introduction to computing','david millar','zainsattar17@gmail.com',457,'2022-01-08','2022-01-13','2022-01-08',1,0),('ali','ahmad','urdu','zohaib','ali@gmail.com',351035485109,'2022-01-08','2022-01-13','2022-01-08',1,0),('zain','sattar','urdu','noman','zainsattar17@gmail.com',457,'2022-01-10','2022-01-15','2022-01-10',1,0),('zain','sattar','introduction to computing','zain','zainsattar17@gmail.com',73864,'2022-01-04','2022-01-10','2022-01-15',1,0),('zain','sattar','introduction to computing','john pk','zainsattar17@gmail.com',3510353827009,'2022-01-01','2022-01-11','2022-01-22',1,1100),('zain','sattar','introduction to computing','david evans','zainsattar17@gmail.com',300757246222,'2022-01-15','2022-01-20','2022-01-22',0,200),('akbar','amjad','introduction to computing','david millar','akbar@gmail.com',748352687289,'2022-01-22','2022-01-27',NULL,0,0),('zain','sattar','urdu','noman','amjad@gamil.com',3565658756,'2022-01-22','2022-01-27',NULL,0,0),('majad','ali','introduction to computing','david millar','majad@gmail.com',7459859836545,'2022-01-22','2022-01-27',NULL,0,0),('zain','sattar','introduction to computing','john pk','zainsattar17@gmail.com',34576543568776,'2022-01-22','2022-01-27','2022-01-22',1,0),('zain','sattar','urdu','noman','zainsattar17@gmail.com',849367846587,'2022-01-22','2022-01-27',NULL,0,0),('zain','sattar','introduction to computing','zain','zainsattar17@gmail.com',345678765,'2022-01-22','2022-01-27',NULL,0,0),('zain','sattar','introduction to computing','zain','zainsattar17@gmail.com',3265873256,'2022-01-22','2022-01-27',NULL,0,0),('zain','sattar','introduction to computing','john pk','zainsattar17@gmail.com',8435745743657,'2022-01-22','2022-01-27',NULL,0,0),('ali','raza','introduction to computing','john pk','raza@gamail.com',300757246234,'2022-01-22','2022-01-27','2022-01-22',1,0),('ali','akbar','introduction to computing','john pk','ali@gmail.com',301428412888,'2022-01-22','2022-01-27',NULL,0,0),('zohaib','sattar','aoa','zubair','zohaibahmad1039@gmail.com',308086050411,'2022-01-23','2022-01-28','2022-01-23',1,0);

/*Table structure for table `bookrecords` */

DROP TABLE IF EXISTS `bookrecords`;

CREATE TABLE `bookrecords` (
  `bookName` text,
  `authorName` text,
  `totalQuantity` int(11) DEFAULT NULL,
  `remainingQuantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bookrecords` */

insert  into `bookrecords`(`bookName`,`authorName`,`totalQuantity`,`remainingQuantity`) values ('introduction to computing','david evans',5,3),('abc','123',5,3),('introduction to computing','david millar',4,1),('itc','niaz',2,3),('introduction to computing','john pk',3,5),('urdu','noman',10,2),('urdu','john pk',4,4),('introduction to computing','zain',10,9),('maty','john',10,10),('urdu','zohaib',12,12),('accounting','l halley',23,23),('finance','pk sharma',12,12),('web engg','ali',5,5),('la','faisal',12,12),('AOA','zubair',12,12),('introduction to computing','noman',12,12),('compputer Networks','omer nawaz',25,25),('calculus','farsia',23,23),('islamiat','mohsin',13,13),('alogorithms','zain',3,3),('urdu','pk sharma',4,4);

/*Table structure for table `personrecords` */

DROP TABLE IF EXISTS `personrecords`;

CREATE TABLE `personrecords` (
  `firstName` text,
  `lastName` text,
  `email` text,
  `password` text,
  `role` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `personrecords` */

insert  into `personrecords`(`firstName`,`lastName`,`email`,`password`,`role`) values ('Zain','Sattar','zainsattar17@gmail.com','123','admin'),('zohaib','ahmad','zohaibahmad1039@gmail.com','12345678',NULL),('zarar','ahmad','zarar@gmail.com','567',NULL),('ans','mushtaq','ansmushtaq31@gmail.com','12345678',NULL),('mahad','Bin Naeem','mahad@gmail.com','12345',NULL),('Zain','Sattar','zainsattar7@gmail.com','abc',NULL),('Zain','Sattar','zainsttar17@gmail.com','1234',NULL),('Zain','Sattar','zainahmad17@gmail.com','123',NULL),('Zain','Sattar','ainsattar17@gmail.com','abc',NULL),('asim','khalid','asimkhalid007@gmail.com','1234',NULL),('Zain','Sattar','zainsattar17@mail.com','123456',NULL),('Zain','Sattar','zainsattar17@gail.com','1234',NULL),('Zain','Sattar','zainsatta17@gmail.com','123',NULL),('jawad','akram','jr@gmail.com','abcd',NULL),('Zain','Sattar','zaattar17@gmail.com','1234',NULL),('Zain','Sattar','zaiattar17@gmail.com','0301',NULL),('Aurelia',' G. Thao','ali@pu.edu.pk','abcde',NULL),('faizan','ali','faizanali@gmail.com','abcd','staff'),('niaz','baig','niazbaig@gmail.com','123',NULL),('niaz','baig','niazba@gmail.com','123',NULL),('niaz','baig','niaza@gmail.com','123',NULL),('niaz','baig','niaza@gail.com','123',NULL),('niaz','baig','znsattar17@gmail.co','1234',NULL),('null','null','null','null',NULL),('null','null','null','null',NULL),('null','null','null','null',NULL),('null','null','null','null',NULL),('null','null','null','null',NULL),('null','null','null','null',NULL),('niaz','baig','zainsattar17@gal.com','123',NULL),('null','null','null','null',NULL),('niaz','baig','zaattar17@gal.com','123',NULL),('niaz','baig','zr17@gmail.com','1234',NULL),('zain','sattar','zar17@gmail.com','123',NULL),('Zain','Sattar','za@gmail.com','123',NULL),('Zain','Sattar','ar17@gmail.com','123',NULL),('Zain','Sattar','attar7@gmail.com','123',NULL),('Zain','Sattar','zainsar17@gmail.com','123',NULL),('Zain','Sattar','sttar17@gmail.com','123',NULL),('Zain','Sattar','17@gmail.com','123',NULL),('Zain','Sattar','7@gmail.com','123',NULL),('Zain','Sattar','zatar17@gmail.com','123',NULL),('Zain','Sattar','zair17@il.com','123',NULL),('Zain','Sattar','ar17@gail.com','123',NULL),('Zain','Sattar','nbtar17@gmail.com','123',NULL),('Zain','Sattar',']7@gil.com','123',NULL),('Zain','Sattar','za76ttar17@gmail.com','123',NULL),('zain','sattar','s3lina11ari@crashkiller.ovh','1234',NULL),('zain','sattar','zohaibsattar1039@gmail.com','123',NULL),('hassan','baig','hassanbaig@gmail.com','123','admin'),('zohaib','ahmad','staff@gmail.com','123','staff'),('ali','lal khan','alial@gmail.com','123','staff'),('awais','ali','awais@email.com','123','admin'),('mohsn','shoaib','mohsin@gmail.com','123','admin'),('zohaib','sattar','zs@gmail.com','123','staff'),('mota','khan','khn@gmail.com','123','staff'),('Zain','Sattar','sayeed@gmail.com','1234','staff'),('akbar','ahmad','akbar@gmail.com','123','admin'),('Zain','Sattar','adeel@gmail.com','123','admin'),('ali','kasim','kasim@gamil.com','123','admin'),('Zain','Sattar','zai778@gmail.com','123','admin'),('null','null','null','null','admin'),('null','null','null','null','admin'),('null','null','null','null','admin'),('Zain','Sattar','nisar@ail.com','123','admin'),('Zain','Sattar','zainsatta@gma.om','123','admin'),('arslan','hanif','hanif@gmail.com','123','admin'),('Alina','ali','alia@gmail.com','123','staff');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
