libname PME_BHO oracle user="pme_bho" orapw="analyzepme"  
path='(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST= vsomh002.svc.ny.gov)(PORT=1532))
(CONNECT_DATA=(SERVICE_NAME=prdm)))' schema=pme_bho;

libname PME_DAT oracle user="pme_reports" orapw="ourtables" 
path='(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=vsomh002.svc.ny.gov)(PORT=1532))
(CONNECT_DATA=(SERVICE_NAME=prdm)))' schema=pme_reports;

libname Fep_ip "/home/svc.ny.gov/kyou/PME-ETS/Shared/FEP OnTrackNY EPINET/4. Research/4. FEP Acute Services/Data & Code";



proc sql;
CREATE TABLE Fep_ip.FEP_cohort_IP_Collapse_match AS
SELECT A.RECIPIENT_ID_1010, B.date_inpt_beg, B.date_inpt_end, B.inpt_type, (CASE 
		WHEN B.INPT_TYPE IN ('MH_28','MH_31','MH_OTH','MH_SPC') THEN 'Psych Inpatient'
		WHEN B.INPT_TYPE IN ('NON-BH') THEN 'Non-BH Inpatient'
		WHEN B.INPT_TYPE IN ('SUD_Detox','SUD_Rehab') THEN 'SUD Inpatient'
		WHEN B.INPT_TYPE IN ('SUD_ZGen') THEN 'BH Inpatient'
		ELSE ''
		END
        ) as SERV_GRP2,(CASE 
		WHEN B.INPT_TYPE IN ('MH_SPC') THEN 1
		ELSE .
		END) as FLAG_MH_SPC
FROM PME_dat.FEP_COHORT_2013_19 A LEFT JOIN pme_bho.ip_collapse_2010_cur B
ON A.RECIPIENT_ID_1010=B.RECIPIENT_ID
WHERE YEAR(DATEPART(DATE_INPT_BEG))>=2013 AND
      B.INPT_TYPE IN ('MH_28','MH_31','MH_OTH','MH_SPC','NON-BH','SUD_Detox','SUD_Rehab','SUD_ZGen')
ORDER BY A.RECIPIENT_ID_1010, B.date_inpt_beg, B.date_inpt_end;
quit;




proc sql;
select * from pme_bho.ip_collapse_2010_cur
where recipient_id in ('AC04554H')
order by date_inpt_beg;
quit;

proc sql;
select distinct(SERV_GRP2) from 
Fep_ip.FEP_cohort_IP_Collapse_match
;
quit;

proc sql;
select * from 
PME_dat.DM_BHO2_SERVICES
where recipient_id_1010 in ('AC04554H')
;
quit;