-- ## Instructions
-- #### Data Modeling
-- Inspect the CSVs and sketch out an ERD of the tables. Feel free to use a tool like [http://www.quickdatabasediagrams.com](http://www.quickdatabasediagrams.com).
-- #### Data Engineering
-- * Use the information you have to create a table schema for each of the six CSV files. Remember to specify data types, primary keys, foreign keys, and other constraints.
-- * Import each CSV file into the corresponding SQL table.
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS titles CASCADE;

CREATE TABLE departments(
dept_no varchar NOT NULL PRIMARY KEY,
dept_name varchar NOT NULL);
-- select* from departments;

CREATE TABLE employees(
emp_no varchar NOT NULL PRIMARY KEY,
birth_date date NOT NULL,
first_name varchar NOT NULL,
last_name varchar NOT NULL,
gender varchar NOT NULL,
hire_date date NOT NULL);
-- select* from employees;

CREATE TABLE dept_emp(
emp_no	varchar NOT NULL REFERENCES employees("emp_no"),
dept_no	varchar NOT NULL REFERENCES departments("dept_no"),
from_date date NOT NULL,
to_date date NOT NULL);
-- select* from dept_emp;

CREATE TABLE dept_manager(
dept_no	varchar NOT NULL REFERENCES departments("dept_no"),
emp_no varchar NOT NULL REFERENCES employees("emp_no"),
from_date date NOT NULL,
to_date date NOT NULL);
-- select* from dept_manager;

CREATE TABLE salaries(
emp_no varchar NOT NULL REFERENCES employees("emp_no"),
salary integer NOT NULL,
from_date date NOT NULL,
to_date  date NOT NULL);
-- select* from salaries;

CREATE TABLE titles(
emp_no varchar NOT NULL REFERENCES employees("emp_no"),
title varchar NOT NULL,
from_date date NOT NULL,
to_date date NOT NULL);
-- select* from titles;


-- ALTER TABLE titles 
-- ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY ("emp_no") REFERENCES "dept_emp" ("emp_no");

-- ALTER TABLE salaries 
-- ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY ("emp_no") REFERENCES "dept_emp" ("emp_no");

-- ALTER TABLE employees
-- ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY ("emp_no") REFERENCES "dept_emp" ("emp_no");

-- ALTER TABLE dept_manager 
-- ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no");

-- ALTER TABLE dept_manager 
-- ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY ("emp_no") REFERENCES "dept_emp" ("emp_no");

-- ALTER TABLE dept_emp 
-- ADD CONSTRAINT "fk_dep_emp_dept_no" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no");
