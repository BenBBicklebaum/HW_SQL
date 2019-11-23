# SQL Joins

## Part 1

* Describe the different types of join clauses supported in SQL.

Answer:
Inner: join two tables where the records being joined exist in both tables
Outer: This is a full join where all records are combined from both tables regardless if they may exist in only one table
Left: join two tables based on the records in the left table, which essentially appends the right table to the left table
Right: join two tables based on the records in the right table, which essentially appends the left table to the right table

## Part 2

* Consider the following tables:

  * vendor_table
  ![vendor_table.png](Images/vendor_table.png)

  * yarn_table
  ![yarn_table.png](Images/yarn_table.png)

* Which join was used to create the final view below?

  ![table_join.png](Images/table_join.png)
Answer:
This query was joined on the vendor_table.  You can tell this because yarn_name and yarn_type are Null for vendor_name 'Tahki'

* _You can use pgAdmin and create a new table to test out this activity_
