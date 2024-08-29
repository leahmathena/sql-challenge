DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
    dept_no CHAR(30) PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);


DROP TABLE IF EXISTS titles;
CREATE TABLE titles (
    title_id CHAR(30) PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);


DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id CHAR(30),
    birth_date DATE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    sex CHAR(1),
    hire_date DATE,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries (
    emp_no INT,
    salary DECIMAL(10, 2),
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager (
    dept_no CHAR(30),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no CHAR(30),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);