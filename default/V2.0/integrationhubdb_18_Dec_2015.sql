/*
SQLyog Community v12.09 (64 bit)
MySQL - 5.5.12 : Database - integrationhubdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`integrationhubdb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `integrationhubdb`;

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `point_of_contact_address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `point_of_contact_phone` varchar(255) CHARACTER SET utf8 NOT NULL,
  `point_of_contact_email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` bit(1) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `point_of_contact_first_name` varchar(255) NOT NULL,
  `point_of_contact_last_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

/*Table structure for table `customer_system` */

DROP TABLE IF EXISTS `customer_system`;

CREATE TABLE `customer_system` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL,
  `system_id` bigint(20) NOT NULL,
  `start_date` varchar(225) DEFAULT NULL,
  `end_date` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_system_id` (`customer_id`,`system_id`),
  KEY `FK_2lfrydimkjv7krjq74j88yajm` (`customer_id`),
  KEY `FK_jlh7w8tfac0s26sy7k0dni61w` (`system_id`),
  CONSTRAINT `FK_2lfrydimkjv7krjq74j88yajm` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_jlh7w8tfac0s26sy7k0dni61w` FOREIGN KEY (`system_id`) REFERENCES `system` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=latin1;

/*Data for the table `customer_system` */

/*Table structure for table `customer_system_custom_field_mapping` */

DROP TABLE IF EXISTS `customer_system_custom_field_mapping`;

CREATE TABLE `customer_system_custom_field_mapping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) DEFAULT NULL,
  `from_custom_field` varchar(255) DEFAULT NULL,
  `is_forward_mapping_allowed` bit(1) NOT NULL,
  `is_reverse_mapping_allowed` bit(1) NOT NULL,
  `system_mapping_id` bigint(20) DEFAULT NULL,
  `to_custom_field` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6yicku2myb2mcs3lbbsgi3fbu` (`customer_id`),
  KEY `FK_nq2sdjgeo175qjdlmo6c47tog` (`system_mapping_id`),
  CONSTRAINT `FK_6yicku2myb2mcs3lbbsgi3fbu` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_nq2sdjgeo175qjdlmo6c47tog` FOREIGN KEY (`system_mapping_id`) REFERENCES `system_mapping` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

/*Data for the table `customer_system_custom_field_mapping` */

/*Table structure for table `customer_system_field_mapping` */

DROP TABLE IF EXISTS `customer_system_field_mapping`;

CREATE TABLE `customer_system_field_mapping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL,
  `system_field_mapping_id` bigint(20) NOT NULL,
  `is_reverse_mapping_allowed` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_hyhk5ofbfe44gtv6tltha0lr` (`customer_id`),
  KEY `FK_eliyaaddu07xkrnpmef4hb7q8` (`system_field_mapping_id`),
  CONSTRAINT `FK_eliyaaddu07xkrnpmef4hb7q8` FOREIGN KEY (`system_field_mapping_id`) REFERENCES `system_field_mapping` (`id`),
  CONSTRAINT `FK_hyhk5ofbfe44gtv6tltha0lr` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=628 DEFAULT CHARSET=latin1;

/*Data for the table `customer_system_field_mapping` */

/*Table structure for table `customer_system_mapping_property` */

DROP TABLE IF EXISTS `customer_system_mapping_property`;

CREATE TABLE `customer_system_mapping_property` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL,
  `system_mapping_property_id` bigint(20) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_system_mapping_property_id` (`customer_id`,`system_mapping_property_id`),
  KEY `FK_ai5rmlqmy8c1455roe8ehph3s` (`customer_id`),
  KEY `FK_ifkdr2ohtcqaaocp64m1ucwoj` (`system_mapping_property_id`),
  CONSTRAINT `FK_ai5rmlqmy8c1455roe8ehph3s` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_ifkdr2ohtcqaaocp64m1ucwoj` FOREIGN KEY (`system_mapping_property_id`) REFERENCES `system_mapping_property` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `customer_system_mapping_property` */

/*Table structure for table `customer_system_priority` */

DROP TABLE IF EXISTS `customer_system_priority`;

CREATE TABLE `customer_system_priority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_system_id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `search_key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4lg65g7mbbk60eidd3wsax2c4` (`customer_system_id`),
  CONSTRAINT `FK_4lg65g7mbbk60eidd3wsax2c4` FOREIGN KEY (`customer_system_id`) REFERENCES `customer_system` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

