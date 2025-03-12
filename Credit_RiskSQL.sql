use credit_risk;
select * from loan_data;

SELECT loan_status, COUNT(*) 
FROM loan_data 
GROUP BY loan_status;

SELECT * FROM loan_data WHERE credit_score <550 ORDER BY credit_score ASC;

SELECT AVG(loan_amount), employment_status FROM loan_data GROUP BY employment_status;

SELECT customer_id, age, income, loan_amount, credit_score
FROM loan_data
ORDER BY loan_amount DESC
LIMIT 5;

SELECT employment_status, 
       ROUND(AVG(interest_rate), 2) AS avg_interest_rate, 
       ROUND(AVG(loan_duration), 2) AS avg_loan_duration
FROM loan_data
GROUP BY employment_status;

SELECT customer_id, age, income, debt_to_income_ratio, credit_score
FROM loan_data
WHERE debt_to_income_ratio > 50 AND credit_score < 600;

SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 30 THEN '18-30'
        WHEN age BETWEEN 31 AND 45 THEN '31-45'
        WHEN age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+' 
    END AS age_group,
    COUNT(*) AS num_defaults
FROM loan_data
WHERE loan_status = 1
GROUP BY age_group;

SELECT employment_status,
       COUNT(CASE WHEN loan_status = 1 THEN 1 END) * 100.0 / COUNT(*) AS default_rate
FROM loan_data
GROUP BY employment_status;

SELECT customer_id, age, num_late_payments, credit_score
FROM loan_data
ORDER BY num_late_payments DESC
LIMIT 3;

SELECT 
    SUM(CASE WHEN loan_status = 0 THEN loan_amount ELSE 0 END) AS total_approved,
    SUM(CASE WHEN loan_status = 1 THEN loan_amount ELSE 0 END) AS total_defaulted
FROM loan_data;

SELECT credit_score, 
       ROUND(AVG(interest_rate), 2) AS avg_interest_rate
FROM loan_data
GROUP BY credit_score
ORDER BY credit_score;

SELECT loan_status, 
       ROUND(AVG(num_late_payments), 2) AS avg_late_payments
FROM loan_data
GROUP BY loan_status;

SELECT customer_id, income, loan_amount, credit_score
FROM loan_data
WHERE loan_amount > 40000 AND credit_score < 600;










