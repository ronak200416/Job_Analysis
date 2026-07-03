SELECT job_postings_fact.*,
    company_dim.name AS Company_Name,
    skills_job_dim.skill_id,
    skills_dim.skills
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_location = 'Anywhere'
ORDER BY
    salary_year_avg DESC
LIMIT 10;

/*
Observations
Every listed skill appears only once, so there isn't enough data in this file to identify the most in-demand skill.
There are 2 rows with no skill specified.
The dataset appears to contain only 3 unique job postings, making it a very small sample.

[
  {
    "job_id": 226942,
    "company_id": 319998,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_via": "via Y Combinator",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "search_location": "India",
    "job_posted_date": "2023-02-20 15:13:33",
    "job_no_degree_mention": true,
    "job_health_insurance": false,
    "job_country": "India",
    "salary_rate": "year",
    "salary_year_avg": "650000.0",
    "salary_hour_avg": null,
    "company_name": "Mantys",
    "skill_id": null,
    "skills": null
  },
  {
    "job_id": 547382,
    "company_id": 21,
    "job_title_short": "Data Analyst",
    "job_title": "Director of Analytics",
    "job_location": "Anywhere",
    "job_via": "via LinkedIn",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "search_location": "Texas, United States",
    "job_posted_date": "2023-08-23 12:04:42",
    "job_no_degree_mention": true,
    "job_health_insurance": false,
    "job_country": "United States",
    "salary_rate": "year",
    "salary_year_avg": "336500.0",
    "salary_hour_avg": null,
    "company_name": "Meta",
    "skill_id": null,
    "skills": null
  },
  {
    "job_id": 552322,
    "company_id": 5835,
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_via": "via ZipRecruiter",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "search_location": "Texas, United States",
    "job_posted_date": "2023-06-18 16:03:12",
    "job_no_degree_mention": false,
    "job_health_insurance": true,
    "job_country": "United States",
    "salary_rate": "year",
    "salary_year_avg": "255829.5",
    "salary_hour_avg": null,
    "company_name": "AT&T",
    "skill_id": 0,
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "company_id": 5835,
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_via": "via ZipRecruiter",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "search_location": "Texas, United States",
    "job_posted_date": "2023-06-18 16:03:12",
    "job_no_degree_mention": false,
    "job_health_insurance": true,
    "job_country": "United States",
    "salary_rate": "year",
    "salary_year_avg": "255829.5",
    "salary_hour_avg": null,
    "company_name": "AT&T",
    "skill_id": 1,
    "skills": "python"
  },
  {
    "job_id": 552322,
    "company_id": 5835,
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_via": "via ZipRecruiter",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "search_location": "Texas, United States",
    "job_posted_date": "2023-06-18 16:03:12",
    "job_no_degree_mention": false,
    "job_health_insurance": true,
    "job_country": "United States",
    "salary_rate": "year",
    "salary_year_avg": "255829.5",
    "salary_hour_avg": null,
    "company_name": "AT&T",
    "skill_id": 5,
    "skills": "r"
  },
  {
    "job_id": 552322,
    "company_id": 5835,
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_via": "via ZipRecruiter",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "search_location": "Texas, United States",
    "job_posted_date": "2023-06-18 16:03:12",
    "job_no_degree_mention": false,
    "job_health_insurance": true,
    "job_country": "United States",
    "salary_rate": "year",
    "salary_year_avg": "255829.5",
    "salary_hour_avg": null,
    "company_name": "AT&T",
    "skill_id": 74,
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "company_id": 5835,
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_via": "via ZipRecruiter",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "search_location": "Texas, United States",
    "job_posted_date": "2023-06-18 16:03:12",
    "job_no_degree_mention": false,
    "job_health_insurance": true,
    "job_country": "United States",
    "salary_rate": "year",
    "salary_year_avg": "255829.5",
    "salary_hour_avg": null,
    "company_name": "AT&T",
    "skill_id": 75,
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "company_id": 5835,
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_via": "via ZipRecruiter",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "search_location": "Texas, United States",
    "job_posted_date": "2023-06-18 16:03:12",
    "job_no_degree_mention": false,
    "job_health_insurance": true,
    "job_country": "United States",
    "salary_rate": "year",
    "salary_year_avg": "255829.5",
    "salary_hour_avg": null,
    "company_name": "AT&T",
    "skill_id": 76,
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "company_id": 5835,
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_via": "via ZipRecruiter",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "search_location": "Texas, United States",
    "job_posted_date": "2023-06-18 16:03:12",
    "job_no_degree_mention": false,
    "job_health_insurance": true,
    "job_country": "United States",
    "salary_rate": "year",
    "salary_year_avg": "255829.5",
    "salary_hour_avg": null,
    "company_name": "AT&T",
    "skill_id": 93,
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "company_id": 5835,
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_via": "via ZipRecruiter",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "search_location": "Texas, United States",
    "job_posted_date": "2023-06-18 16:03:12",
    "job_no_degree_mention": false,
    "job_health_insurance": true,
    "job_country": "United States",
    "salary_rate": "year",
    "salary_year_avg": "255829.5",
    "salary_hour_avg": null,
    "company_name": "AT&T",
    "skill_id": 95,
    "skills": "pyspark"
  }
]

*/



SELECT *
FROM skills_dim
LIMIT 100

SELECT *
FROM skills_job_dim
LIMIT 10

