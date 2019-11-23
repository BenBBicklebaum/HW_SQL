# The Thrill of the Case


* Change each animal's species to the correct species.

  ![Images/case01.png](Images/case01.png)
  Answer:

UPDATE table_name
SET species = mouse
WHERE
   animal_name = 'Mickey Mouse';
   
UPDATE table_name
SET species = duck
WHERE
   animal_name = 'Donald Duck';

* _You can use pgAdmin and create a new table to test out this activity_
* _Save your completed SQL file in this folder._
