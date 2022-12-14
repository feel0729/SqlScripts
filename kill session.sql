-- Oracle sql
-- kill session
-- need login with "SYS AS SYSDBA ""
select 'alter system kill session '''
       || VS.sid
       || ','
       || VS.serial#
       || ''' immediate;'
     , VS.OSUSER
     , VS.MACHINE
     , VS.STATUS
     , VS.ROW_WAIT_OBJ#
     , DO.OBJECT_NAME
     , VS.ROW_WAIT_ROW#
     , VS.BLOCKING_SESSION_STATUS
     , VS.WAIT_TIME
     , VS.SECONDS_IN_WAIT
     , STATE
from V$SESSION VS
left join DBA_OBJECT DO ON DO.OBJECT_ID = VS.ROW_WAIT_OBJ#
where VS.username = 'xxx' -- target DB
order by VS.SECONDS_IN_WAIT
;