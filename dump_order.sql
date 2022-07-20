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
  `activity_date` date NOT NULL,
  `file_name` varchar(20) NOT NULL,
  `file_type` varchar(20) NOT NULL,
  `activity_status` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `mnth_end_order` tinyint(4) NOT NULL DEFAULT 0,
  `file_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `activity_log` */

insert  into `activity_log`(`id`,`activity_date`,`file_name`,`file_type`,`activity_status`,`message`,`mnth_end_order`,`file_path`) values 
(1,'2022-07-18','salesorder.csv','Sales Plan','Success','2 rows inserted',0,NULL),
(2,'2022-07-18','dumpopenorders.csv','Open Order','Success','3 rows inserted',0,NULL),
(3,'2022-07-18','dumpopenorders.csv','Open Order','Success','3 rows inserted',0,NULL),
(4,'2022-07-18','dumpopenorders.csv','Open Order','Success','3 rows inserted',0,NULL),
(5,'2022-07-18','dumpopenorders.csv','Open Order','Success','3 rows inserted',0,NULL),
(6,'2022-07-18','dumpopenorders.csv','Open Order','Success','3 rows inserted',0,NULL),
(7,'2022-07-18','dumpopenorders.csv','Open Order','Success','3 rows inserted',0,NULL),
(8,'2022-07-18','dumpopenorders.csv','Open Order','Success','3 rows inserted',0,NULL),
(9,'2022-07-18','dumpopenorders.csv','Open Order','Success','3 rows inserted',0,NULL),
(10,'2022-07-18','dumpopenorders.csv','Open Order','Success','3 rows inserted',0,NULL),
(11,'2022-07-20','salesorder.csv','Sales Plan','Success','2 rows inserted',0,NULL),
(12,'2022-07-20','dumpopenorders.csv','Open Order','Success','3 rows inserted',0,NULL);

/*Table structure for table `condition_list` */

DROP TABLE IF EXISTS `condition_list`;

CREATE TABLE `condition_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formula_name` varchar(200) NOT NULL,
  `formula_value` text NOT NULL,
  `updated_date` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `condition_list` */

insert  into `condition_list`(`id`,`formula_name`,`formula_value`,`updated_date`) values 
(8,'','',NULL);

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
(1,'','Global Default setting for all customers',',kunwar.nabeel@hotmail.com','20220621'),
(2,'','Customer specific setting','','20220616');

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
  `description` text NOT NULL,
  `due_date` varchar(8) NOT NULL,
  `total_qty` int(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `open_orders` */

insert  into `open_orders`(`id`,`date`,`org_id`,`name`,`account_id`,`part_number`,`description`,`due_date`,`total_qty`,`status`) values 
(1,'20220705','TBD','Aptiv Services US, LLC','D05916','60982828','Connector A','220922',2000,0),
(2,'20220705','TBD','Aptiv Services US, LLC','D05916','60989615','Connector A','220922',1500,0),
(3,'20220705','TBD','Aptiv Services US, LLC','D05916','60990005','Connector A','220922',3000,0),
(4,'20220705','TBD','Aptiv Services US, LLC','D05916','60982828','Connector A','220922',2000,1),
(5,'20220705','TBD','Aptiv Services US, LLC','D05916','60989615','Connector A','220922',1500,1),
(6,'20220705','TBD','Aptiv Services US, LLC','D05916','60990005','Connector A','220922',3000,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `sales_order` */

insert  into `sales_order`(`id`,`customer_name`,`account_num`,`part_num`,`office`,`period`,`value`,`status`,`import_date`) values 
(1,'Aptiv Services US, LLC','D05916','60982828','NOVI','220922','500',0,'20220718'),
(2,'Aptiv Services US, LLC','D05916','60989615','NOVI','220922','500',0,'20220718'),
(3,'Aptiv Services US, LLC','D05916','60982828','NOVI','220922','500',1,'20220720'),
(4,'Aptiv Services US, LLC','D05916','60989615','NOVI','220922','500',1,'20220720');

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`,`org_id`,`name`,`account_id`,`part_number`,`description`,`due_date`,`total_qty`,`status`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `unplanned_orders` */

insert  into `unplanned_orders`(`id`,`date`,`org_id`,`name`,`account_id`,`part_number`,`description`,`due_date`,`total_qty`,`status`) values 
(1,'20220705','TBD','Aptiv Services US, LLC','D05916','60990005','Connector A','220922',3000,1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

/*Table structure for table `warning` */

DROP TABLE IF EXISTS `warning`;

CREATE TABLE `warning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `customer_num` varchar(20) DEFAULT NULL,
  `threshold` varchar(5) DEFAULT NULL,
  `updated_date` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `warning` */

insert  into `warning`(`id`,`type`,`customer_num`,`threshold`,`updated_date`) values 
(1,'Default setting for all customers','All Customers','1.5','20220608'),
(2,'Global warning setting','Global Warning','2','20220623'),
(13,'Customer specific setting','','',NULL);

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
  `open_order_qty` bigint(20) DEFAULT NULL,
  `sales_plan_qty` bigint(20) DEFAULT NULL,
  `user_notes` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `warning_log` */

insert  into `warning_log`(`id`,`log_date`,`customer_name`,`account_number`,`part_num`,`warning`,`status`,`tolerance`,`comments`,`due_date`,`open_order_qty`,`sales_plan_qty`,`user_notes`,`description`) values 
(1,'20220720','Aptiv Services US, L','D05916','60982828','Customer Item Level','Open',1.5,NULL,'220922',2000,500,NULL,'Connector A'),
(2,'20220720','Aptiv Services US, L','D05916','60989615','Customer Item Level','Open',1.5,NULL,'220922',1500,500,NULL,'Connector A'),
(3,'20220720','Aptiv Services US, L','D05916','60982828','Global Level','Open',2,NULL,'220922',2000,500,NULL,'Connector A'),
(4,'20220720','Aptiv Services US, L','D05916','60989615','Global Level','Open',2,NULL,'220922',1500,500,NULL,'Connector A');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
