CREATE TABLE Departments (
    dept_no VARCHAR(30)   NOT NULL,
    dept_name VARCHAR(30)   NOT NULL,
	CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
	)
);

CREATE TABLE Department_emp (
    emp_no INTEGER   NOT NULL,
    dept_no VARCHAR(30)   NOT NULL,
	CONSTRAINT pk_Department_emp PRIMARY KEY (
        emp_no, dept_no
     )
);

CREATE TABLE Department_mng (
    dept_no VARCHAR(30)   NOT NULL,
    emp_no INTEGER   NOT NULL,
	CONSTRAINT pk_Department_mng PRIMARY KEY (
        dept_no,emp_no
     )
);


CREATE TABLE Employees (
    emp_no INTEGER   NOT NULL,
    emp_title_id VARCHAR(30)   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    sex VARCHAR(30)   NOT NULL,
    hire_date DATE   NOT NULL,
	CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Salaries (
    emp_no INTEGER   NOT NULL,
    salary INTEGER   NOT NULL,
	CONSTRAINT pk_Salaries PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Titles (
    title_id VARCHAR(30)   NOT NULL,
    title VARCHAR(30)   NOT NULL,
	CONSTRAINT pk_Titles PRIMARY KEY (
        title_id
     )
);

ALTER TABLE Department_emp ADD CONSTRAINT fk_Department_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Department_emp ADD CONSTRAINT fk_Department_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Department_mng ADD CONSTRAINT fk_Department_mng_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES Titles (title_id);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);


-- Once you have a complete database, do the following:


-- 1) List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s
	ON e.emp_no = s.emp_no;

-- 2) List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986

-- 3) List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees AS e
INNER JOIN department_mng AS dm
	ON e.emp_no = dm.emp_no
INNER JOIN departments AS d
	ON d.dept_no = dm.dept_no;

-- 4) List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN department_emp AS de
	ON e.emp_no = de.emp_no
INNER JOIN departments AS d
	ON d.dept_no = de.dept_no;

-- 5) List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6) List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN department_emp AS de
	ON e.emp_no = de.emp_no
INNER JOIN departments AS d
	ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';

-- 7) List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN department_emp AS de
	ON e.emp_no = de.emp_no
INNER JOIN departments AS d
	ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

-- 8) In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT 
	last_name,
	COUNT(last_name) AS "Frequency Count"
FROM employees 
GROUP BY last_name
ORDER BY "Frequency Count" DESC;

