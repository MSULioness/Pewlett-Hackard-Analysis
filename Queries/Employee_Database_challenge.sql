SQL
--JOIN EMPLOYEES AND TITLES TABLES
SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no;

--JOIN EMPLOYEES AND TITLES TABLES 
--CREATE NEW TABLE
SELECT e.emp_no, 
	e.birth_date,
	e.first_name, 
	e.last_name,
	e.gender,
	e.hire_date,
	t.title,
	t.from_date,
	t.to_date
INTO employees_titles
FROM employees as e
RIGHT JOIN titles as t
ON e.emp_no = t.emp_no;

--FILTER EMPLOYEES BETWEEN 1952 AND 1955
--ORDER BY EMPLOYEE NUMBER
--CREATE RETIREMENT TITLES TABLES
SELECT et.emp_no, 
	et.birth_date,
	et.first_name, 
	et.last_name,
	et.gender,
	et.hire_date,
	et.title,
	et.from_date,
	et.to_date
INTO retirement_titles
FROM employees_titles as et
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY et.emp_no;

--CREATE TEMP TABLE TO CREATE UNIQUE TITLES TABLE
SELECT r.emp_no, 
	r.first_name, 
	r.last_name,
	e.title,
	e.hire_date,
	e.to_date,
	e.birth_date
INTO temp_titles
FROM retirement_titles as r
INNER JOIN employees_titles as e
ON r.emp_no = e.emp_no;


--CREATE UNIQUE TABLE 
SELECT DISTINCT ON (emp_no)
	emp_no,
	first_name, 
	last_name,
	title
INTO unique_titles
FROM temp_titles
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (to_date = '9999-01-01')
ORDER BY emp_no, hire_date DESC;

--CREATE RETIRING TITLES TABLE
SELECT COUNT (u.emp_no), r.title
INTO retiring_titles
FROM unique_titles as u
INNER JOIN retirement_titles as r
ON u.emp_no = r.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (to_date = '9999-01-01')
GROUP BY r.title
ORDER BY COUNT(u.emp_no) DESC;


--CREATE MENTORSHIP ELIGIBILITY TABLE
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility 
FROM employees as e
INNER JOIN dept_emp as de
	ON e.emp_no = de.emp_no
INNER JOIN titles as t
	ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no


--QUERY TO VIEW TABLE CONTENT
SELECT * FROM mentorship_eligibility

--QUERY TO DELETE ENTIRE TABLE
DROP TABLE retiring_titles

--TOTAL ELIGIBLE MENTORS
SELECT COUNT (emp_no)
FROM mentorship_eligibility

--TOTAL NUMBER OF TITLES
SELECT COUNT (title)
FROM unique_titles