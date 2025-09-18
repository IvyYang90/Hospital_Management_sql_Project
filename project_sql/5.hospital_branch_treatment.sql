/*
Question: Which hospital branch will receive the patients over 60 of the most frequent treatment type?
- Join treatments to inner join tables (appointments and doctors data)
- Focus on the X-Ray treatment, which was identified as the most frequent treatment for elderly patients in the previous analysis.
- Identify the hospital branch that receives the most X-Ray patients.
- Why?
To measure which branch will receive the most patients who need X-Ray, heps the hospital plan resource allocation, 
staff scheduling, and equipment usage
*/


SELECT 
    hospital_branch,
    COUNT(hospital_branch) AS count_hospital_branch
FROM 
    treatments

INNER JOIN 
    appointments ON treatments.appointment_id = appointments.appointment_id
INNER JOIN 
    doctors ON appointments.doctor_id = doctors.doctor_id
WHERE 
    treatment_type = 'X-Ray'
GROUP BY
    hospital_branch
ORDER BY
    count_hospital_branch DESC


/*
Here's the breakdown of the hospital branch that receive the most common treatment type:
- Central Hospital receives the highest number of common treatments for patients over 60, particularly X-Rays (21 cases).  
- This suggests that Central Hospital is better equipped to provide specialized diagnostic care compared to the two clinics.  

RESULTS
=======
[
  {
    "hospital_branch": "Central Hospital",
    "count_hospital_branch": "21"
  },
  {
    "hospital_branch": "Westside Clinic",
    "count_hospital_branch": "10"
  },
  {
    "hospital_branch": "Eastside Clinic",
    "count_hospital_branch": "10"
  }
]
*/
