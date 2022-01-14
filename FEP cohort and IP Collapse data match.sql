select * from PME_REPORTS.FEP_COHORT_2013_19;

select * from PME_BHO.IP_COLLAPSE_2010_CUR;


DROP TABLE PME_REPORTS.FEP_cohort_IP_Collapse_match_XXXX;
CREATE TABLE PME_REPORTS.FEP_cohort_IP_Collapse_match_XXXX AS
SELECT A.RECIPIENT_ID_1010, B.date_inpt_beg, B.date_inpt_end, B.inpt_type, (CASE 
		WHEN B.INPT_TYPE IN ('MH_28','MH_31','MH_OTH','MH_SPC') THEN 'Psych Inpatient'
		WHEN B.INPT_TYPE IN ('NON-BH') THEN 'Non-BH Inpatient'
		WHEN B.INPT_TYPE IN ('SUD_Detox','SUD_Rehab') THEN 'SUD Inpatient'
		ELSE ''
		END
        ) as SERV_GRP2
FROM PME_REPORTS.FEP_COHORT_2013_19 A LEFT JOIN pme_bho.ip_collapse_2010_cur B
ON A.RECIPIENT_ID_1010=B.RECIPIENT_ID
WHERE EXTRACT(YEAR FROM DATE_INPT_BEG)>=2013 AND
      EXTRACT(YEAR FROM DATE_INPT_END)<=2019 AND
      B.INPT_TYPE IN ('MH_28','MH_31','MH_OTH','MH_SPC','NON-BH','SUD_Detox','SUD_Rehab')
ORDER BY A.RECIPIENT_ID_1010;

/*
PME_REPORTS.FEP_COHORT_2013_19
PME_BHO.IP_COLLAPSE_2010_CUR

For FEP cohort in the first table, we would like to attach inpt begin date, inpt end date, inpt_type from  IP collapse table, and add a calculated column, SERV_GRP2 based on inpt_type  from the below table.

-match condition:
Join by recipient id 1010
inpt begin date and inpt end date should be in 2013-19
select inpt_type in the below 7 types.

-columns will be in the final file:
Recipient id 1010 from FEP cohort table, inpt begin date, inpt end date, inpt_type  from IP collapse table, calculated column, SERV_GRP2




INPT_TYPE in PME_BHO.IP_COLLAPSE_CUR	SERV_GRP2 in the original FEP SAS file
MH_28	Psych Inpatient
MH_31	Psych Inpatient
MH_OTH	Psych Inpatient
MH_SPC	Psych Inpatient
 	 
SUD_Detox	SUD Inpatient
SUD_Rehab	SUD Inpatient
 	 
NON-BH	Non-BH Inpatient



*/