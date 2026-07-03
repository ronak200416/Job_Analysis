/*
top paying data analyst jobs
- Top 10 highest paying jobs for data analyst roles available remotely
- Remove null as salaries
*/

SELECT *
FROM job_postings_fact
LIMIT 10;


SELECT *,
    name AS Company_Name
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_location = 'Anywhere'
ORDER BY
    salary_year_avg DESC
LIMIT 10;


