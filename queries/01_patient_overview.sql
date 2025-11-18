--number of patients by city
select distinct city, count(city) as total_patient from patients
group by city 
order by city DESC


--avarage of patient's age per insurance provider
select distinct insurance_provider, avg(age) as avg_age from patients
group by insurance_provider


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


