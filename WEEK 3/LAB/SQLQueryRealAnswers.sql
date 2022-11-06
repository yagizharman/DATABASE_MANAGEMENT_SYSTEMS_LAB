SELECT * FROM employees,jobs where job_title='Executive Assistant' and jobs.job_id=employees.job_id;

SELECT first_name,last_name,salary from employees,departments where employees.department_id=departments.department_id and department_name='Department_B';

SELECT first_name,last_name,salary from employees e,departments d,jobs j where e.department_id=d.department_id and e.job_id=j.job_id and department_name='Department_B' and job_title='Executive Assistant';

SELECT first_name,last_name,salary from employees e, departments d where e.department_id=d.department_id and department_name='Department_B' ORDER BY salary DESC ;