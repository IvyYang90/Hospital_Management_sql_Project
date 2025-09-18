/*
Question: Which doctor specialization generates the highest revenue?
- Join billing, treatments, appointments, and doctors tables using inner joins.
- Calculate total revenue per doctor specialization. 
Why?
- To help the hospital make strategic hiring decisions.
By focusing on doctors with high-revenue specializations, the hospital can increase its profitability and allocate resources more effectively.
*/



SELECT 
    specialization,
    SUM(cost) AS revenue_per_specialization
FROM 
    billing
INNER JOIN treatments
    ON billing.treatment_id = treatments.treatment_id
INNER JOIN appointments
    ON treatments.appointment_id = appointments.appointment_id
INNER JOIN doctors
    ON appointments.doctor_id = doctors.doctor_id
WHERE 
    cost IS NOT NULL
GROUP BY 
    specialization
ORDER BY revenue_per_specialization DESC;


/*
Here's the breakdown of the revenue of each doctor's specialization:
- Pediatrics specialists generate the highest revenue ($258,937.83), which is more than **3 times** the revenue from Oncology specialists ($89,602.73).  
- Dermatology follows as the second-highest contributor with $202,709.29. 
This demostrates that hospital can hire more doctors who specializes in Pediatrics.

This analysis suggests that the hospital could benefit from hiring or allocating more resources toward Pediatrics specialists, as they contribute the most to overall revenue.  

RESULTS
=======
[
  {
    "specialization": "Pediatrics",
    "revenue_per_specialization": "258937.83"
  },
  {
    "specialization": "Dermatology",
    "revenue_per_specialization": "202709.29"
  },
  {
    "specialization": "Oncology",
    "revenue_per_specialization": "89602.73"
  }
]
*/