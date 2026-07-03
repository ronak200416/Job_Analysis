/* ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
Database Load Issues (follow if receiving permission denied when running SQL code below)

NOTE: If you are having issues with permissions. And you get error: 

'could not open file "[your file path]\job_postings_fact.csv" for reading: Permission denied.'

1. Open pgAdmin
2. In Object Explorer (left-hand pane), navigate to `sql_course` database
3. Right-click `sql_course` and select `PSQL Tool`
    - This opens a terminal window to write the following code
4. Get the absolute file path of your csv files
    1. Find path by right-clicking a CSV file in VS Code and selecting “Copy Path”
5. Paste the following into `PSQL Tool`, (with the CORRECT file path)

\copy company_dim FROM '[Insert File Path]/company_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_dim FROM '[Insert File Path]/skills_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy job_postings_fact FROM '[Insert File Path]/job_postings_fact.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_job_dim FROM '[Insert File Path]/skills_job_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

*/

-- NOTE: This has been updated from the video to fix issues with encoding

COPY company_dim
FROM 'C:\temp\company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM 'C:\temp\skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM 'C:\temp\job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM 'C:\temp\skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');




SELECT *
FROM job_postings_fact
limit 100;



SELECT job_posted_date,
    job_id,
    job_title
FROM job_postings_fact
LIMIT 10;


select job_posted_date,
    job_id,
    job_title
FROM job_postings_fact
WHERE job_id = 66;



UPDATE job_postings_fact
SET job_title = 'ff player'
WHERE job_id = 66;




SELECT job_posted_date,
    job_id,
    job_title
FROM job_postings_fact
ORDER BY job_id
LIMIT 10;


SELECT '2023-09-25':: DATE;




SELECT
    job_title AS title,
    job_location AS location,
    job_posted_date:: DATE AS date,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'IST'
FROM job_postings_fact
LIMIT 5;

SELECT
    EXTRACT(MONTH FROM job_posted_date) AS months,
    COUNT(job_id) AS unique_count
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst' 
    OR job_title_short ILIKE '%Analyst%'
GROUP BY
    months
ORDER BY
    months;


SELECT *
FROM job_postings_fact;

CREATE TABLE jan_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1 
    And EXTRACT(YEAR FROM job_posted_date) = 2023;

 
UPDATE TABLE jan_jobs

DROP TABLE jan_jobs;

SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1 
    And EXTRACT(YEAR FROM job_posted_date) = 2023
limit 10;

SELECT *
FROM jan_jobs;

drop table jan_jobs;

CREATE TABLE feb_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2
    And EXTRACT(YEAR FROM job_posted_date) = 2023;



SELECT *
FROM feb_jobs
ORDER BY EXTRACT(DAY FROM job_posted_date);

--1-50 of 92266
--1-50 of 107202



select
    job_title_short,
    company_id,
    job_location
FROM jan_jobs

UNION ALL

select
    job_title_short,
    company_id,
    job_location
FROM feb_jobs;





CREATE TABLE march_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3
    And EXTRACT(YEAR FROM job_posted_date) = 2023;


SELECT *
FROM march_jobs
WHERE job_title_short = 'Data Analyst'   

ORDER BY EXTRACT(DAY FROM job_posted_date);

SELECT COUNT(job_id) AS applicable,
    CASE
        WHEN job_country = 'India' THEN 'BHARAT'
        WHEN job_country = 'Japan' THEN 'NIHON'
        ELSE 'NAH NAH'
    END AS label
FROM job_postings_fact
GROUP BY label
ORDER BY applicable;


SELECT *
FROM company_dim


SELECT name 
FROM company_dim
WHERE company_id in (
    SELECT company_id
    FROM job_postings_fact
    WHERE job_no_degree_mention = true
);


WITH jan_jobs AS (
    SELECT*
    FROM job_postings_fact
    where EXTRACT(MONTH FROM job_posted_date) = 1
) 
select *
FROM jan_jobs;

select *
from company_dim;

SELECT *
FROM skills_dim
WHERE
    skill_id = 0 OR  
    skill_id = 1 OR  
    skill_id = 76 OR
    skill_id = 74 OR 
    skill_id = 5 ;

SELECT *
FROM skills_job_dim
LIMIT 10;

SELECT 
FROM skills_job_dim;



SELECT 


SELECT 
    job_id,
    job_location
FROM job_postings_fact
WHERE
    job_location = 'Anywhere'





SELECT 
    
    skill_id,
    COUNT(skill_id)
FROM skills_job_dim

GROUP BY
    skill_id
ORDER BY
    count DESC
LIMIT 5;

SELECT*
FROM skills_job_dim
limit 5

select *
from job_postings_fact;


-- 0, 1, 76, 74, 5

WITH remote_job_skills AS(
SELECT 
    skill_id,
    COUNT(*) as skills_count
FROM skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact AS job_postings ON job_postings.job_id = skills_to_job.job_id
WHERE job_postings.job_work_from_home = TRUE
group by
    skill_id

)



select 
    skills.skill_id,
    skills AS skill_name,
    skills_count
from remote_job_skills
INNER JOIN skills_dim AS skills on skills.skill_id = remote_job_skills.skill_id
order by skills_count desc
limit 5;




select *
from (

select *
from jan_jobs

UNION ALL

SELECT *
FROM feb_jobs

UNION ALL

SELECT *
FROM march_jobs
)
where salary_year_avg > 70000;