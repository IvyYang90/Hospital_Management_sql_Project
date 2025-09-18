/* Question: For patients over 60, which treatment type is most frequent and for all age range?
To measure the most common treatment counts.  
This analysis can provide a guide for patients on what treatments are most often needed 
and help doctors anticipate and allocate resources more effectively.
*/


SELECT 
    treatment_type,
    COUNT(treatment_type) AS frequent_treatment
FROM 
    treatments
GROUP BY
    treatment_type
ORDER BY 
    frequent_treatment DESC

/*
Here's the breakdown of the most frequent treatment types:
- Chemotherapy is the most common treatment, with 49 patients receiving it.
- Physiotherapy and MRI are the least common, each with 36 patients.

This indicates that Chemotherapy plays the most significant role in hospital operations, 
while Physiotherapy and MRI are comparatively less frequent.

RESULTS
=======
[
  {
    "treatment_type": "Chemotherapy",
    "frequent_treatment": "49"
  },
  {
    "treatment_type": "X-Ray",
    "frequent_treatment": "41"
  },
  {
    "treatment_type": "ECG",
    "frequent_treatment": "38"
  },
  {
    "treatment_type": "MRI",
    "frequent_treatment": "36"
  },
  {
    "treatment_type": "Physiotherapy",
    "frequent_treatment": "36"
  }
]
*/





WITH elderly_patients AS (
SELECT 
    patient_id,
    date_of_birth 
FROM 
    patients
WHERE 
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, date_of_birth)) >= 60
)

SELECT 
    treatment_type,
    COUNT(treatment_type) AS elderly_frequent_treatment
FROM 
    treatments
INNER JOIN
    appointments ON treatments.appointment_id = appointments.appointment_id 
INNER JOIN
    elderly_patients ON appointments.patient_id = elderly_patients.patient_id
GROUP BY
    treatment_type
ORDER BY 
    elderly_frequent_treatment DESC


/*
Here's the breakdown of the most common treatment types for patients over 60:
- X-Ray is the most common treatment, with 8 elderly patients receiving it.
- MRI is the least common, with only 3 elderly patients.

This suggests that elderly patients rely on X-Ray significantly more often than MRI, 
and that diagnostic treatments like X-Ray and ECG play a critical role in elderly care.

RESULTS
=======
[
  {
    "treatment_type": "X-Ray",
    "elderly_frequent_treatment": "8"
  },
  {
    "treatment_type": "ECG",
    "elderly_frequent_treatment": "7"
  },
  {
    "treatment_type": "Physiotherapy",
    "elderly_frequent_treatment": "7"
  },
  {
    "treatment_type": "Chemotherapy",
    "elderly_frequent_treatment": "7"
  },
  {
    "treatment_type": "MRI",
    "elderly_frequent_treatment": "3"
  }
]
*/




