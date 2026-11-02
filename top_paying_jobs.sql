--WELCOME
--TO GET THE TOP 10 PAYING JOBS AS DATA ANALYST 
select 
        job_id,
        job_title,
        job_location,
        job_schedule_type,
        salary_year_avg,
        job_posted_date,
        cd.name as company_name
FROM job_postings_fact as jpf
left join company_dim as cd
ON cd.company_id = jpf.company_id
WHERE job_title_short = 'Data Analyst'
and job_location = 'Anywhere'
and salary_year_avg is not null
order by salary_year_avg DESC  
limit 10 