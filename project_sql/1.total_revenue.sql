/*
Question: What is the total hospital revenue in 2023, and how does it break down by quarter?
- Aggregate billing data to calculate revenue per quarter.
- Focus only on payments with status 'Paid'.
- Why? To measure total yearly revenue and understand seasonal performance trends, 
       which helps hospital management with financial planning and resource allocation.
*/

SELECT 
    SUM(amount) AS total_revenue
FROM 
    billing
WHERE 
    payment_status = 'Paid';

/*
[
  {
    "total_revenue": "173424.90"
  }
]
*/



SELECT 
    EXTRACT(QUARTER FROM bill_date) AS quarter,
    SUM(CASE WHEN payment_status = 'Paid' THEN amount ELSE 0 END) AS paid_revenue
FROM 
    billing
GROUP BY 
    EXTRACT(QUARTER FROM bill_date)
ORDER BY 
    quarter;


/*

Here's the breakdown of the hospital revenue in 2023:
- Quarter 2 (April- June) generated the highest revenue: $53,745.82
This accounts for about one-third of the total yearly revenue ($173,424.90).

- Quarter 3 (July–September) generated the lowest revenue: $35,680.13  
This is about 16% lower than Quarter 1 ($42,708.94). 

These results highlight strong seasonal variation, with peak revenue in Quarter 2 and 
a noticeable decline in Quarter 3.

RESULTS
=======
[
  {
    "quarter": "1",
    "paid_revenue": "42708.94"
  },
  {
    "quarter": "2",
    "paid_revenue": "53745.82"
  },
  {
    "quarter": "3",
    "paid_revenue": "35680.13"
  },
  {
    "quarter": "4",
    "paid_revenue": "41290.01"
  }
]
*/