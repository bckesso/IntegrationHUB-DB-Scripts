/* EXECUTE SCRIPT USING 'ROOT' USER */

/* USE INTEGRATIONHUB DB */
USE `integrationhubdb`;

/* 1. Verify effected customers */
SELECT * FROM customer_system WHERE system_id=(SELECT id FROM system WHERE VALUE='JIRA');

/* 2. It must return 4 rows */
SELECT * FROM system_property WHERE NAME IN ('customfield_wf_id','customfield_wf_obj_type','workfrontTasksBecome','workfrontIssuesBecome');

/* 3. It must return 1 row */
SELECT * FROM system_mapping_property WHERE NAME LIKE 'unpairedSubTaskAction';

/* 4. It must return same rows count as effected customers row count */
SELECT * FROM customer_system_mapping_property WHERE system_mapping_property_id=(SELECT id FROM system_mapping_property WHERE NAME LIKE 'unpairedSubTaskAction');

/* 5. It must return same rows count as effected customers row count - Task */
SELECT * FROM customer_system_property WHERE system_property_id=(SELECT id FROM system_property WHERE NAME='workfrontTasksBecome') ORDER BY customer_system_id;

/* 6. It must return same rows count as effected customers row count - Issue */
SELECT * FROM customer_system_property WHERE system_property_id=(SELECT id FROM system_property WHERE NAME='workfrontIssuesBecome') ORDER BY customer_system_id;

/* 7. Verify master_email_configuration - Return 0 row */
SELECT * FROM master_email_configuration;

/* 8. Verify procedure has been droped - Return 0 row */
SELECT * FROM mysql.proc p WHERE db = 'integrationhubdb' AND NAME = 'ADD_SYSTEM_AND_MAPPING_PROPERTIES_FOR_EXISTING_CUSTOMERS';

/* 9. Verify password column droped from customer table - Must return message : Unknown column 'PASSWORD' in 'field list' */
SELECT PASSWORD FROM CUSTOMER;
