
/* 
    Exercise link: https://www.hackerrank.com/challenges/the-company/problem?isFullScreen=true
    
    Given the table schemas below, write a query to print the company_code, founder name, total number 
    of lead managers, total number of senior managers, total number of managers, and total number of 
    employees. Order your output by ascending company_code.

    Note:

    - The tables may contain duplicate records.
    - The company_code is string, so the sorting should not be numeric. For example, if the company_codes 
      are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.
*/

/* 
    Solution 1 
*/

SELECT c.company_code AS company_code, 
    c.founder AS founder_name,
    COUNT(DISTINCT(lm.lead_manager_code)) AS total_lead_managers,
    COUNT(DISTINCT(sm.senior_manager_code)) AS total_senior_managers,
    COUNT(DISTINCT(m.manager_code)) AS total_managers,
    COUNT(DISTINCT(e.employee_code)) AS total_employees
FROM Company AS c
INNER JOIN Lead_manager AS lm ON c.company_code = lm.company_code
INNER JOIN Senior_manager AS sm ON lm.lead_manager_code = sm.lead_manager_code
INNER JOIN Manager AS m ON sm.senior_manager_code = m.senior_manager_code
INNER JOIN Employee AS e ON m.manager_code = e.manager_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code ASC;

/* 
    Solution 2 (Less Joins)
*/

SELECT c.company_code AS company_code, 
    c.founder AS founder_name,
    COUNT(DISTINCT(e.lead_manager_code)) AS total_lead_managers,
    COUNT(DISTINCT(e.senior_manager_code)) AS total_senior_managers,
    COUNT(DISTINCT(e.manager_code)) AS total_managers,
    COUNT(DISTINCT(e.employee_code)) AS total_employees
FROM Employee AS e
INNER JOIN Company AS c ON e.company_code = c.company_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code ASC;
