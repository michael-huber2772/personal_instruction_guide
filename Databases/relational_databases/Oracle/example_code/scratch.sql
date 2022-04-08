
create sequence partition_marker
    start with 1 
    increment by 1
    ;

with dummy_table as (select case when prior_ug_gpa <= 2 then 'Below' else 'Fine' end academic_status
                            , lag(case when prior_ug_gpa <= 2 then 'Below' else 'Fine' end, 1) over (partition by pidm order by pidm, term_code) previous_academic_status                         
                            , term_code
                            , pidm
                            , prior_ug_gpa
                            , row_number() over (partition by case when prior_ug_gpa <= 2 then 'Below' else 'Fine' end, pidm
                                                    order by pidm, term_code) terms_at_status
                    from wsrpmgr.dim_student_term
                    where enrolled_ind = 'Y'
                    and pidm = '662'
                    order by pidm, term_code)
select pidm
    , term_code
    , academic_status
    , previous_academic_status
    , prior_ug_gpa
    ,  CASE WHEN academic_status||pidm = previous_academic_status||pidm then 'currval'
            WHEN academic_status||pidm <> previous_academic_status||pidm then 'nextval' end as marker_movement
    ,  CASE WHEN academic_status||pidm <> previous_academic_status||pidm then partition_marker.nextval 
            WHEN academic_status||pidm = previous_academic_status||pidm then partition_marker.currval end as marker
from dummy_table
                    ;
                    



SELECT partition_marker.seqnextval
FROM dual
CONNECT by level <= 9
;

select
case when 1=0 then 'next ' || partition_marker.nextval
     when 1=1 then 'curr ' || partition_marker.currval
end col1
from dual;
