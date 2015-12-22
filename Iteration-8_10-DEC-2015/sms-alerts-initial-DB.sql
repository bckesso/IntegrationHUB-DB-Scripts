USE `integrationhubdb`;

create table if not exists `customer_sms_alerts` (
	`id` bigint (20),
	`alert_name` varchar (765),
	`carrier_id` bigint (20),
	`mobile_number` varchar (765),
	`project_id` varchar (765),
	`customer_id` bigint (20)
); 
insert into `customer_sms_alerts` (`id`, `alert_name`, `carrier_id`, `mobile_number`, `project_id`, `customer_id`) values('1','BCK Alert','1','3013463175','abcdefjhijklmnop','167');
insert into `customer_sms_alerts` (`id`, `alert_name`, `carrier_id`, `mobile_number`, `project_id`, `customer_id`) values('3','Testing 123','1','3013463175','abcdefjhijk','167');
insert into `customer_sms_alerts` (`id`, `alert_name`, `carrier_id`, `mobile_number`, `project_id`, `customer_id`) values('4','Testing 456','1','3013463175','1Q2W3E4R5T','182');
insert into `customer_sms_alerts` (`id`, `alert_name`, `carrier_id`, `mobile_number`, `project_id`, `customer_id`) values('6','Testing 789','1','3013463175','TOGGLE89','167');


create table if not exists `sms_carriers` (
	`id` bigint (20),
	`name` varchar (765),
	`suffix` varchar (765)
); 
insert into `sms_carriers` (`id`, `name`, `suffix`) values('1','AT&T','@txt.att.net');
insert into `sms_carriers` (`id`, `name`, `suffix`) values('2','Verizon','@vtext.com');
insert into `sms_carriers` (`id`, `name`, `suffix`) values('3','Sprint','@messaging.sprintpcs.com');
insert into `sms_carriers` (`id`, `name`, `suffix`) values('4','T-Mobile','@tmomail.net');
insert into `sms_carriers` (`id`, `name`, `suffix`) values('5','Boost Mobile','@myboostmobile.com');
insert into `sms_carriers` (`id`, `name`, `suffix`) values('6','Virgin Mobile','@vmobl.com');
insert into `sms_carriers` (`id`, `name`, `suffix`) values('7','Metro PCS','@mymetropcs.com');
insert into `sms_carriers` (`id`, `name`, `suffix`) values('8','Cricket Wireless','@sms.mycricket.com');



create table if not exists `menu` (
	`id` bigint (20),
	`name` varchar (765),
	`value` varchar (765)
); 
--insert into `menu` (`id`, `name`, `value`) values('1','Property','PROPERTY');
--insert into `menu` (`id`, `name`, `value`) values('2','Status','STATUS');
--insert into `menu` (`id`, `name`, `value`) values('3','Priority','PRIORITY');
--insert into `menu` (`id`, `name`, `value`) values('4','Mapping','MAPPING');
--insert into `menu` (`id`, `name`, `value`) values('5','Log','LOG');
--insert into `menu` (`id`, `name`, `value`) values('6','Configuration','CONFIGURATION');
insert into `menu` (`id`, `name`, `value`) values('7','SMS Alerts','SMS_ALERTS');


create table if not exists `system` (
	`id` bigint (20),
	`name` varchar (765),
	`value` varchar (765)
); 
--insert into `system` (`id`, `name`, `value`) values('1','Workfront','WORKFRONT');
--insert into `system` (`id`, `name`, `value`) values('2','JIRA','JIRA');
--insert into `system` (`id`, `name`, `value`) values('3','Outlook','OUTLOOK');
--insert into `system` (`id`, `name`, `value`) values('4','EMail','EMAIL');
insert into `system` (`id`, `name`, `value`) values('5','SMS','SMS');



create table if not exists`system_menu` (
	`id` bigint (20),
	`menu_id` bigint (20),
	`system_id` bigint (20)
); 
/*insert into `system_menu` (`id`, `menu_id`, `system_id`) values('1','1','1');
insert into `system_menu` (`id`, `menu_id`, `system_id`) values('2','2','1');
insert into `system_menu` (`id`, `menu_id`, `system_id`) values('3','3','1');
insert into `system_menu` (`id`, `menu_id`, `system_id`) values('4','1','2');
insert into `system_menu` (`id`, `menu_id`, `system_id`) values('5','2','2');
insert into `system_menu` (`id`, `menu_id`, `system_id`) values('6','3','2');
insert into `system_menu` (`id`, `menu_id`, `system_id`) values('7','4','2');
insert into `system_menu` (`id`, `menu_id`, `system_id`) values('8','5','2');
insert into `system_menu` (`id`, `menu_id`, `system_id`) values('9','1','3');
insert into `system_menu` (`id`, `menu_id`, `system_id`) values('10','6','4');*/
insert into `system_menu` (`id`, `menu_id`, `system_id`) values('11','7','5');

