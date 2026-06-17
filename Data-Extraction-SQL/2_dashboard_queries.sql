USE HealthcareDB;
SELECT 
    p.patient_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    CONCAT('Dr. ', d.last_name) AS attending_doctor,
    d.specialization,
    a.appointment_date,
    a.status AS appointment_status,
    b.billing_amount,
    b.payment_status
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN billing b ON a.appointment_id = b.appointment_id
LIMIT 10;

SELECT 
    p.insurance_provider,                   
    COUNT(b.patient_id) AS total_patients,  
    SUM(CASE WHEN b.payment_status = 'Paid' THEN b.billing_amount ELSE 0 END) AS revenue_collected,
    SUM(CASE WHEN b.payment_status = 'Pending' THEN b.billing_amount ELSE 0 END) AS pending_amount,
    SUM(CASE WHEN b.payment_status = 'Failed' THEN b.billing_amount ELSE 0 END) AS failed_collections
FROM billing b
JOIN patients p ON b.patient_id = p.patient_id
GROUP BY p.insurance_provider
ORDER BY revenue_collected DESC;

SELECT 
    d.specialization,
    COUNT(a.appointment_id) AS total_appointments,
    ROUND(SUM(CASE WHEN a.status = 'Completed' THEN 1 ELSE 0 END) / COUNT(a.appointment_id) * 100, 2) AS completion_rate_percentage,
    ROUND(SUM(CASE WHEN a.status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(a.appointment_id) * 100, 2) AS cancellation_rate_percentage
FROM appointments a
JOIN doctors d ON a.doctor_id = d.doctor_id
GROUP BY d.specialization
ORDER BY total_appointments DESC;

SELECT 
    CASE 
        WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) < 18 THEN 'Under 18'
        WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 18 AND 35 THEN '18-35'
        WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 36 AND 60 THEN '36-60'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS total_patients,
    gender
FROM patients
GROUP BY age_group, gender
ORDER BY age_group;