/*Data for the table `customer_system_priority` */

/*Table structure for table `customer_system_priority_mapping` */

DROP TABLE IF EXISTS `customer_system_priority_mapping`;

CREATE TABLE `customer_system_priority_mapping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_priority_id` bigint(20) NOT NULL,
  `to_priority_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_8fs1l7sr47gm5jpug1wjgf5o8` (`from_priority_id`),
  KEY `FK_jcovjoskevxewsdef4o5r5o4d` (`to_priority_id`),
  CONSTRAINT `FK_8fs1l7sr47gm5jpug1wjgf5o8` FOREIGN KEY (`from_priority_id`) REFERENCES `customer_system_priority` (`id`),
  CONSTRAINT `FK_jcovjoskevxewsdef4o5r5o4d` FOREIGN KEY (`to_priority_id`) REFERENCES `customer_system_priority` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `customer_system_priority_mapping` */

/*Table structure for table `customer_system_property` */

DROP TABLE IF EXISTS `customer_system_property`;

CREATE TABLE `customer_system_property` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_system_id` bigint(20) DEFAULT NULL,
  `system_property_id` bigint(20) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_system_property_id` (`customer_system_id`,`system_property_id`),
  KEY `FK_ipkujppt8nfoxur0dj8n2q13b` (`customer_system_id`),
  KEY `FK_3447dgscq53hnpmnn2qsecsuq` (`system_property_id`),
  CONSTRAINT `FK_3447dgscq53hnpmnn2qsecsuq` FOREIGN KEY (`system_property_id`) REFERENCES `system_property` (`id`),
  CONSTRAINT `FK_ipkujppt8nfoxur0dj8n2q13b` FOREIGN KEY (`customer_system_id`) REFERENCES `customer_system` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=846 DEFAULT CHARSET=latin1;

/*Data for the table `customer_system_property` */

/*Table structure for table `customer_system_status` */

DROP TABLE IF EXISTS `customer_system_status`;

CREATE TABLE `customer_system_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_system_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `search_key` varchar(255) NOT NULL,
  `system_reporting_type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_l5i1h4t416070w9pxqobmq9px` (`customer_system_id`),
  KEY `FK_2pprmnm307xud4cuk0p22me4y` (`system_reporting_type_id`),
  CONSTRAINT `FK_2pprmnm307xud4cuk0p22me4y` FOREIGN KEY (`system_reporting_type_id`) REFERENCES `system_reportingtype` (`id`),
  CONSTRAINT `FK_l5i1h4t416070w9pxqobmq9px` FOREIGN KEY (`customer_system_id`) REFERENCES `customer_system` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;

/*Data for the table `customer_system_status` */

/*Table structure for table `customer_system_status_mapping` */

DROP TABLE IF EXISTS `customer_system_status_mapping`;

CREATE TABLE `customer_system_status_mapping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_status_id` bigint(20) NOT NULL,
  `to_status_id` bigint(20) NOT NULL,
  `action_on_system_id` bigint(20) NOT NULL,
  `is_create_action` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6n400f1v9xqf1ow3ua0bkxofs` (`from_status_id`),
  KEY `FK_pvtfbl80825rkt6dajec3fi78` (`to_status_id`),
  KEY `FK_kqgtjmarhao3hib8w94drfbbv` (`action_on_system_id`),
  CONSTRAINT `FK_6n400f1v9xqf1ow3ua0bkxofs` FOREIGN KEY (`from_status_id`) REFERENCES `customer_system_status` (`id`),
  CONSTRAINT `FK_kqgtjmarhao3hib8w94drfbbv` FOREIGN KEY (`action_on_system_id`) REFERENCES `system` (`id`),
  CONSTRAINT `FK_pvtfbl80825rkt6dajec3fi78` FOREIGN KEY (`to_status_id`) REFERENCES `customer_system_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;

/*Data for the table `customer_system_status_mapping` */

/*Table structure for table `customer_system_subscription_history` */

DROP TABLE IF EXISTS `customer_system_subscription_history`;

CREATE TABLE `customer_system_subscription_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date_time` datetime DEFAULT NULL,
  `customer_system_id` bigint(20) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_95i337cuj8jt56vcdklropyrx` (`customer_system_id`),
  CONSTRAINT `FK_95i337cuj8jt56vcdklropyrx` FOREIGN KEY (`customer_system_id`) REFERENCES `customer_system` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `customer_system_subscription_history` */

