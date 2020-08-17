--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT Employees.emp_no,
		Employees.last_name,
		Employees.first_name,
		Employees.sex,
		Salaries.salary
FROM Employees
INNER JOIN Salaries ON Employees.emp_no = Salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT Employees.first_name,
		Employees.last_name,
		Employees.hire_date
FROM Employees
WHERE hire_date > '1985-12-31' and hire_date < '1987-01-01';
		

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT Department_Manager.dept_no,
		Departments.dept_name,
		Department_Manager.emp_no,
		Employees.first_name,
		Employees.last_name
FROM Employees
INNER JOIN Department_Manager
ON Employees.emp_no = Department_Manager.emp_no
INNER JOIN departments 
ON Department_Manager.dept_no = Departments.dept_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT Employees.emp_no,
		Employees.last_name,
		Employees.first_name,
		Departments.dept_name
FROM Employees
JOIN Department_Employee ON Employees.emp_no = Department_Employee.emp_no
JOIN Departments ON Departments.dept_no = Department_Employee.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT Employees.first_name,
		Employees.last_name,
		Employees.sex
FROM Employees
WHERE Employees.first_name = 'Hercules' AND Employees.last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT Employees.emp_no,
		Employees.last_name,
		Employees.first_name,
		Departments.dept_name
FROM Employees
JOIN Department_Employee
ON Employees.emp_no = Department_Employee.emp_no
JOIN Departments
ON Departments.dept_no = Department_Employee.dept_no
WHERE Departments.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT Employees.emp_no,
		Employees.last_name,
		Employees.first_name,
		Departments.dept_name
FROM Employees
JOIN Department_Employee
ON Employees.emp_no = Department_Employee.emp_no
JOIN Departments
ON Departments.dept_no = Department_Employee.dept_no
WHERE Departments.dept_name = 'Sales' OR Departments.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT (last_name) AS name_count
FROM employees
GROUP BY last_name
ORDER BY name_count DESC;