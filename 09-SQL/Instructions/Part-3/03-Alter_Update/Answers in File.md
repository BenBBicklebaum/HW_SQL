# Alter vs. Update


### Part 1

* Explain the difference between `alter` and `update` in SQL statements.

Answer: Alter is used to update the table itself (the metadata) and update is used to update the data within the table.

### Part 2

* You are given the following table:

  ![Images/alter_update01.png](Images/alter_update01.png)

* Change the name of the column from `department_id` to `dept_id`.
Answer: 
ALTER TABLE table_name 
RENAME department_id TO dept_id;


* Add a column named `annual_salary` to the table.
Answer:
ALTER TABLE table_name
ADD COLUMN annual_salary integer
;
* _You can use pgAdmin and create a new table to test out this activity_
* _Save your completed SQL file in this folder._
