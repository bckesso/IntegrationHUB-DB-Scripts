/* EXECUTE SCRIPT USING 'ROOT' USER */

/* USE INTEGRATIONHUB DB */
USE `integrationhubdb`;

/* DROP PASSWORD COLUMN FROM CUSTOMER TABLE */
ALTER TABLE customer DROP COLUMN PASSWORD;

/* CREATE - MASTER_EMAIL_CONFIGURATION TABLE */
CREATE TABLE `master_email_configuration` ( 
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT, 
	`host` VARCHAR(255) DEFAULT NULL,
	`password` VARCHAR(255) DEFAULT NULL, 
	`port` INT(11) DEFAULT NULL, 
	`username` VARCHAR(255) DEFAULT NULL, 
	PRIMARY KEY (`id`) ) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
	
/* UPDATE THE SYSTEM PROPERTIES FOR WF ID AND WF OBJECT TYPE */	
UPDATE system_property SET NAME='customfield_wf_id',display_name='Customfield Wrokfront ID' WHERE NAME LIKE 'customfield_issue';
UPDATE system_property SET NAME='customfield_wf_obj_type',display_name='Customfield Workfront Object Type' WHERE NAME LIKE 'customfield_task';

/* INSERT TWO NEW PROPERTIES "workfrontTasksBecome" AND "workfrontIssuesBecome" IN system_property TABLE FOR JIRA SYSTEM. */
INSERT INTO system_property (system_id,NAME,display_name,value_type_id,default_value) 
VALUES ((SELECT id FROM system WHERE NAME='JIRA'),'workfrontTasksBecome','Workfront Tasks Become',3,'Task');
INSERT INTO system_property (system_id,NAME,display_name,value_type_id,default_value) 
VALUES ((SELECT id FROM system WHERE NAME='JIRA'),'workfrontIssuesBecome','Workfront Issues Become',3,'Bug');

/* INSERT "unpairedSubTaskAction" PROPERTY INTO "system_mapping_property" TABLE. */
INSERT INTO system_mapping_property (system_mapping_id,NAME,display_name,default_value,description,value_type_id) 
	VALUES ((SELECT id FROM system_mapping WHERE from_system_id=(SELECT id FROM system WHERE VALUE='WORKFRONT') AND to_system_id=(SELECT id FROM system WHERE VALUE='JIRA')), 'unpairedSubTaskAction', 'Unpaired Sub-Task Action',1,'"Roll up activity on children tasks" option will not sync actual hours from Wrokfront To JIRA',5);

/* DROP PROCEDURE */
DROP PROCEDURE IF EXISTS ADD_SYSTEM_AND_MAPPING_PROPERTIES_FOR_EXISTING_CUSTOMERS;
	
DELIMITER $$
CREATE PROCEDURE ADD_SYSTEM_AND_MAPPING_PROPERTIES_FOR_EXISTING_CUSTOMERS()
BEGIN
   
   DECLARE _output TEXT DEFAULT '';
   
   /* VARIABLES FOR BLOCK-1 */
   DECLARE customersystemid BIGINT;
   DECLARE customerid BIGINT;
   DECLARE customersystemdone INT DEFAULT 0;
   
   /* VARIABLES FOR BLOCK-2 */
   DECLARE systempropertyid BIGINT;
   DECLARE systempropertydefaultvalue TEXT;
   DECLARE systempropertydone INT DEFAULT 0;
   
   /* VARIABLES FOR BLOCK-3 */
   DECLARE systemmappingpropertyid BIGINT;
   DECLARE systemmappingpropertydefaultvalue TEXT;
   DECLARE systemmappingpropertydone INT DEFAULT 0;
      
   /* FETCH CUSTOMERS HAVING SYSTEM 'JIRA' */
   BLOCK1:BEGIN
	DECLARE customer_system_cursor CURSOR FOR 
		SELECT id,customer_id FROM customer_system WHERE system_id=(SELECT id FROM system WHERE NAME='JIRA');
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET customersystemdone = TRUE;
	OPEN customer_system_cursor;
	customersystemloop:LOOP FETCH customer_system_cursor INTO customersystemid,customerid;
   	  IF customersystemdone THEN
		LEAVE customersystemloop;
		CLOSE customer_system_cursor;
	   END IF;
	   
	  SET _output = CONCAT(_output,'|| CUSTOMER ID:',customerid,', CUSTOMER SYSTEM ID:',customersystemid,',');
		
	   /* FETCH NEWLY ADDED SYSTEM PROPERTIES AND INSERT INTO CUSTOMER_SYSTEM_PROPERTY TABLE FOR EACH CUSTOMER */
	   BLOCK2:BEGIN
	      DECLARE system_property_cursor CURSOR FOR 
		SELECT id,default_value FROM system_property WHERE NAME IN ('workfrontTasksBecome','workfrontIssuesBecome');
	      DECLARE CONTINUE HANDLER FOR NOT FOUND SET systempropertydone = TRUE;	
		   OPEN system_property_cursor;
			systempropertyloop:LOOP FETCH system_property_cursor INTO systempropertyid,systempropertydefaultvalue;
			
				IF systempropertydone  THEN
					SET systempropertydone = FALSE;
					LEAVE systempropertyloop;
					CLOSE system_property_cursor;  
				END IF;
				SET _output = CONCAT(_output,'SYSTEM PROPERTY ID:',systempropertyid,', ');
				
				INSERT INTO customer_system_property (customer_system_id, system_property_id,VALUE) VALUES 
						(customersystemid,systempropertyid,systempropertydefaultvalue);				
				
			END LOOP systempropertyloop;
	     END BLOCK2;
	     
	     /* FETCH NEWLY ADDED SYSTEM MAPPING PROPERTY AND INSERT INTO CUSTOMER_SYSTEM_MAPPING_PROPERTY TABLE FOR EACH CUSTOMER */
	     BLOCK3:BEGIN
	      DECLARE system_mapping_property_cursor CURSOR FOR 
		SELECT id,default_value FROM system_mapping_property WHERE NAME LIKE 'unpairedSubTaskAction';
	      DECLARE CONTINUE HANDLER FOR NOT FOUND SET systemmappingpropertydone = TRUE;	
		   OPEN system_mapping_property_cursor;
			systemmappingpropertyloop:LOOP FETCH system_mapping_property_cursor INTO systemmappingpropertyid,systemmappingpropertydefaultvalue;
			
				IF systemmappingpropertydone  THEN
					SET systemmappingpropertydone = FALSE;
					LEAVE systemmappingpropertyloop;
					CLOSE system_mapping_property_cursor;  
				END IF;
				SET _output = CONCAT(_output,'SYSTEM MAPPING PROPERTY ID:',systemmappingpropertyid,' || ');				
				
				INSERT INTO customer_system_mapping_property (customer_id,system_mapping_property_id,VALUE)
					VALUES (customerid,systemmappingpropertyid,systemmappingpropertydefaultvalue);
				
			END LOOP systemmappingpropertyloop;
	     END BLOCK3;
	     
	END LOOP customersystemloop;
   
   END BLOCK1;
   
   SELECT _output;
   
   COMMIT;
   
END$$
DELIMITER ;

/* CALL PROCEDURE */
CALL ADD_SYSTEM_AND_MAPPING_PROPERTIES_FOR_EXISTING_CUSTOMERS();

/* DROP PROCEDURE */
DROP PROCEDURE IF EXISTS ADD_SYSTEM_AND_MAPPING_PROPERTIES_FOR_EXISTING_CUSTOMERS;