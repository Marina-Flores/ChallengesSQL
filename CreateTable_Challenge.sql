-- #TASK: Create a table called dept in the dbo schema. Specify the following columns:
	-- dept_id INT 
	-- dept_name VARCHAR(50)

-- Give the IDENTITY property to the dept_id column. Also, put a primary key constraint on the dept_id column. Put a NOT NULL constraint on the dept_name column.

CREATE TABLE dbo.dept
	(
		dept_id INT IDENTITY(1,1),
		dept_name VARCHAR(50) NOT NULL,
		CONSTRAINT PK_dept_dept_id PRIMARY KEY (dept_id)
	);

-- #TASK: Write an insert statement to insert the following row into the dbo.dept table. 
	-- dept_id: 1
	-- dept_name: Business Intelligence

INSERT INTO dbo.dept (dept_name) VALUES ('Business Intelligence');

-- #TASK: Populate the dbo.dept table with more rows: Insert all department names from the hcm.departments table

INSERT INTO dbo.dept (dept_name)
	SELECT department_name FROM hcm.departments;

-- #TASK: Create a table called emp in the dbo schema. Specify the following columns:
	-- empt_id INT 
	-- first_name VARCHAR(50)
	-- last_name VARCHAR(50)
	-- hide_date DATE
	-- dept_id INT 

-- Give the IDENTITY property to the emp_id column. Also, put a primary key constraint on the emp_id column. Put NOT NULL constraints on any columns you think need them.
-- Put a foreign key constraint on the dept_id column which references back to the dept_id column from the dbo.dept table.

CREATE TABLE dbo.emp 
	(
		emp_id INT IDENTITY,
		first_name VARCHAR(50) NOT NULL, 
		last_name VARCHAR(50) NOT NULL,
		hire_date DATE NOT NULL, 
		dept_id INT,
		CONSTRAINT PK_emp_emp_id PRIMARY KEY (emp_id),
		CONSTRAINT FK_emp_dept_id FOREIGN KEY (dept_id) REFERENCES dbo.dept (dept_id)
	);

-- #TASK: Populate the dbo.emp table with the following two employees:

INSERT INTO dbo.emp (first_name, last_name, hire_date, dept_id)
	VALUES ('Scott', 'Davis', '20201211', 1);

INSERT INTO dbo.emp (first_name, last_name, hire_date, dept_id)
	VALUES ('Miriam', 'Yardley', '20201205', 1);

