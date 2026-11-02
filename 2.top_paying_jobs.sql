
WITH top_paying_jobs as 
(
select 
        job_id,
        job_title,
        salary_year_avg,
        cd.name as company_name
FROM job_postings_fact as jpf
left join company_dim as cd
ON cd.company_id = jpf.company_id
WHERE job_title_short = 'Machine Learning Engineer'
and job_location = 'Anywhere'
and salary_year_avg is not null
order by salary_year_avg DESC  
limit 10 
)

SELECT 
    tp.*,
    sd.skills
FROM top_paying_jobs as tp  
INNER JOIN skills_job_dim as sjd ON sjd.job_id=tp.job_id 
INNER JOIN skills_dim as sd ON sd.skill_id = sjd.skill_id 
ORDER BY tp.salary_year_avg DESC


