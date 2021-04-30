CREATE DATABASE sicklaw
    USER SYS IDENTIFIED BY databasepwd
    USER SYSTEM IDENTIFIED BY databasepwd
 LOGFILE
        GROUP 1 ('/u01/rvr81/logs/sicklaw/redo01.log') SIZE 100M,
        GROUP 2 ('/u01/rvr81/logs/sicklaw/redo02.log') SIZE 100M,
        GROUP 3 ('/u01/rvr81/logs/sicklaw/redo03.log') SIZE 100M
 MAXLOGHISTORY 1
 MAXLOGFILES 16
 MAXLOGMEMBERS 3
 MAXDATAFILES 1024
 CHARACTER SET UTF8
 NATIONAL CHARACTER SET UTF8
 EXTENT MANAGEMENT LOCAL
 DATAFILE '$ORADATA/node03/otaco90.dbf' SIZE 700M REUSE AUTOEXTEND ON,
        '$ORADATA/node04/idepo89.dbf' SIZE 700M REUSE AUTOEXTEND ON,
        '$ORADATA/node02/ageha31.dbf' SIZE 700M REUSE AUTOEXTEND ON
 SYSAUX DATAFILE '$ORADATA/node04/pey83.dbf' SIZE 550M REUSE AUTOEXTEND ON
 DEFAULT TABLESPACE users
    DATAFILE '$ORADATA/node04/oketenu977.dbf' SIZE 500M REUSE AUTOEXTEND ON,
    '$ORADATA/node01/axeluhu829.dbf' SIZE 500M REUSE AUTOEXTEND ON
 DEFAULT TEMPORARY TABLESPACE tempts1
    TEMPFILE '$ORADATA/temp01.dbf' SIZE 20M REUSE AUTOEXTEND ON
 UNDO TABLESPACE undotbs1
    DATAFILE '$ORADATA/undotbs01.dbf' SIZE 200M REUSE AUTOEXTEND ON





