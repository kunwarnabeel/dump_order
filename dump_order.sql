/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.4.24-MariaDB : Database - dump_order
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dump_order` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `dump_order`;

/*Table structure for table `activity_log` */

DROP TABLE IF EXISTS `activity_log`;

CREATE TABLE `activity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_date` varchar(8) DEFAULT NULL,
  `release_date` varchar(8) DEFAULT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `release_num` varchar(100) DEFAULT NULL,
  `plant_num` varchar(100) DEFAULT NULL,
  `part_num` varchar(100) DEFAULT NULL,
  `sws_part_num` varchar(100) DEFAULT NULL,
  `activity_status` varchar(20) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `activity_log` */

/*Table structure for table `contact_book` */

DROP TABLE IF EXISTS `contact_book`;

CREATE TABLE `contact_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warning_ids` varchar(50) NOT NULL,
  `warning_text` varchar(200) NOT NULL,
  `emails` text NOT NULL,
  `updated_date` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `contact_book` */

insert  into `contact_book`(`id`,`warning_ids`,`warning_text`,`emails`,`updated_date`) values 
(1,'1','Week to Week','maazuddinsheikh@gmail.com,shaikh.maaz@gettectonic.com,test@mailinator.com,rawal.abro@gettectonic.com,,','20220127'),
(2,'2','4 Week Trend Warning','maazuddinsheikh@gmail.com,shaikh.maaz@gettectonic.com,test@mailinator.com,jhasbjhasd,test@test.com','20220127'),
(3,'3','8 Week Trend Warning','','');

/*Table structure for table `core` */

DROP TABLE IF EXISTS `core`;

CREATE TABLE `core` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` char(10) NOT NULL DEFAULT '0',
  `domain` varchar(65) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `tax` varchar(5) DEFAULT NULL,
  `second_tax` varchar(5) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `autobackup` int(11) DEFAULT NULL,
  `cronjob` int(11) DEFAULT NULL,
  `last_cronjob` int(11) DEFAULT NULL,
  `last_autobackup` int(11) DEFAULT NULL,
  `invoice_terms` mediumtext DEFAULT NULL,
  `company_reference` int(6) DEFAULT NULL,
  `project_reference` int(6) DEFAULT NULL,
  `invoice_reference` int(6) DEFAULT NULL,
  `subscription_reference` int(6) DEFAULT NULL,
  `ticket_reference` int(10) DEFAULT NULL,
  `date_format` varchar(20) DEFAULT NULL,
  `date_time_format` varchar(20) DEFAULT NULL,
  `invoice_mail_subject` varchar(150) DEFAULT NULL,
  `pw_reset_mail_subject` varchar(150) DEFAULT NULL,
  `pw_reset_link_mail_subject` varchar(150) DEFAULT NULL,
  `credentials_mail_subject` varchar(150) DEFAULT NULL,
  `notification_mail_subject` varchar(150) DEFAULT NULL,
  `language` varchar(150) DEFAULT NULL,
  `invoice_address` varchar(200) DEFAULT NULL,
  `invoice_city` varchar(200) DEFAULT NULL,
  `invoice_contact` varchar(200) DEFAULT NULL,
  `invoice_tel` varchar(50) DEFAULT NULL,
  `subscription_mail_subject` varchar(250) DEFAULT NULL,
  `logo` varchar(150) DEFAULT NULL,
  `template` varchar(200) DEFAULT 'default',
  `paypal` varchar(5) DEFAULT '1',
  `paypal_currency` varchar(200) DEFAULT 'EUR',
  `paypal_account` varchar(200) DEFAULT 'luxsys@luxsys-apps.com',
  `invoice_logo` varchar(150) DEFAULT 'assets/blackline/img/invoice_logo.png',
  `pc` varchar(150) DEFAULT NULL,
  `vat` varchar(150) DEFAULT NULL,
  `ticket_email` varchar(250) DEFAULT NULL,
  `ticket_default_owner` int(10) DEFAULT 1,
  `ticket_default_queue` int(10) DEFAULT 1,
  `ticket_default_type` int(10) DEFAULT 1,
  `ticket_default_status` varchar(200) DEFAULT 'new',
  `ticket_config_host` varchar(250) DEFAULT NULL,
  `ticket_config_login` varchar(250) DEFAULT NULL,
  `ticket_config_pass` varchar(250) DEFAULT NULL,
  `ticket_config_port` varchar(250) DEFAULT NULL,
  `ticket_config_ssl` varchar(250) DEFAULT NULL,
  `ticket_config_email` varchar(250) DEFAULT NULL,
  `ticket_config_flags` varchar(250) DEFAULT '/notls',
  `ticket_config_search` varchar(250) DEFAULT 'UNSEEN',
  `ticket_config_timestamp` int(11) DEFAULT NULL,
  `ticket_config_mailbox` varchar(250) DEFAULT NULL,
  `ticket_config_delete` int(11) DEFAULT NULL,
  `ticket_config_active` int(11) DEFAULT NULL,
  `ticket_config_imap` int(11) DEFAULT 1,
  `stripe` int(11) DEFAULT 0,
  `stripe_key` varchar(250) DEFAULT NULL,
  `stripe_p_key` varchar(255) DEFAULT NULL,
  `bank_transfer` int(11) DEFAULT NULL,
  `bank_transfer_text` longtext DEFAULT NULL,
  `stripe_currency` varchar(255) NOT NULL DEFAULT 'USD',
  `estimate_terms` longtext DEFAULT NULL,
  `estimate_prefix` varchar(255) NOT NULL DEFAULT 'EST',
  `estimate_pdf_template` varchar(255) NOT NULL DEFAULT 'templates/estimate/default',
  `invoice_pdf_template` varchar(255) NOT NULL DEFAULT 'invoices/preview',
  `estimate_mail_subject` varchar(255) NOT NULL DEFAULT 'New Estimate #{estimate_id}',
  `money_currency_position` int(5) NOT NULL DEFAULT 1,
  `money_format` int(5) NOT NULL DEFAULT 1,
  `pdf_font` varchar(255) NOT NULL DEFAULT 'NotoSans',
  `pdf_path` int(10) NOT NULL DEFAULT 1,
  `registration` int(10) NOT NULL DEFAULT 0,
  `authorize_api_login_id` varchar(255) DEFAULT NULL,
  `authorize_api_transaction_key` varchar(255) DEFAULT NULL,
  `authorize_net` int(20) DEFAULT 0,
  `authorize_currency` varchar(30) DEFAULT NULL,
  `invoice_prefix` varchar(255) DEFAULT NULL,
  `company_prefix` varchar(255) DEFAULT NULL,
  `quotation_prefix` varchar(255) DEFAULT NULL,
  `project_prefix` varchar(255) DEFAULT NULL,
  `subscription_prefix` varchar(255) DEFAULT NULL,
  `calendar_google_api_key` varchar(255) DEFAULT NULL,
  `calendar_google_event_address` varchar(255) DEFAULT NULL,
  `default_client_modules` varchar(255) DEFAULT NULL,
  `estimate_reference` int(10) DEFAULT 0,
  `login_background` varchar(255) DEFAULT 'blur.jpg',
  `custom_colors` int(1) DEFAULT 1,
  `top_bar_background` varchar(60) DEFAULT '#FFFFFF',
  `top_bar_color` varchar(60) DEFAULT '#333333',
  `body_background` varchar(60) DEFAULT '#e3e6ed',
  `menu_background` varchar(60) DEFAULT '#173240',
  `menu_color` varchar(60) DEFAULT '#FFFFFF',
  `primary_color` varchar(60) DEFAULT '#356cc9',
  `twocheckout_seller_id` varchar(250) DEFAULT NULL,
  `twocheckout_publishable_key` varchar(250) DEFAULT NULL,
  `twocheckout_private_key` varchar(250) DEFAULT NULL,
  `twocheckout` int(11) DEFAULT 0,
  `twocheckout_currency` varchar(250) DEFAULT NULL,
  `login_logo` varchar(255) DEFAULT NULL,
  `login_style` varchar(255) DEFAULT 'left',
  `reference_lenght` int(20) DEFAULT NULL,
  `stripe_ideal` int(1) DEFAULT NULL,
  `zip_position` varchar(60) DEFAULT 'left',
  `timezone` varchar(255) DEFAULT NULL,
  `notifications` int(1) unsigned DEFAULT 0,
  `last_notification` varchar(100) DEFAULT NULL,
  `receipt_mail_subject` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `core` */

