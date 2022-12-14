-- Oracle
-- some scripts about tempfile

select * from DBA_TEMP_FILES;

select * from DBA_TEMP_FREE_SPACE;

-- resize tempfile
-- suppose tempfile is '/home/oracle/xxx.dbf'
alter database tempfile '/home/oracle/xxx.dbf' resize 10M;

-- recreate tempfile steps(7)
-- reference: https://dbaclass.com/article/how-to-drop-and-recreate-temp-tablespace-in-oracle/
-- step 1:
-- create temp2
create temporary tablespace temp2 tempfile '/home/oracle/temp2.dbf' size 2000M;

-- step 2:
-- point to temp2
alter database default temporary tablespace temp2;

-- step 3:
-- make sure no body using temporary tablespace
-- find session and kill session
select username,session_num,session_addr from v$sort_usage;

-- step 4:
-- drop old temporary tablespace
drop tablespace temp INCLUDING CONTENTS AND DATAFILES;

-- step 5:
-- create temporary tablespace
create temporary tablespace temp tempfile '/home/oracle/temp.dbf' size 10G;

-- step 6:
-- point to temp
alter database default temporary tablespace temp;

-- step 7:
-- drop temp2
drop tablespace temp2 INCLUDING CONTENTS AND DATAFILES;