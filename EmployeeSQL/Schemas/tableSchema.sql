-- Drop existing tables if they exist to avoid conflicts
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;

-- Create the departments table
CREATE TABLE departments (
    dept_no CHAR(30) PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- Create the titles table
CREATE TABLE titles (
    title_id CHAR(30) PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);

-- Create the employees table
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

-- Create the salaries table
CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary DECIMAL(10, 2),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create the dept_manager table with a composite primary key
CREATE TABLE dept_manager (
    dept_no CHAR(30),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create the dept_emp table with a composite primary key
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no CHAR(30),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);