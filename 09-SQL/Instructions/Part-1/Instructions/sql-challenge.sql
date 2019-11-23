CREATE TABLE "dept" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_dept" PRIMARY KEY (
        "dept_no"
     )
);

DROP TABLE IF EXISTS dept_emp CASCADE; 
CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "from_date" VARCHAR   NOT NULL,
    "to_date" VARCHAR   NOT NULL
     );

CREATE TABLE "dept_mng" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL,
    "from_date" VARCHAR   NOT NULL,
    "to_date" VARCHAR   NOT NULL,
    CONSTRAINT "pk_dept_mng" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "emp" (
    "emp_no" INT   NOT NULL,
    "birth_date" VARCHAR   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" VARCHAR   NOT NULL,
    CONSTRAINT "pk_emp" PRIMARY KEY (
        "emp_no"
     )
);
select * from emp
CREATE TABLE "sal" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    "from_date" VARCHAR   NOT NULL,
    "to_date" VARCHAR   NOT NULL,
    CONSTRAINT "pk_sal" PRIMARY KEY (
        "emp_no"
     )
);

DROP TABLE IF EXISTS title;
CREATE TABLE "title" (
    "emp_no" INT   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "from_date" VARCHAR   NOT NULL,
    "to_date" VARCHAR   NOT NULL
     );

-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary
FROM emp
Inner JOIN sal
ON emp.emp_no = sal.emp_no;

ALTER TABLE emp
    ALTER COLUMN hire_date TYPE DATE USING hire_date::date;

-- 2. List employees who were hired in 1986.
SELECT emp_no FROM emp WHERE hire_date BETWEEN to_date('1986-01-01','YYYY-MM-DD') 
                    AND to_date('1986-12-31','YYYY-MM-DD')
-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dept_mng.dept_no, dept.dept_name, dept_mng.emp_no, emp.first_name, emp.last_name, dept_emp.from_date, dept_emp.to_date
	FROM dept_mng
		Inner Join dept
		on dept_mng.dept_no = dept.dept_no
			Inner JOIN emp
			ON dept_mng.emp_no = emp.emp_no
				Inner JOIN dept_emp
				ON emp.emp_no = dept_emp.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_mng.dept_no, dept.dept_name, dept_mng.emp_no, emp.first_name, emp.last_name, dept_emp.from_date, dept_emp.to_date
	FROM dept_mng
		Inner Join dept
		on dept_mng.dept_no = dept.dept_no
			Inner JOIN emp
			ON dept_mng.emp_no = emp.emp_no
				Inner JOIN dept_emp
				ON emp.emp_no = dept_emp.emp_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
Select first_name, last_name 
	From emp
		Where first_name ='Hercules'
		AND last_name LIKE 'B%';
	
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept.dept_name, dept_emp.emp_no, emp.first_name, emp.last_name
	FROM dept_emp
		Inner Join dept
		on dept_emp.dept_no = dept.dept_no
			Inner JOIN emp
			ON dept_emp.emp_no = emp.emp_no
				WHERE dept.dept_name='Sales';
				
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept.dept_name, dept_emp.emp_no, emp.first_name, emp.last_name
	FROM dept_emp
		Inner Join dept
		on dept_emp.dept_no = dept.dept_no
			Inner JOIN emp
			ON dept_emp.emp_no = emp.emp_no
				WHERE dept.dept_name='Sales'
					OR dept.dept_name='Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name) 
  FROM emp 
 	GROUP by last_name
 		ORDER BY COUNT(last_name) DESC;
