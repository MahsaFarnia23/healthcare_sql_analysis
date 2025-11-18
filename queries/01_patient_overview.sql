--number of patients by city
SELECT DISTINCT city, COUNT(city) AS total_patient FROM patients
GROUP BY city 
ORDER BY city DESC


--avarage of patient's age per insurance provider
SELECT DISTINCT insurance_provider, AVG(age) AS avg_age FROM patients
GROUP BY insurance_provider


--patient's name with more than 3 appointments in two last years
SELECT 
    p.patient_id,
    p.name,
    COUNT(a.appointment_id) AS appointment_count
FROM patients AS p
JOIN appointments AS a
    ON p.patient_id = a.patient_id
WHERE a.appointment_date >= date('now', '-2 year')
GROUP BY p.patient_id, p.name
HAVING COUNT(a.appointment_id) > 3
ORDER BY appointment_count DESC;