insert  into `core`(`id`,`version`,`domain`,`email`,`company`,`tax`,`second_tax`,`currency`,`autobackup`,`cronjob`,`last_cronjob`,`last_autobackup`,`invoice_terms`,`company_reference`,`project_reference`,`invoice_reference`,`subscription_reference`,`ticket_reference`,`date_format`,`date_time_format`,`invoice_mail_subject`,`pw_reset_mail_subject`,`pw_reset_link_mail_subject`,`credentials_mail_subject`,`notification_mail_subject`,`language`,`invoice_address`,`invoice_city`,`invoice_contact`,`invoice_tel`,`subscription_mail_subject`,`logo`,`template`,`paypal`,`paypal_currency`,`paypal_account`,`invoice_logo`,`pc`,`vat`,`ticket_email`,`ticket_default_owner`,`ticket_default_queue`,`ticket_default_type`,`ticket_default_status`,`ticket_config_host`,`ticket_config_login`,`ticket_config_pass`,`ticket_config_port`,`ticket_config_ssl`,`ticket_config_email`,`ticket_config_flags`,`ticket_config_search`,`ticket_config_timestamp`,`ticket_config_mailbox`,`ticket_config_delete`,`ticket_config_active`,`ticket_config_imap`,`stripe`,`stripe_key`,`stripe_p_key`,`bank_transfer`,`bank_transfer_text`,`stripe_currency`,`estimate_terms`,`estimate_prefix`,`estimate_pdf_template`,`invoice_pdf_template`,`estimate_mail_subject`,`money_currency_position`,`money_format`,`pdf_font`,`pdf_path`,`registration`,`authorize_api_login_id`,`authorize_api_transaction_key`,`authorize_net`,`authorize_currency`,`invoice_prefix`,`company_prefix`,`quotation_prefix`,`project_prefix`,`subscription_prefix`,`calendar_google_api_key`,`calendar_google_event_address`,`default_client_modules`,`estimate_reference`,`login_background`,`custom_colors`,`top_bar_background`,`top_bar_color`,`body_background`,`menu_background`,`menu_color`,`primary_color`,`twocheckout_seller_id`,`twocheckout_publishable_key`,`twocheckout_private_key`,`twocheckout`,`twocheckout_currency`,`login_logo`,`login_style`,`reference_lenght`,`stripe_ideal`,`zip_position`,`timezone`,`notifications`,`last_notification`,`receipt_mail_subject`) values 
(1,'3.2.9','http://localhost/rlm_sandbox/','maazuddinsheikh@gmail.com','Sumitomo ','0',NULL,'USD',1,1,0,0,'Thank you for your business. We do expect payment within {due_date}, so please process this invoice within that time.',41002,51001,31001,61001,10000,'Y/m/d','g:i A','New Invoice','Password Reset','Password Reset','Login Details','Notification','english','','','','','New Subscription','files/media/syslogo.png','blueline','0','USD','','assets/blueline/images/sws-logo.png','3733160b-6c6c-4df6-b1be-f4808ab1d87a',NULL,NULL,1,1,1,'new',NULL,NULL,NULL,NULL,NULL,NULL,'/notls','UNSEEN',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,'USD',NULL,'EST','templates/estimate/default','invoices/preview','New Estimate #{estimate_id}',1,1,'NotoSans',1,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20000,'corporation_outline_bg_mainvisual01.jpg',1,'#FFFFFF','#333333','#c5d9f1','#1fad5e','#FFFFFF','#356cc9',NULL,NULL,NULL,0,NULL,NULL,'left',NULL,NULL,'left',NULL,0,NULL,NULL);

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL,
  `oracle_acc_num` varchar(50) NOT NULL,
  `rlm_type` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `customers` */

insert  into `customers`(`id`,`customer_name`,`oracle_acc_num`,`rlm_type`) values 
(1,'Aptiv','A1234','Discrete'),
(2,'Lear','L2222','CUM'),
(3,'Yazaki','Y1234','CUM');

