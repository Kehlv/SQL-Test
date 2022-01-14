select * from copper_v2_high_intensity_index;
/*--- Psychosis Cohort --------------------------------------------------*/
select count(distinct recipient_id_1010) from copper_v2_high_intensity_index;
-- Psychosis Cohort  617860



/*---  Psychosis individuals  ------------------*/
-- Each service type
select servicetype, count (distinct recipient_id_1010) from copper_v2_high_intensity_index
group by servicetype;

-- Total and ER BH or CPEP
select count(distinct recipient_id_1010) from copper_v2_high_intensity_index
where servicetype in ('MH_ER','SUD_ER','CPEP');  --329070

select count(distinct recipient_id_1010) from copper_v2_high_intensity_index
where servicetype in ('MH_ER','SUD_ER');  --312430

-- Total MH Clinic services - specialty
select count(distinct recipient_id_1010) from copper_v2_high_intensity_index
where servicetype in ('MH_OP_ACT','AOT','HCBS - Adult','HCBS - Child','MH_OP_CW',
'HHP','ICM','MH_OP_IPRT','MH_OP_PH','MH_OP_PROS','MH_OP_CDT','MH_OP_DT','MH_OP_CR','MH_OP_TFH');  --113985

-- Total high intensity Ambulatory (unduplicated total)
select count(distinct recipient_id_1010) from copper_v2_high_intensity_index
where servicetype in ('MH_OP_ACT','AOT','HCBS - Adult','HCBS - Child','MH_OP_CW',
'HHP','ICM','MH_OP_IPRT','MH_OP_PH','MH_OP_PROS','MH_OP_CDT','MH_OP_DT');  --105956

-- CDT/DT
select count(distinct recipient_id_1010) from copper_v2_high_intensity_index
where servicetype in ('MH_OP_CDT','MH_OP_DT');  --25984

-- CR/TFH = Total Residential
select count(distinct recipient_id_1010) from copper_v2_high_intensity_index
where servicetype in ('MH_OP_CR','MH_OP_TFH');  --26416

/*--avg claim service days------------------------------------*/
select servicetype, avg(N_srv) from copper_v2_high_intensity_index
group by servicetype;

-- Total and ER BH or CPEP
select avg(N_srv)  from copper_v2_high_intensity_index
where servicetype in ('MH_ER','SUD_ER','CPEP');  

select avg(N_srv)  from copper_v2_high_intensity_index
where servicetype in ('MH_ER','SUD_ER'); 

-- Total MH Clinic services - specialty
select avg(N_srv) from copper_v2_high_intensity_index
where servicetype in ('MH_OP_ACT','AOT','HCBS - Adult','HCBS - Child','MH_OP_CW',
'HHP','ICM','MH_OP_IPRT','MH_OP_PH','MH_OP_PROS','MH_OP_CDT','MH_OP_DT','MH_OP_CR','MH_OP_TFH'); 

-- Total high intensity Ambulatory (unduplicated total)
select avg(N_srv) from copper_v2_high_intensity_index
where servicetype in ('MH_OP_ACT','AOT','HCBS - Adult','HCBS - Child','MH_OP_CW',
'HHP','ICM','MH_OP_IPRT','MH_OP_PH','MH_OP_PROS','MH_OP_CDT','MH_OP_DT');  

-- CDT/DT
select avg(N_srv) from copper_v2_high_intensity_index
where servicetype in ('MH_OP_CDT','MH_OP_DT');  

-- CR/TFH = Total Residential
select avg(N_srv) from copper_v2_high_intensity_index
where servicetype in ('MH_OP_CR','MH_OP_TFH');  


-------------------------------------------------------------------------------





*--- Schizo 2+ Cohort ---------------------------------*/
select count(distinct recipient_id_1010) from copper_v2_high_intensity_index where schizo_cohort_ind=1;
-- Schizo 2+ Cohort   228290


-- Each service type
select servicetype, count (distinct recipient_id_1010) from copper_v2_high_intensity_index
where schizo_cohort_ind=1
group by servicetype;

-- Total and ER BH or CPEP
select count(distinct recipient_id_1010) from copper_v2_high_intensity_index
where servicetype in ('MH_ER','SUD_ER','CPEP')
and schizo_cohort_ind=1; 

select count(distinct recipient_id_1010) from copper_v2_high_intensity_index
where servicetype in ('MH_ER','SUD_ER')
and schizo_cohort_ind=1; 
-- Total MH Clinic services - specialty
select count(distinct recipient_id_1010) from copper_v2_high_intensity_index
where servicetype in ('MH_OP_ACT','AOT','HCBS - Adult','HCBS - Child','MH_OP_CW',
'HHP','ICM','MH_OP_IPRT','MH_OP_PH','MH_OP_PROS','MH_OP_CDT','MH_OP_DT','MH_OP_CR','MH_OP_TFH')
and schizo_cohort_ind=1;  

-- Total high intensity Ambulatory (unduplicated total)
select count(distinct recipient_id_1010) from copper_v2_high_intensity_index 
where servicetype in ('MH_OP_ACT','AOT','HCBS - Adult','HCBS - Child','MH_OP_CW',
'HHP','ICM','MH_OP_IPRT','MH_OP_PH','MH_OP_PROS','MH_OP_CDT','MH_OP_DT')
and schizo_cohort_ind=1;  

-- CDT/DT
select count(distinct recipient_id_1010) from copper_v2_high_intensity_index
where servicetype in ('MH_OP_CDT','MH_OP_DT')
and schizo_cohort_ind=1; 
-- CR/TFH = Total Residential
select count(distinct recipient_id_1010) from copper_v2_high_intensity_index
where servicetype in ('MH_OP_CR','MH_OP_TFH')
and schizo_cohort_ind=1; 



/*--avg claim service days------------------------------------*/
select servicetype, avg(N_srv) from copper_v2_high_intensity_index
where schizo_cohort_ind=1
group by servicetype
; 

-- Total and ER BH or CPEP
select avg(N_srv)  from copper_v2_high_intensity_index
where servicetype in ('MH_ER','SUD_ER','CPEP')
and schizo_cohort_ind=1; 

select avg(N_srv)  from copper_v2_high_intensity_index
where servicetype in ('MH_ER','SUD_ER')
and schizo_cohort_ind=1; 

-- Total MH Clinic services - specialty
select avg(N_srv) from copper_v2_high_intensity_index
where servicetype in ('MH_OP_ACT','AOT','HCBS - Adult','HCBS - Child','MH_OP_CW',
'HHP','ICM','MH_OP_IPRT','MH_OP_PH','MH_OP_PROS','MH_OP_CDT','MH_OP_DT','MH_OP_CR','MH_OP_TFH')
and schizo_cohort_ind=1; 

-- Total high intensity Ambulatory (unduplicated total)
select avg(N_srv) from copper_v2_high_intensity_index
where servicetype in ('MH_OP_ACT','AOT','HCBS - Adult','HCBS - Child','MH_OP_CW',
'HHP','ICM','MH_OP_IPRT','MH_OP_PH','MH_OP_PROS','MH_OP_CDT','MH_OP_DT')
and schizo_cohort_ind=1; 

-- CDT/DT
select avg(N_srv) from copper_v2_high_intensity_index
where servicetype in ('MH_OP_CDT','MH_OP_DT')
and schizo_cohort_ind=1; 

-- CR/TFH = Total Residential
select avg(N_srv) from copper_v2_high_intensity_index
where servicetype in ('MH_OP_CR','MH_OP_TFH')
and schizo_cohort_ind=1; 