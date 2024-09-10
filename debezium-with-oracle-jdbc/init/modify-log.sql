```shell

select group#, bytes/1024/1024, status from v$log order by 1;

# resize group 2
alter database clear logfile group 2;
alter database drop logfile group 2;
alter database add logfile group 2 ('/u01/app/oracle/oradata/XE/redo02.log', '/u01/app/oracle/oradata/XE/redo02a.log') size 300M reuse;

# resize group 3
alter database clear logfile group 3;
alter database drop logfile group 3;
alter database add logfile group 3 ('/u01/app/oracle/oradata/XE/redo03.log', '/u01/app/oracle/oradata/XE/redo03a.log') size 300M reuse;

# switching of CURRENT status logfile to inactive (for group 1) 
alter system switch logfile;

# wait until the ACTIVE status changes to INACTIVE (In my case, group 1 was ACTIVE from CURRENT status. 
# This can take few minutes to approximately half hour. However, you can execute below command to manually 
# checkpoint INACTIVE group
alter system checkpoint; 

# now, alter and resize group 1 after checkpointing is complete
alter database clear logfile group 1;
alter database drop logfile group 1;
alter database add logfile group 1 ('/u01/app/oracle/oradata/XE/redo01.log', '/u01/app/oracle/oradata/XE/redo01a.log') size 300M reuse;

# additional redo logs group
alter database add logfile group 4 ('/u01/app/oracle/oradata/XE/redo04.log', '/u01/app/oracle/oradata/XE/redo04a.log') size 300M reuse;
alter database add logfile group 5 ('/u01/app/oracle/oradata/XE/redo05.log', '/u01/app/oracle/oradata/XE/redo05a.log') size 300M reuse;
alter database add logfile group 6 ('/u01/app/oracle/oradata/XE/redo06.log', '/u01/app/oracle/oradata/XE/redo06a.log') size 300M reuse;


```