/*Table structure for table `email_assignment_routing` */

DROP TABLE IF EXISTS `email_assignment_routing`;

CREATE TABLE `email_assignment_routing` (
  `assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `value` varchar(50) NOT NULL,
  PRIMARY KEY (`assignment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `email_assignment_routing` */

insert  into `email_assignment_routing`(`assignment_id`,`description`,`value`) values (1,'assign to sender','assign to sender');

/*Table structure for table `email_body_handling` */

DROP TABLE IF EXISTS `email_body_handling`;

CREATE TABLE `email_body_handling` (
  `body_handling_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `value` varchar(50) NOT NULL,
  PRIMARY KEY (`body_handling_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `email_body_handling` */

insert  into `email_body_handling`(`body_handling_id`,`description`,`value`) values (1,'accept external','accept externl');

/*Table structure for table `email_configuration` */

DROP TABLE IF EXISTS `email_configuration`;

CREATE TABLE `email_configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `assignee` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `host` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `project` varchar(255) DEFAULT NULL,
  `project_status` varchar(255) DEFAULT NULL,
  `route_to` varchar(7) NOT NULL,
  `type` varchar(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_thex6kte37wsj9sx4iece2j51` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `email_configuration` */

insert  into `email_configuration`(`id`,`version`,`assignee`,`email`,`host`,`password`,`port`,`project`,`project_status`,`route_to`,`type`) values (1,0,'Owner','ooo@aurotechcorp.com','imap.gmail.com','email2wf',993,NULL,'New','Project','imap');

/*Table structure for table `email_mappings` */

DROP TABLE IF EXISTS `email_mappings`;

CREATE TABLE `email_mappings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_username` varchar(100) NOT NULL,
  `email_password` varchar(50) NOT NULL,
  `email_hostname` varchar(50) NOT NULL,
  `email_port` int(50) NOT NULL,
  `name` varchar(75) NOT NULL,
  `type` varchar(25) NOT NULL,
  `route_to` varchar(75) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  `body_handling_id` bigint(20) NOT NULL,
  `assignment_id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `assignee` varchar(255) NOT NULL,
  `project` varchar(255) DEFAULT NULL,
  `project_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email_permission_id_constraint` (`permission_id`),
  KEY `body_handling_id_constraint` (`body_handling_id`),
  KEY `assignment_id_consraint` (`assignment_id`),
  CONSTRAINT `assignment_id_consraint` FOREIGN KEY (`assignment_id`) REFERENCES `email_assignment_routing` (`assignment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `body_handling_id_constraint` FOREIGN KEY (`body_handling_id`) REFERENCES `email_body_handling` (`body_handling_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `email_permission_id_constraint` FOREIGN KEY (`permission_id`) REFERENCES `email_permissions` (`permission_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `email_mappings` */

insert  into `email_mappings`(`id`,`email_username`,`email_password`,`email_hostname`,`email_port`,`name`,`type`,`route_to`,`permission_id`,`body_handling_id`,`assignment_id`,`version`,`assignee`,`project`,`project_status`) values (1,'ooo@aurotechcorp.com','email2wf','imap.gmail.com',0,'task_email','TASK','55c0ec760006e63213ce571249617ffa',1,1,1,0,'',NULL,NULL);

/*Table structure for table `email_permissions` */

DROP TABLE IF EXISTS `email_permissions`;

CREATE TABLE `email_permissions` (
  `permission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `value` varchar(50) NOT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `email_permissions` */

insert  into `email_permissions`(`permission_id`,`description`,`value`) values (1,'Assign to sender','Assign to sender');

/*Table structure for table `integration_log` */

DROP TABLE IF EXISTS `integration_log`;

CREATE TABLE `integration_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_count` int(11) DEFAULT '0',
  `failed_to_create_count` int(11) DEFAULT '0',
  `failed_to_create_message` longblob,
  `failed_to_update_count` int(11) DEFAULT '0',
  `failed_to_update_message` longblob,
  `obj_code` varchar(255) DEFAULT NULL,
  `run_date_time` varchar(255) DEFAULT NULL,
  `total_count` int(11) DEFAULT '0',
  `updated_count` int(11) DEFAULT '0',
  `customer_id` bigint(20) DEFAULT NULL,
  `system_mapping_id` bigint(20) DEFAULT NULL,
  `system_id` bigint(20) NOT NULL,
  `updated_object_log` longblob,
  `found_object_log` longblob,
  PRIMARY KEY (`id`),
  KEY `FK_90gky7ag1iqf8yse6k9lpuj8p` (`customer_id`),
  KEY `FK_9a0d6wkw5spefuo1belul84d5` (`system_mapping_id`),
  KEY `FK_5axshl5rl91tmaja0ox2cuh0m` (`system_id`),
  CONSTRAINT `FK_5axshl5rl91tmaja0ox2cuh0m` FOREIGN KEY (`system_id`) REFERENCES `system` (`id`),
  CONSTRAINT `FK_90gky7ag1iqf8yse6k9lpuj8p` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_9a0d6wkw5spefuo1belul84d5` FOREIGN KEY (`system_mapping_id`) REFERENCES `system_mapping` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `integration_log` */

/*Table structure for table `master_email_configuration` */

DROP TABLE IF EXISTS `master_email_configuration`;

CREATE TABLE `master_email_configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `master_email_configuration` */

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `menu` */

insert  into `menu`(`id`,`name`,`value`) values (1,'Property','PROPERTY'),(2,'Status','STATUS'),(3,'Priority','PRIORITY'),(4,'Mapping','MAPPING'),(5,'Log','LOG'),(6,'Configuration','CONFIGURATION');

/*Table structure for table `property_value_type` */

DROP TABLE IF EXISTS `property_value_type`;

CREATE TABLE `property_value_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `property_value_type` */

insert  into `property_value_type`(`id`,`type`) values (1,'email'),(2,'url'),(3,'string'),(4,'password'),(5,'integer'),(7,'datetime'),(8,'double'),(9,'boolean');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `roles` */

insert  into `roles`(`id`,`description`,`name`) values (1,'Root user','ROOT'),(2,'This is the system admin from customer','SYSTEM_ADMIN'),(3,'This is the integration service user','SERVICE_ADMIN');

/*Table structure for table `system` */

DROP TABLE IF EXISTS `system`;

CREATE TABLE `system` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `system` */

insert  into `system`(`id`,`name`,`value`) values (1,'Workfront','WORKFRONT'),(2,'JIRA','JIRA'),(3,'Outlook','OUTLOOK'),(4,'EMail','EMAIL');

/*Table structure for table `system_field` */

DROP TABLE IF EXISTS `system_field`;

CREATE TABLE `system_field` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) NOT NULL,
  `system_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_thp5jg4rhjd2x4u8lthfwt47e` (`system_id`),
  CONSTRAINT `FK_thp5jg4rhjd2x4u8lthfwt47e` FOREIGN KEY (`system_id`) REFERENCES `system` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `system_field` */

insert  into `system_field`(`id`,`field_name`,`system_id`) values (1,'name',1),(2,'description',1),(3,'priority',1),(4,'enteredBy',1),(5,'assignedToID',1),(6,'plannedCompletionDate',1),(7,'updates',1),(8,'plannedHours',1),(9,'actualHours',1),(10,'documents',1),(11,'summary',2),(12,'description',2),(13,'priority',2),(14,'reporter',2),(15,'assignee',2),(16,'duedate',2),(17,'comment',2),(18,'originalEstimate',2),(19,'worklog',2),(20,'attachment',2),(21,'status',1),(22,'status',2);

/*Table structure for table `system_field_mapping` */

DROP TABLE IF EXISTS `system_field_mapping`;

CREATE TABLE `system_field_mapping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_system_field_id` bigint(20) NOT NULL,
  `is_required` bit(1) NOT NULL,
  `system_mapping_id` bigint(20) NOT NULL,
  `to_system_field_id` bigint(20) NOT NULL,
  `is_reverse_mapping_possible` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_su7plox2fsmyhymxw19kct1xp` (`from_system_field_id`),
  KEY `FK_qgd7bm3cqe4frerxgfdwwbrkn` (`system_mapping_id`),
  KEY `FK_1sa1v6pvd685jr9k44749joeg` (`to_system_field_id`),
  CONSTRAINT `FK_1sa1v6pvd685jr9k44749joeg` FOREIGN KEY (`to_system_field_id`) REFERENCES `system_field` (`id`),
  CONSTRAINT `FK_qgd7bm3cqe4frerxgfdwwbrkn` FOREIGN KEY (`system_mapping_id`) REFERENCES `system_mapping` (`id`),
  CONSTRAINT `FK_su7plox2fsmyhymxw19kct1xp` FOREIGN KEY (`from_system_field_id`) REFERENCES `system_field` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `system_field_mapping` */

insert  into `system_field_mapping`(`id`,`from_system_field_id`,`is_required`,`system_mapping_id`,`to_system_field_id`,`is_reverse_mapping_possible`) values (1,1,'',1,11,''),(2,2,'\0',1,12,''),(3,3,'\0',1,13,''),(4,4,'\0',1,14,'\0'),(5,5,'\0',1,15,''),(6,6,'\0',1,16,''),(7,7,'\0',1,17,''),(8,8,'\0',1,18,''),(9,9,'\0',1,19,''),(10,10,'\0',1,20,''),(21,21,'',1,22,'');

/*Table structure for table `system_mapping` */

DROP TABLE IF EXISTS `system_mapping`;

CREATE TABLE `system_mapping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_system_id` bigint(20) NOT NULL,
  `to_system_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ootn7nbme7fnpxgh1vncmmkyo` (`from_system_id`),
  KEY `FK_t4c3ib63wxe0fab270dmwi6p7` (`to_system_id`),
  CONSTRAINT `FK_ootn7nbme7fnpxgh1vncmmkyo` FOREIGN KEY (`from_system_id`) REFERENCES `system` (`id`),
  CONSTRAINT `FK_t4c3ib63wxe0fab270dmwi6p7` FOREIGN KEY (`to_system_id`) REFERENCES `system` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `system_mapping` */

insert  into `system_mapping`(`id`,`from_system_id`,`to_system_id`) values (1,1,2);

/*Table structure for table `system_mapping_property` */

DROP TABLE IF EXISTS `system_mapping_property`;

CREATE TABLE `system_mapping_property` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `system_mapping_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `value_type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_t71ukkig9fsofh7wuqlw0cmbw` (`system_mapping_id`),
  KEY `FK_n9f3bsb55b5wthrw8is33y0ri` (`value_type_id`),
  CONSTRAINT `FK_n9f3bsb55b5wthrw8is33y0ri` FOREIGN KEY (`value_type_id`) REFERENCES `property_value_type` (`id`),
  CONSTRAINT `FK_t71ukkig9fsofh7wuqlw0cmbw` FOREIGN KEY (`system_mapping_id`) REFERENCES `system_mapping` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `system_mapping_property` */

insert  into `system_mapping_property`(`id`,`system_mapping_id`,`name`,`display_name`,`default_value`,`description`,`value_type_id`) values (1,1,'workfrontToJiraSyncInterval','Workfront-Jira Sync Interval (In Minutes)','60',NULL,5),(2,1,'workfrontToJiraReverseSyncInterval','Workfront-Jira Reverse Sync Interval (In Minutes)','60',NULL,5),(3,1,'workfrontToJiraCommentPrivacy','Workfront-Jira Comment Privacy','1',NULL,5),(4,1,'workfrontToJiraReverseCommentPrivacy','Workfront-Jira Reverse Comment Privacy','1',NULL,5),(5,1,'unpairedSubTaskAction','Unpaired Sub-Task Action','1','\"Roll up activity on children tasks\" option will not sync actual hours from Workfront To JIRA',5);

/*Table structure for table `system_menu` */

DROP TABLE IF EXISTS `system_menu`;

CREATE TABLE `system_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_id` bigint(20) NOT NULL,
  `system_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_8nfn001c53cvkbyw3i5xfqb8f` (`menu_id`),
  KEY `FK_47ag5pad584tesl2aejbrk447` (`system_id`),
  CONSTRAINT `FK_47ag5pad584tesl2aejbrk447` FOREIGN KEY (`system_id`) REFERENCES `system` (`id`),
  CONSTRAINT `FK_8nfn001c53cvkbyw3i5xfqb8f` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `system_menu` */

insert  into `system_menu`(`id`,`menu_id`,`system_id`) values (1,1,1),(2,2,1),(3,3,1),(4,1,2),(5,2,2),(6,3,2),(7,4,2),(8,5,2),(9,1,3),(10,6,4);

/*Table structure for table `system_property` */

DROP TABLE IF EXISTS `system_property`;

CREATE TABLE `system_property` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `system_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `value_type_id` bigint(20) NOT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pkahcp5woymw72e2hts9xlxjo` (`system_id`),
  KEY `FK_h5dsi2iyuaqhhlu5oxjojydu7` (`value_type_id`),
  CONSTRAINT `FK_h5dsi2iyuaqhhlu5oxjojydu7` FOREIGN KEY (`value_type_id`) REFERENCES `property_value_type` (`id`),
  CONSTRAINT `FK_pkahcp5woymw72e2hts9xlxjo` FOREIGN KEY (`system_id`) REFERENCES `system` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `system_property` */

insert  into `system_property`(`id`,`system_id`,`name`,`display_name`,`value_type_id`,`default_value`,`description`) values (1,1,'url','URL',2,NULL,''),(2,1,'username','Username',1,NULL,NULL),(3,1,'password','Password',4,NULL,''),(4,1,'taskLastUpdateDateTime','Task Last Update DateTime',7,NULL,NULL),(5,1,'issueLastUpdateDateTime','Issue Last Update DateTime',7,NULL,NULL),(6,1,'syncTask','Sync Task',9,'true',NULL),(7,1,'syncIssue','Sync Issue',9,'true',NULL),(8,2,'url','URL',2,NULL,''),(9,2,'username','Username',3,NULL,''),(10,2,'password','Password',4,NULL,''),(11,2,'lastUpdateDateTime','Last Update DateTime',7,NULL,NULL),(12,2,'customfield_wf_id','Customfield Workfront ID',3,NULL,NULL),(13,2,'customfield_wf_obj_type','Customfield Workfront Object Type',3,NULL,NULL),(14,2,'customfield_assignees','Customfield Workfront Assignees',3,NULL,NULL),(15,3,'pollingFrequency','Polling Frequency (In Minutes)',5,'30',NULL),(16,2,'workfrontTasksBecome','Workfront Tasks Become',3,'Task',NULL),(17,2,'workfrontIssuesBecome','Workfront Issues Become',3,'Bug',NULL);

/*Table structure for table `system_reportingtype` */

DROP TABLE IF EXISTS `system_reportingtype`;

CREATE TABLE `system_reportingtype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reporting_type` varchar(255) DEFAULT NULL,
  `system_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_277fb9cqu946yifylxtg6bfxk` (`system_id`),
  CONSTRAINT `FK_277fb9cqu946yifylxtg6bfxk` FOREIGN KEY (`system_id`) REFERENCES `system` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `system_reportingtype` */

insert  into `system_reportingtype`(`id`,`reporting_type`,`system_id`) values (1,'OpTask',1),(2,'Task',1),(3,'Issue',2);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `is_active` bit(1) NOT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `is_default_system_administrator` bit(1) NOT NULL,
  `reset_password` bit(1) NOT NULL,
  `roles_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`),
  KEY `FK_72efjd5u3nqtjdduip5wwvd39` (`customer_id`),
  KEY `FK_krvotbtiqhudlkamvlpaqus0t` (`role_id`),
  KEY `FK_omii8qay0i55ud0h1pynki901` (`roles_id`),
  CONSTRAINT `FK_72efjd5u3nqtjdduip5wwvd39` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_krvotbtiqhudlkamvlpaqus0t` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_omii8qay0i55ud0h1pynki901` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`customer_id`,`email`,`first_name`,`is_active`,`last_login_date`,`last_name`,`password`,`role_id`,`is_default_system_administrator`,`reset_password`,`roles_id`) values (1,NULL,'root','Root','','2015-12-18 16:06:38','User','0e7517141fb53f21ee439b355b5a1d0a',1,'\0','\0',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
