-- top skills 
WITH top_skills as 
(
SELECT
    sd.skill_id,
    sd.skills,
    count(jpf.job_id) as demand_count
FROM job_postings_fact as jpf  
INNER JOIN skills_job_dim as sjd ON sjd.job_id=jpf.job_id 
INNER JOIN skills_dim as sd ON sd.skill_id = sjd.skill_id
WHERE jpf.job_title_short = 'Machine Learning Engineer'
AND jpf.job_work_from_home= true
AND jpf.salary_year_avg is not null
GROUP BY sd.skill_id 


),   
avg_sal as 
(
SELECT 
    sd.skill_id,
    sd.skills,
    ROUND(AVG(jpf.salary_year_avg),2 ) as avg_salary
FROM job_postings_fact as jpf  
INNER JOIN skills_job_dim as sjd ON sjd.job_id=jpf.job_id 
INNER JOIN skills_dim as sd ON sd.skill_id = sjd.skill_id
WHERE jpf.job_title_short = 'Machine Learning Engineer'
AND jpf.salary_year_avg is not null 
AND jpf.job_work_from_home= true
GROUP BY sd.skill_id

)
SELECT
        top_skills.skill_id,
        top_skills.skills,
        demand_count,
        avg_salary
FROM    
    top_skills
inner join avg_sal on avg_sal.skill_id = top_skills.skill_id
ORDER BY demand_count DESC 
LIMIT 20 