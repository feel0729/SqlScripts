-- Oracle sql
-- Analze tables to update statistics , 
-- that CBO(cost base optimizer) governs the execution for every Oracle query.
-- HOW TO USE: excute this script and excute result of this script.
select 'ANALZE TABLE "' || ut.table_name || '" COMPUTE STATISTICS;'
from user_tables ut
;