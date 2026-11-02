--TOP PAYING SKILLS 

SELECT 
    sd.skills,
    ROUND(AVG(jpf.salary_year_avg),2 ) as avg_salary
FROM job_postings_fact as jpf  
INNER JOIN skills_job_dim as sjd ON sjd.job_id=jpf.job_id 
INNER JOIN skills_dim as sd ON sd.skill_id = sjd.skill_id
WHERE jpf.job_title_short = 'Machine Learning Engineer'
AND jpf.salary_year_avg is not null 
AND jpf.job_work_from_home= true
GROUP BY sd.skills 
ORDER BY avg_salary DESC
limit 30    
  
 /*
Ansible and Chef lead at an average salary of 325,000
, with infrastructure tools prominent among the higher-paying skills.
Excel ranks surprisingly high at 283,333.
 A few highly paid jobs could inflate its average.
SQL and Python are close, averaging 152,983 and 150,570,
 respectively.
Identical averages for some skills may reflect
 overlapping job postings or small samples.
High salary doesn’t necessarily mean high demand.
 Include job counts and median salaries to make
 /*