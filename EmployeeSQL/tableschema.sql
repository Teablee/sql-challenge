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

