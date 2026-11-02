-- TOP DEMANDED SKILLS !
SELECT 
    sd.skills,
    count(jpf.job_id) as demand_count
FROM job_postings_fact as jpf  
INNER JOIN skills_job_dim as sjd ON sjd.job_id=jpf.job_id 
INNER JOIN skills_dim as sd ON sd.skill_id = sjd.skill_id
WHERE jpf.job_title_short = 'Machine Learning Engineer'
AND jpf.job_work_from_home= true
GROUP BY sd.skills 
ORDER BY demand_count DESC
limit 5 
