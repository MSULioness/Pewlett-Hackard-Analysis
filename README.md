# Pewlett-Hackard-Analysis
##OVERVIEW
The purpose of this analysis is to provide the managers a clear understanding of the 
1. Current employees who have reached retirement age
2. Current employees who are eligible for retirement by job title
3. Current employees who are eligible to participate in a mentorship, based on age and company tenure

##RESULTS
Based on our analysis we know the following:
1. At 25,916, Senior Engineer has the largest retirement attrition followed very closely at 24,926 Senior Staff 
2. 1,549 employees are eligible to be mentors
3. More emphasis should be placed on training up and developing Engineers to move to Senior or Staff positions
4.Further analysis is needed to understand what's the business need for Senior Engineer & Senior Staff positions, can we identify a ceiling for those roles and maintain the current and future workload. 


##SUMMARY
In conclusion, 72,458 roles will need to be filled as the "silver tsunami" impacts. I found that by querying the unique_titles tables, see below:
--TOTAL NUMBER OF TITLES
SELECT COUNT (title)
FROM unique_titles

There are 1,549 employees are eligible to be mentors.  I found that by querying the mentorship eligibility table; see below

--TOTAL ELIGIBLE MENTORS
SELECT COUNT (emp_no)
FROM mentorship_eligibility
