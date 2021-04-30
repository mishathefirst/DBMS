 CREATE TABLESPACE FAR_YELLOW_FISH
    DATAFILE
        '$ORADATA/node03/faryellowfish01.dbf' SIZE 200M,
        '$ORADATA/node03/faryellowfish02.dbf' SIZE 200M;
 CREATE TABLESPACE WET_BROWN_SOUP
    DATAFILE
        '$ORADATA/node01/wetbrownsoup01.dbf' SIZE 100M,
        '$ORADATA/node03/wetbrownsoup02.dbf' SIZE 100M;
 CREATE TABLESPACE EASY_ORANGE_DISK
    DATAFILE
        '$ORADATA/node03/easyorangedisk01.dbf' SIZE 100M,
        '$ORADATA/node03/easyorangedisk02.dbf' SIZE 100M,
        '$ORADATA/node02/easyorangedisk03.dbf' SIZE 100M,
        '$ORADATA/node02/easyorangedisk04.dbf' SIZE 100M;
 CREATE TABLESPACE WET_YELLOW_OVEN
    DATAFILE
        '$ORADATA/node01/wetyellowoven01.dbf' SIZE 100M;