/*Table structure for table `open_orders` */

DROP TABLE IF EXISTS `open_orders`;

CREATE TABLE `open_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(8) NOT NULL,
  `org_id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `account_id` varchar(20) NOT NULL,
  `part_number` varchar(20) NOT NULL,
  `description` longtext NOT NULL,
  `due_date` varchar(8) NOT NULL,
  `total_qty` int(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

/*Data for the table `open_orders` */

insert  into `open_orders`(`id`,`date`,`org_id`,`name`,`account_id`,`part_number`,`description`,`due_date`,`total_qty`,`status`) values 
(1,'20220215','TBD','ABC Inc.','12345','1234-5678','Connector A','202203',100000,1),
(2,'20220215','TBD','ABC Inc.','12345','1234-5678','Connector A','202204',125000,1),
(3,'20220215','TBD','ABC Inc.','12345','1234-5678','Connector A','202205',150000,1),
(4,'20220215','TBD','ABC Inc.','12345','1234-5679','Connector B','202203',100000,1),
(5,'20220215','TBD','ABC Inc.','12345','1234-5679','Connector B','202204',125000,1),
(6,'20220215','TBD','ABC Inc.','12345','1234-5679','Connector B','202205',150000,1),
(7,'20220215','TBD','DEF Inc.','12377','1234-5678','Connector A','202203',100000,1),
(8,'20220215','TBD','DEF Inc.','12377','1234-5678','Connector A','202204',125000,1),
(9,'20220215','TBD','DEF Inc.','12377','1234-5678','Connector A','202205',150000,1),
(10,'20220216','TBD','ABC Inc.','12345','1234-5678','Connector A','202203',100000,1),
(11,'20220216','TBD','ABC Inc.','12345','1234-5678','Connector A','202204',150000,1),
(12,'20220216','TBD','ABC Inc.','12345','1234-5678','Connector A','202205',150000,1),
(13,'20220216','TBD','ABC Inc.','12345','1234-5679','Connector B','202203',100000,1),
(14,'20220216','TBD','ABC Inc.','12345','1234-5679','Connector B','202204',125000,1),
(15,'20220216','TBD','ABC Inc.','12345','1234-5679','Connector B','202205',150000,1),
(16,'20220216','TBD','DEF Inc.','12377','1234-5678','Connector A','202203',100000,1),
(17,'20220216','TBD','DEF Inc.','12377','1234-5678','Connector A','202204',125000,1),
(18,'20220216','TBD','DEF Inc.','12377','1234-5678','Connector A','202205',200000,1),
(19,'20220215','TBD','ABC Inc.','12345','1234-5678','Connector A','202203',100000,1),
(20,'20220215','TBD','ABC Inc.','12345','1234-5678','Connector A','202204',125000,1),
(21,'20220215','TBD','ABC Inc.','12345','1234-5678','Connector A','202205',150000,1),
(22,'20220215','TBD','ABC Inc.','12345','1234-5679','Connector B','202203',100000,1),
(23,'20220215','TBD','ABC Inc.','12345','1234-5679','Connector B','202204',125000,1),
(24,'20220215','TBD','ABC Inc.','12345','1234-5679','Connector B','202205',150000,1),
(25,'20220215','TBD','DEF Inc.','12377','1234-5678','Connector A','202203',100000,1),
(26,'20220215','TBD','DEF Inc.','12377','1234-5678','Connector A','202204',125000,1),
(27,'20220215','TBD','DEF Inc.','12377','1234-5678','Connector A','202205',150000,1),
(28,'20220216','TBD','ABC Inc.','12345','1234-5678','Connector A','202203',100000,1),
(29,'20220216','TBD','ABC Inc.','12345','1234-5678','Connector A','202204',150000,1),
(30,'20220216','TBD','ABC Inc.','12345','1234-5678','Connector A','202205',150000,1),
(31,'20220216','TBD','ABC Inc.','12345','1234-5679','Connector B','202203',100000,1),
(32,'20220216','TBD','ABC Inc.','12345','1234-5679','Connector B','202204',125000,1),
(33,'20220216','TBD','ABC Inc.','12345','1234-5679','Connector B','202205',150000,1),
(34,'20220216','TBD','DEF Inc.','12377','1234-5678','Connector A','202203',100000,1),
(35,'20220216','TBD','DEF Inc.','12377','1234-5678','Connector A','202204',125000,1),
(36,'20220216','TBD','DEF Inc.','12377','1234-5678','Connector A','202205',200000,1);

/*Table structure for table `pw_reset` */

DROP TABLE IF EXISTS `pw_reset`;

CREATE TABLE `pw_reset` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(250) DEFAULT NULL,
  `timestamp` varchar(250) DEFAULT NULL,
  `token` varchar(250) DEFAULT NULL,
  `user` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `pw_reset` */

insert  into `pw_reset`(`id`,`email`,`timestamp`,`token`,`user`) values 
(1,'maazuddinsheikh@gmail.com','1638969492','43ca4761663d739c357fe20c31cdcd710d01eb8b7b015328c2ce04effe641f9d',1);

/*Table structure for table `reports` */

DROP TABLE IF EXISTS `reports`;

CREATE TABLE `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_name` varchar(255) NOT NULL,
  `columns` varchar(255) NOT NULL,
  `conditions` text DEFAULT NULL,
  `last_exported_date` varchar(8) NOT NULL,
  `created_date` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `reports` */

/*Table structure for table `sales_order` */

DROP TABLE IF EXISTS `sales_order`;

CREATE TABLE `sales_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) NOT NULL,
  `account_num` varchar(20) NOT NULL,
  `part_num` varchar(20) NOT NULL,
  `office` varchar(20) NOT NULL,
  `period` varchar(20) NOT NULL,
  `value` varchar(8) NOT NULL,
  `status` tinyint(4) DEFAULT 1,
  `import_date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=latin1;

/*Data for the table `sales_order` */

insert  into `sales_order`(`id`,`customer_name`,`account_num`,`part_num`,`office`,`period`,`value`,`status`,`import_date`) values 
(1,'Aptiv','D05916','60988295','Novi','202204','500000',1,'20220608'),
(2,'Aptiv','D05916','60988295','Novi','202205','500000',1,'20220608'),
(3,'Aptiv','D05916','60988295','Novi','202206','500000',1,'20220608'),
(4,'Aptiv','D05916','60988295','Novi','202207','500000',1,'20220608'),
(5,'Aptiv','D05916','60988295','Novi','202208','500000',1,'20220608'),
(6,'Aptiv','D05916','60988295','Novi','202209','500000',1,'20220608'),
(7,'Aptiv','D05916','60988295','Novi','202210','500000',1,'20220608'),
(8,'Aptiv','D05916','60988295','Novi','202211','500000',1,'20220608'),
(9,'Aptiv','D05916','60988295','Novi','202212','500000',1,'20220608'),
(10,'Aptiv','D05916','60988295','Novi','202201','500000',1,'20220608'),
(11,'Aptiv','D05916','60988295','Novi','202202','500000',1,'20220608'),
(12,'Aptiv','D05916','60988295','Novi','202203','500000',1,'20220608'),
(13,'Aptiv','D05916','60988295','Novi','202204','500000',1,'20220608'),
(14,'Aptiv','D05916','60988295','Novi','202205','500000',1,'20220608'),
(15,'Aptiv','D05916','60988295','Novi','202206','500000',1,'20220608'),
(16,'Aptiv','D05916','60988295','Novi','202207','500000',1,'20220608'),
(17,'Aptiv','D05916','60988295','Novi','202208','500000',1,'20220608'),
(18,'Aptiv','D05916','60988295','Novi','202209','500000',1,'20220608'),
(19,'Aptiv','D05916','60988295','Novi','202210','500000',1,'20220608'),
(20,'Aptiv','D05916','60988295','Novi','202211','500000',1,'20220608'),
(21,'Aptiv','D05916','60988295','Novi','202212','500000',1,'20220608'),
(22,'Aptiv','D05916','60988295','Novi','202201','500000',1,'20220608'),
(23,'Aptiv','D05916','60988295','Novi','202202','500000',1,'20220608'),
(24,'Aptiv','D05916','60988295','Novi','202203','500000',1,'20220608'),
(25,'Aptiv','D05916','60987119','Novi','202204','100000',1,'20220608'),
(26,'Aptiv','D05916','60987119','Novi','202205','100000',1,'20220608'),
(27,'Aptiv','D05916','60987119','Novi','202206','100000',1,'20220608'),
(28,'Aptiv','D05916','60987119','Novi','202207','100000',1,'20220608'),
(29,'Aptiv','D05916','60987119','Novi','202208','100000',1,'20220608'),
(30,'Aptiv','D05916','60987119','Novi','202209','100000',1,'20220608'),
(31,'Aptiv','D05916','60987119','Novi','202210','100000',1,'20220608'),
(32,'Aptiv','D05916','60987119','Novi','202211','100000',1,'20220608'),
(33,'Aptiv','D05916','60987119','Novi','202212','100000',1,'20220608'),
(34,'Aptiv','D05916','60987119','Novi','202201','100000',1,'20220608'),
(35,'Aptiv','D05916','60987119','Novi','202202','100000',1,'20220608'),
(36,'Aptiv','D05916','60987119','Novi','202203','100000',1,'20220608'),
(37,'Aptiv','D05916','60987119','Novi','202204','100000',1,'20220608'),
(38,'Aptiv','D05916','60987119','Novi','202205','100000',1,'20220608'),
(39,'Aptiv','D05916','60987119','Novi','202206','100000',1,'20220608'),
(40,'Aptiv','D05916','60987119','Novi','202207','100000',1,'20220608'),
(41,'Aptiv','D05916','60987119','Novi','202208','100000',1,'20220608'),
(42,'Aptiv','D05916','60987119','Novi','202209','100000',1,'20220608'),
(43,'Aptiv','D05916','60987119','Novi','202210','100000',1,'20220608'),
(44,'Aptiv','D05916','60987119','Novi','202211','100000',1,'20220608'),
(45,'Aptiv','D05916','60987119','Novi','202212','100000',1,'20220608'),
(46,'Aptiv','D05916','60987119','Novi','202201','100000',1,'20220608'),
(47,'Aptiv','D05916','60987119','Novi','202202','100000',1,'20220608'),
(48,'Aptiv','D05916','60987119','Novi','202203','100000',1,'20220608'),
(49,'Aptiv','D05916','60984713','Novi','202204','50000',1,'20220608'),
(50,'Aptiv','D05916','60984713','Novi','202205','50000',1,'20220608'),
(51,'Aptiv','D05916','60984713','Novi','202206','50000',1,'20220608'),
(52,'Aptiv','D05916','60984713','Novi','202207','50000',1,'20220608'),
(53,'Aptiv','D05916','60984713','Novi','202208','50000',1,'20220608'),
(54,'Aptiv','D05916','60984713','Novi','202209','50000',1,'20220608'),
(55,'Aptiv','D05916','60984713','Novi','202210','50000',1,'20220608'),
(56,'Aptiv','D05916','60984713','Novi','202211','50000',1,'20220608'),
(57,'Aptiv','D05916','60984713','Novi','202212','50000',1,'20220608'),
(58,'Aptiv','D05916','60984713','Novi','202201','50000',1,'20220608'),
(59,'Aptiv','D05916','60984713','Novi','202202','50000',1,'20220608'),
(60,'Aptiv','D05916','60984713','Novi','202203','50000',1,'20220608'),
(61,'Aptiv','D05916','60984713','Novi','202204','50000',1,'20220608'),
(62,'Aptiv','D05916','60984713','Novi','202205','50000',1,'20220608'),
(63,'Aptiv','D05916','60984713','Novi','202206','50000',1,'20220608'),
(64,'Aptiv','D05916','60984713','Novi','202207','50000',1,'20220608'),
(65,'Aptiv','D05916','60984713','Novi','202208','50000',1,'20220608'),
(66,'Aptiv','D05916','60984713','Novi','202209','50000',1,'20220608'),
(67,'Aptiv','D05916','60984713','Novi','202210','50000',1,'20220608'),
(68,'Aptiv','D05916','60984713','Novi','202211','50000',1,'20220608'),
(69,'Aptiv','D05916','60984713','Novi','202212','50000',1,'20220608'),
(70,'Aptiv','D05916','60984713','Novi','202201','50000',1,'20220608'),
(71,'Aptiv','D05916','60984713','Novi','202202','50000',1,'20220608'),
(72,'Aptiv','D05916','60984713','Novi','202203','50000',1,'20220608'),
(73,'Aptiv','D05916','60988431','Novi','202204','150000',1,'20220608'),
(74,'Aptiv','D05916','60988431','Novi','202205','150000',1,'20220608'),
(75,'Aptiv','D05916','60988431','Novi','202206','150000',1,'20220608'),
(76,'Aptiv','D05916','60988431','Novi','202207','150000',1,'20220608'),
(77,'Aptiv','D05916','60988431','Novi','202208','150000',1,'20220608'),
(78,'Aptiv','D05916','60988431','Novi','202209','150000',1,'20220608'),
(79,'Aptiv','D05916','60988431','Novi','202210','150000',1,'20220608'),
(80,'Aptiv','D05916','60988431','Novi','202211','150000',1,'20220608'),
(81,'Aptiv','D05916','60988431','Novi','202212','150000',1,'20220608'),
(82,'Aptiv','D05916','60988431','Novi','202201','150000',1,'20220608'),
(83,'Aptiv','D05916','60988431','Novi','202202','150000',1,'20220608'),
(84,'Aptiv','D05916','60988431','Novi','202203','150000',1,'20220608'),
(85,'Aptiv','D05916','60988431','Novi','202204','150000',1,'20220608'),
(86,'Aptiv','D05916','60988431','Novi','202205','150000',1,'20220608'),
(87,'Aptiv','D05916','60988431','Novi','202206','150000',1,'20220608'),
(88,'Aptiv','D05916','60988431','Novi','202207','150000',1,'20220608'),
(89,'Aptiv','D05916','60988431','Novi','202208','150000',1,'20220608'),
(90,'Aptiv','D05916','60988431','Novi','202209','150000',1,'20220608'),
(91,'Aptiv','D05916','60988431','Novi','202210','150000',1,'20220608'),
(92,'Aptiv','D05916','60988431','Novi','202211','150000',1,'20220608'),
(93,'Aptiv','D05916','60988431','Novi','202212','150000',1,'20220608'),
(94,'Aptiv','D05916','60988431','Novi','202201','150000',1,'20220608'),
(95,'Aptiv','D05916','60988431','Novi','202202','150000',1,'20220608'),
(96,'Aptiv','D05916','60988431','Novi','202203','150000',1,'20220608'),
(97,'Aptiv','D05916','60988295','Novi','202204','500000',1,'20220608'),
(98,'Aptiv','D05916','60988295','Novi','202205','500000',1,'20220608'),
(99,'Aptiv','D05916','60988295','Novi','202206','500000',1,'20220608'),
(100,'Aptiv','D05916','60988295','Novi','202207','500000',1,'20220608'),
(101,'Aptiv','D05916','60988295','Novi','202208','500000',1,'20220608'),
(102,'Aptiv','D05916','60988295','Novi','202209','500000',1,'20220608'),
(103,'Aptiv','D05916','60988295','Novi','202210','500000',1,'20220608'),
(104,'Aptiv','D05916','60988295','Novi','202211','500000',1,'20220608'),
(105,'Aptiv','D05916','60988295','Novi','202212','500000',1,'20220608'),
(106,'Aptiv','D05916','60988295','Novi','202201','500000',1,'20220608'),
(107,'Aptiv','D05916','60988295','Novi','202202','500000',1,'20220608'),
(108,'Aptiv','D05916','60988295','Novi','202203','500000',1,'20220608'),
(109,'Aptiv','D05916','60988295','Novi','202204','500000',1,'20220608'),
(110,'Aptiv','D05916','60988295','Novi','202205','500000',1,'20220608'),
(111,'Aptiv','D05916','60988295','Novi','202206','500000',1,'20220608'),
(112,'Aptiv','D05916','60988295','Novi','202207','500000',1,'20220608'),
(113,'Aptiv','D05916','60988295','Novi','202208','500000',1,'20220608'),
(114,'Aptiv','D05916','60988295','Novi','202209','500000',1,'20220608'),
(115,'Aptiv','D05916','60988295','Novi','202210','500000',1,'20220608'),
(116,'Aptiv','D05916','60988295','Novi','202211','500000',1,'20220608'),
(117,'Aptiv','D05916','60988295','Novi','202212','500000',1,'20220608'),
(118,'Aptiv','D05916','60988295','Novi','202201','500000',1,'20220608'),
(119,'Aptiv','D05916','60988295','Novi','202202','500000',1,'20220608'),
(120,'Aptiv','D05916','60988295','Novi','202203','500000',1,'20220608'),
(121,'Aptiv','D05916','60987119','Novi','202204','100000',1,'20220608'),
(122,'Aptiv','D05916','60987119','Novi','202205','100000',1,'20220608'),
(123,'Aptiv','D05916','60987119','Novi','202206','100000',1,'20220608'),
(124,'Aptiv','D05916','60987119','Novi','202207','100000',1,'20220608'),
(125,'Aptiv','D05916','60987119','Novi','202208','100000',1,'20220608'),
(126,'Aptiv','D05916','60987119','Novi','202209','100000',1,'20220608'),
(127,'Aptiv','D05916','60987119','Novi','202210','100000',1,'20220608'),
(128,'Aptiv','D05916','60987119','Novi','202211','100000',1,'20220608'),
(129,'Aptiv','D05916','60987119','Novi','202212','100000',1,'20220608'),
(130,'Aptiv','D05916','60987119','Novi','202201','100000',1,'20220608'),
(131,'Aptiv','D05916','60987119','Novi','202202','100000',1,'20220608'),
(132,'Aptiv','D05916','60987119','Novi','202203','100000',1,'20220608'),
(133,'Aptiv','D05916','60987119','Novi','202204','100000',1,'20220608'),
(134,'Aptiv','D05916','60987119','Novi','202205','100000',1,'20220608'),
(135,'Aptiv','D05916','60987119','Novi','202206','100000',1,'20220608'),
(136,'Aptiv','D05916','60987119','Novi','202207','100000',1,'20220608'),
(137,'Aptiv','D05916','60987119','Novi','202208','100000',1,'20220608'),
(138,'Aptiv','D05916','60987119','Novi','202209','100000',1,'20220608'),
(139,'Aptiv','D05916','60987119','Novi','202210','100000',1,'20220608'),
(140,'Aptiv','D05916','60987119','Novi','202211','100000',1,'20220608'),
(141,'Aptiv','D05916','60987119','Novi','202212','100000',1,'20220608'),
(142,'Aptiv','D05916','60987119','Novi','202201','100000',1,'20220608'),
(143,'Aptiv','D05916','60987119','Novi','202202','100000',1,'20220608'),
(144,'Aptiv','D05916','60987119','Novi','202203','100000',1,'20220608'),
(145,'Aptiv','D05916','60984713','Novi','202204','50000',1,'20220608'),
(146,'Aptiv','D05916','60984713','Novi','202205','50000',1,'20220608'),
(147,'Aptiv','D05916','60984713','Novi','202206','50000',1,'20220608'),
(148,'Aptiv','D05916','60984713','Novi','202207','50000',1,'20220608'),
(149,'Aptiv','D05916','60984713','Novi','202208','50000',1,'20220608'),
(150,'Aptiv','D05916','60984713','Novi','202209','50000',1,'20220608'),
(151,'Aptiv','D05916','60984713','Novi','202210','50000',1,'20220608'),
(152,'Aptiv','D05916','60984713','Novi','202211','50000',1,'20220608'),
(153,'Aptiv','D05916','60984713','Novi','202212','50000',1,'20220608'),
(154,'Aptiv','D05916','60984713','Novi','202201','50000',1,'20220608'),
(155,'Aptiv','D05916','60984713','Novi','202202','50000',1,'20220608'),
(156,'Aptiv','D05916','60984713','Novi','202203','50000',1,'20220608'),
(157,'Aptiv','D05916','60984713','Novi','202204','50000',1,'20220608'),
(158,'Aptiv','D05916','60984713','Novi','202205','50000',1,'20220608'),
(159,'Aptiv','D05916','60984713','Novi','202206','50000',1,'20220608'),
(160,'Aptiv','D05916','60984713','Novi','202207','50000',1,'20220608'),
(161,'Aptiv','D05916','60984713','Novi','202208','50000',1,'20220608'),
(162,'Aptiv','D05916','60984713','Novi','202209','50000',1,'20220608'),
(163,'Aptiv','D05916','60984713','Novi','202210','50000',1,'20220608'),
(164,'Aptiv','D05916','60984713','Novi','202211','50000',1,'20220608'),
(165,'Aptiv','D05916','60984713','Novi','202212','50000',1,'20220608'),
(166,'Aptiv','D05916','60984713','Novi','202201','50000',1,'20220608'),
(167,'Aptiv','D05916','60984713','Novi','202202','50000',1,'20220608'),
(168,'Aptiv','D05916','60984713','Novi','202203','50000',1,'20220608'),
(169,'Aptiv','D05916','60988431','Novi','202204','150000',1,'20220608'),
(170,'Aptiv','D05916','60988431','Novi','202205','150000',1,'20220608'),
(171,'Aptiv','D05916','60988431','Novi','202206','150000',1,'20220608'),
(172,'Aptiv','D05916','60988431','Novi','202207','150000',1,'20220608'),
(173,'Aptiv','D05916','60988431','Novi','202208','150000',1,'20220608'),
(174,'Aptiv','D05916','60988431','Novi','202209','150000',1,'20220608'),
(175,'Aptiv','D05916','60988431','Novi','202210','150000',1,'20220608'),
(176,'Aptiv','D05916','60988431','Novi','202211','150000',1,'20220608'),
(177,'Aptiv','D05916','60988431','Novi','202212','150000',1,'20220608'),
(178,'Aptiv','D05916','60988431','Novi','202201','150000',1,'20220608'),
(179,'Aptiv','D05916','60988431','Novi','202202','150000',1,'20220608'),
(180,'Aptiv','D05916','60988431','Novi','202203','150000',1,'20220608'),
(181,'Aptiv','D05916','60988431','Novi','202204','150000',1,'20220608'),
(182,'Aptiv','D05916','60988431','Novi','202205','150000',1,'20220608'),
(183,'Aptiv','D05916','60988431','Novi','202206','150000',1,'20220608'),
(184,'Aptiv','D05916','60988431','Novi','202207','150000',1,'20220608'),
(185,'Aptiv','D05916','60988431','Novi','202208','150000',1,'20220608'),
(186,'Aptiv','D05916','60988431','Novi','202209','150000',1,'20220608'),
(187,'Aptiv','D05916','60988431','Novi','202210','150000',1,'20220608'),
(188,'Aptiv','D05916','60988431','Novi','202211','150000',1,'20220608'),
(189,'Aptiv','D05916','60988431','Novi','202212','150000',1,'20220608'),
(190,'Aptiv','D05916','60988431','Novi','202201','150000',1,'20220608'),
(191,'Aptiv','D05916','60988431','Novi','202202','150000',1,'20220608'),
(192,'Aptiv','D05916','60988431','Novi','202203','150000',1,'20220608');

/*Table structure for table `unplanned_orders` */

DROP TABLE IF EXISTS `unplanned_orders`;

CREATE TABLE `unplanned_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(8) NOT NULL,
  `org_id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `account_id` varchar(20) NOT NULL,
  `part_number` varchar(20) NOT NULL,
  `description` longtext NOT NULL,
  `due_date` varchar(8) NOT NULL,
  `total_qty` int(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

/*Data for the table `unplanned_orders` */

insert  into `unplanned_orders`(`id`,`date`,`org_id`,`name`,`account_id`,`part_number`,`description`,`due_date`,`total_qty`,`status`) values 
(1,'20220215','TBD','ABC Inc.','12345','1234-5678','Connector A','202203',100000,1),
(2,'20220215','TBD','ABC Inc.','12345','1234-5678','Connector A','202204',125000,1),
(3,'20220215','TBD','ABC Inc.','12345','1234-5678','Connector A','202205',150000,1),
(4,'20220215','TBD','ABC Inc.','12345','1234-5679','Connector B','202203',100000,1),
(5,'20220215','TBD','ABC Inc.','12345','1234-5679','Connector B','202204',125000,1),
(6,'20220215','TBD','ABC Inc.','12345','1234-5679','Connector B','202205',150000,1),
(7,'20220215','TBD','DEF Inc.','12377','1234-5678','Connector A','202203',100000,1),
(8,'20220215','TBD','DEF Inc.','12377','1234-5678','Connector A','202204',125000,1),
(9,'20220215','TBD','DEF Inc.','12377','1234-5678','Connector A','202205',150000,1),
(10,'20220216','TBD','ABC Inc.','12345','1234-5678','Connector A','202203',100000,1),
(11,'20220216','TBD','ABC Inc.','12345','1234-5678','Connector A','202204',150000,1),
(12,'20220216','TBD','ABC Inc.','12345','1234-5678','Connector A','202205',150000,1),
(13,'20220216','TBD','ABC Inc.','12345','1234-5679','Connector B','202203',100000,1),
(14,'20220216','TBD','ABC Inc.','12345','1234-5679','Connector B','202204',125000,1),
(15,'20220216','TBD','ABC Inc.','12345','1234-5679','Connector B','202205',150000,1),
(16,'20220216','TBD','DEF Inc.','12377','1234-5678','Connector A','202203',100000,1),
(17,'20220216','TBD','DEF Inc.','12377','1234-5678','Connector A','202204',125000,1),
(18,'20220216','TBD','DEF Inc.','12377','1234-5678','Connector A','202205',200000,1),
(19,'20220215','TBD','ABC Inc.','12345','1234-5678','Connector A','202203',100000,1),
(20,'20220215','TBD','ABC Inc.','12345','1234-5678','Connector A','202204',125000,1),
(21,'20220215','TBD','ABC Inc.','12345','1234-5678','Connector A','202205',150000,1),
(22,'20220215','TBD','ABC Inc.','12345','1234-5679','Connector B','202203',100000,1),
(23,'20220215','TBD','ABC Inc.','12345','1234-5679','Connector B','202204',125000,1),
(24,'20220215','TBD','ABC Inc.','12345','1234-5679','Connector B','202205',150000,1),
(25,'20220215','TBD','DEF Inc.','12377','1234-5678','Connector A','202203',100000,1),
(26,'20220215','TBD','DEF Inc.','12377','1234-5678','Connector A','202204',125000,1),
(27,'20220215','TBD','DEF Inc.','12377','1234-5678','Connector A','202205',150000,1),
(28,'20220216','TBD','ABC Inc.','12345','1234-5678','Connector A','202203',100000,1),
(29,'20220216','TBD','ABC Inc.','12345','1234-5678','Connector A','202204',150000,1),
(30,'20220216','TBD','ABC Inc.','12345','1234-5678','Connector A','202205',150000,1),
(31,'20220216','TBD','ABC Inc.','12345','1234-5679','Connector B','202203',100000,1),
(32,'20220216','TBD','ABC Inc.','12345','1234-5679','Connector B','202204',125000,1),
(33,'20220216','TBD','ABC Inc.','12345','1234-5679','Connector B','202205',150000,1),
(34,'20220216','TBD','DEF Inc.','12377','1234-5678','Connector A','202203',100000,1),
(35,'20220216','TBD','DEF Inc.','12377','1234-5678','Connector A','202204',125000,1),
(36,'20220216','TBD','DEF Inc.','12377','1234-5678','Connector A','202205',200000,1),
(37,'20220215','TBD','ABC Inc.','12345','1234-5678','Connector A','202203',100000,1),
(38,'20220215','TBD','ABC Inc.','12345','1234-5678','Connector A','202204',125000,1),
(39,'20220215','TBD','ABC Inc.','12345','1234-5678','Connector A','202205',150000,1),
(40,'20220215','TBD','ABC Inc.','12345','1234-5679','Connector B','202203',100000,1),
(41,'20220215','TBD','ABC Inc.','12345','1234-5679','Connector B','202204',125000,1),
(42,'20220215','TBD','ABC Inc.','12345','1234-5679','Connector B','202205',150000,1),
(43,'20220215','TBD','DEF Inc.','12377','1234-5678','Connector A','202203',100000,1),
(44,'20220215','TBD','DEF Inc.','12377','1234-5678','Connector A','202204',125000,1),
(45,'20220215','TBD','DEF Inc.','12377','1234-5678','Connector A','202205',150000,1),
(46,'20220216','TBD','ABC Inc.','12345','1234-5678','Connector A','202203',100000,1),
(47,'20220216','TBD','ABC Inc.','12345','1234-5678','Connector A','202204',150000,1),
(48,'20220216','TBD','ABC Inc.','12345','1234-5678','Connector A','202205',150000,1),
(49,'20220216','TBD','ABC Inc.','12345','1234-5679','Connector B','202203',100000,1),
(50,'20220216','TBD','ABC Inc.','12345','1234-5679','Connector B','202204',125000,1),
(51,'20220216','TBD','ABC Inc.','12345','1234-5679','Connector B','202205',150000,1),
(52,'20220216','TBD','DEF Inc.','12377','1234-5678','Connector A','202203',100000,1),
(53,'20220216','TBD','DEF Inc.','12377','1234-5678','Connector A','202204',125000,1),
(54,'20220216','TBD','DEF Inc.','12377','1234-5678','Connector A','202205',200000,1),
(55,'20220215','TBD','ABC Inc.','12345','1234-5678','Connector A','202203',100000,1),
(56,'20220215','TBD','ABC Inc.','12345','1234-5678','Connector A','202204',125000,1),
(57,'20220215','TBD','ABC Inc.','12345','1234-5678','Connector A','202205',150000,1),
(58,'20220215','TBD','ABC Inc.','12345','1234-5679','Connector B','202203',100000,1),
(59,'20220215','TBD','ABC Inc.','12345','1234-5679','Connector B','202204',125000,1),
(60,'20220215','TBD','ABC Inc.','12345','1234-5679','Connector B','202205',150000,1),
(61,'20220215','TBD','DEF Inc.','12377','1234-5678','Connector A','202203',100000,1),
(62,'20220215','TBD','DEF Inc.','12377','1234-5678','Connector A','202204',125000,1),
(63,'20220215','TBD','DEF Inc.','12377','1234-5678','Connector A','202205',150000,1),
(64,'20220216','TBD','ABC Inc.','12345','1234-5678','Connector A','202203',100000,1),
(65,'20220216','TBD','ABC Inc.','12345','1234-5678','Connector A','202204',150000,1),
(66,'20220216','TBD','ABC Inc.','12345','1234-5678','Connector A','202205',150000,1),
(67,'20220216','TBD','ABC Inc.','12345','1234-5679','Connector B','202203',100000,1),
(68,'20220216','TBD','ABC Inc.','12345','1234-5679','Connector B','202204',125000,1),
(69,'20220216','TBD','ABC Inc.','12345','1234-5679','Connector B','202205',150000,1),
(70,'20220216','TBD','DEF Inc.','12377','1234-5678','Connector A','202203',100000,1),
(71,'20220216','TBD','DEF Inc.','12377','1234-5678','Connector A','202204',125000,1),
(72,'20220216','TBD','DEF Inc.','12377','1234-5678','Connector A','202205',200000,1),
(73,'20220215','TBD','ABC Inc.','12345','1234-5678','Connector A','202203',100000,1),
(74,'20220215','TBD','ABC Inc.','12345','1234-5678','Connector A','202204',125000,1),
(75,'20220215','TBD','ABC Inc.','12345','1234-5678','Connector A','202205',150000,1),
(76,'20220215','TBD','ABC Inc.','12345','1234-5679','Connector B','202203',100000,1),
(77,'20220215','TBD','ABC Inc.','12345','1234-5679','Connector B','202204',125000,1),
(78,'20220215','TBD','ABC Inc.','12345','1234-5679','Connector B','202205',150000,1),
(79,'20220215','TBD','DEF Inc.','12377','1234-5678','Connector A','202203',100000,1),
(80,'20220215','TBD','DEF Inc.','12377','1234-5678','Connector A','202204',125000,1),
(81,'20220215','TBD','DEF Inc.','12377','1234-5678','Connector A','202205',150000,1),
(82,'20220216','TBD','ABC Inc.','12345','1234-5678','Connector A','202203',100000,1),
(83,'20220216','TBD','ABC Inc.','12345','1234-5678','Connector A','202204',150000,1),
(84,'20220216','TBD','ABC Inc.','12345','1234-5678','Connector A','202205',150000,1),
(85,'20220216','TBD','ABC Inc.','12345','1234-5679','Connector B','202203',100000,1),
(86,'20220216','TBD','ABC Inc.','12345','1234-5679','Connector B','202204',125000,1),
(87,'20220216','TBD','ABC Inc.','12345','1234-5679','Connector B','202205',150000,1),
(88,'20220216','TBD','DEF Inc.','12377','1234-5678','Connector A','202203',100000,1),
(89,'20220216','TBD','DEF Inc.','12377','1234-5678','Connector A','202204',125000,1),
(90,'20220216','TBD','DEF Inc.','12377','1234-5678','Connector A','202205',200000,1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `oracleid` varchar(255) DEFAULT NULL,
  `personname` varchar(120) DEFAULT NULL,
  `companyname` varchar(120) DEFAULT NULL,
  `hashed_password` varchar(128) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `status` enum('active','inactive','deleted') DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL,
  `modified_date` timestamp NULL DEFAULT current_timestamp(),
  `modified_by` int(11) DEFAULT NULL,
  `userpic` varchar(250) DEFAULT 'no-pic.png',
  `access` varchar(150) NOT NULL DEFAULT '1,2',
  `last_login` varchar(50) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `admin` enum('0','1') NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  `defaultnumberofpages` varchar(45) DEFAULT '10',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`oracleid`,`personname`,`companyname`,`hashed_password`,`email`,`status`,`created_date`,`created_by`,`modified_date`,`modified_by`,`userpic`,`access`,`last_login`,`token`,`language`,`type`,`admin`,`parent_id`,`defaultnumberofpages`) values 
(1,'maazuddinsheikh@gmail.com','1','Maaz','Tectonic','295952707524523e4a526c7663633a243a77782654794b2f546e4e2a4721493334ee4c9be3802c5d8a7cf2845cee1c8a3569312081388f39c13fe45117f1e57a','maazuddinsheikh@gmail.com','active','2021-12-06 14:52:25',1,'2021-12-06 14:52:25',NULL,'no-pic.png','1,2,3,4,5,6,7,8,9,10,11,12','1650546995',NULL,NULL,NULL,'0',NULL,'10');

/*Table structure for table `warning` */

DROP TABLE IF EXISTS `warning`;

CREATE TABLE `warning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `customer_num` varchar(20) DEFAULT NULL,
  `threshold` varchar(5) DEFAULT NULL,
  `updated_date` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `warning` */

insert  into `warning`(`id`,`type`,`customer_num`,`threshold`,`updated_date`) values 
(1,'Global Default setting for all customers','All Customers','1.5','20220608'),
(2,'Customer specific setting','123456','2','20220607'),
(3,'Customer specific setting',NULL,'',''),
(4,'Customer specific setting',NULL,'',''),
(5,'Customer specific setting',NULL,'',''),
(6,'Customer specific setting',NULL,'','');

/*Table structure for table `warning_log` */

DROP TABLE IF EXISTS `warning_log`;

CREATE TABLE `warning_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_date` varchar(8) NOT NULL,
  `customer_name` varchar(20) NOT NULL,
  `account_number` varchar(10) NOT NULL,
  `part_num` varchar(20) NOT NULL,
  `warning` varchar(50) NOT NULL,
  `status` varchar(6) NOT NULL DEFAULT 'Open',
  `tolerance` double DEFAULT NULL,
  `comments` varchar(50) DEFAULT NULL,
  `due_date` varchar(8) DEFAULT NULL,
  `open_order_qty` int(10) DEFAULT NULL,
  `sales_plan_qty` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `warning_log` */

insert  into `warning_log`(`id`,`log_date`,`customer_name`,`account_number`,`part_num`,`warning`,`status`,`tolerance`,`comments`,`due_date`,`open_order_qty`,`sales_plan_qty`) values 
(1,'20220608','','','','Global Level','Open',0,NULL,'202205',1900000,1600000);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
