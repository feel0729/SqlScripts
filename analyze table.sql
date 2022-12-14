select 'ANALZE TABLE "' || ut.table_name || '" COMPUTE STATISTICS;'
from user_tables ut
;