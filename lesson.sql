-- List pts in Kingston

SELECT 
    PatientId,
    AdmittedDate,
    DischargeDate,
    DATEDIFF(DAY, AdmittedDate, DischargeDate) AS LengthOfStay,
    DATEADD (WEEK, -2, AdmittedDate) as ReminderDate, -- 2 weeks prior
    DATEADD(month, 3, DischargeDate) as AppointmentDate, -- 3 months post discharge
    Hospital,
    Ward,
    Tariff
FROM PatientStay
WHERE Hospital IN ('Kingston', 'PRUH')
--ORDER BY Hospital, Ward, Tariff DESC
ORDER BY PatientId DESC
--AND Ward LIKE '%Surgery%'
--AND AdmittedDate > '2024-02-27'
--and Tariff >= 6
-- OR Hospital = 'PRUH'
-- and Ward = 'Dermatology'

-- summarise data

SELECT
    Hospital
    ,Ward
    ,COUNT(*) AS [No of Pts]
    ,SUM(Tariff) AS TotalTariff
from PatientStay
GROUP BY Hospital, Ward

SELECT PatientId ,AdmittedDate ,HospitalType ,HospitalSize ,DimHospital.Hospital
FROM PatientStay JOIN DimHospital on PatientStay.Hospital = DimHospital.Hospital
where DimHospital.HospitalType = 'Teaching'

SELECT ps.PatientId
, ps.AdmittedDate
, ps.Hospital
, h.HospitalType
, h.HospitalSize
FROM PatientStay ps LEFT JOIN DimHospitalBad h on ps.Hospital = h.Hospital



