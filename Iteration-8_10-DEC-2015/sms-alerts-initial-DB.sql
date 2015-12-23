USE `integrationhubdb`;


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


insert into `menu` (`id`, `name`, `value`) values('7','SMS Alerts','SMS_ALERTS');


insert into `system` (`id`, `name`, `value`) values('5','SMS','SMS');


insert into `system_menu` (`id`, `menu_id`, `system_id`) values('11','7','5');

