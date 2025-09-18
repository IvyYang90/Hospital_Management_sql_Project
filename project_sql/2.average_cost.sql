/*
Question: What is the average cost for each treatment type (e.g., MRI, Chemotherapy)?
- Calculate the average cost from the treatments table by grouping by treatment_type 
-  Why? 
- Patients get transparent estimates before receiving treatment.
- Hospital management identify high-cost procedures and optimize pricing
*/




SELECT 
    treatment_type,
    round(AVG(cost), 2) AS cost_per_treatment_type
FROM treatments
GROUP BY treatment_type
ORDER BY cost_per_treatment_type DESC;

/*
Here's the breakdown of the average cost of each treatment type in 2023:
MRI is the most expensive treatment, averaging $3,224.95 per procedure.

ECG is the least costly, averaging $2,532.22 per procedure.

Other treatments, including Physiotherapy ($2,761.61), X-Ray ($2,698.87), 
and Chemotherapy ($2,629.71), fall in between these two extremes.

This comparison highlights the wide variation in treatment costs, 
which can help hospital management evaluate pricing strategies and inform patients about potential expenses.

RESULTS
=======

[
  {
    "treatment_type": "MRI",
    "cost_per_treatment_type": "3224.95"
  },
  {
    "treatment_type": "Physiotherapy",
    "cost_per_treatment_type": "2761.61"
  },
  {
    "treatment_type": "X-Ray",
    "cost_per_treatment_type": "2698.87"
  },
  {
    "treatment_type": "Chemotherapy",
    "cost_per_treatment_type": "2629.71"
  },
  {
    "treatment_type": "ECG",
    "cost_per_treatment_type": "2532.22"
  }
]
*/