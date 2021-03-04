SET SERVEROUTPUT ON FORMAT WRAPPED;
set autoprint on


CREATE PROCEDURE show_info
IS
    VERS VARCHAR(30) := '';
    rc sys_refcursor;

BEGIN
    SELECT version into VERS from V$INSTANCE;
    IF (VERS = '')
    THEN
	    DBMS_OUTPUT.put_line('Отсутствует информация об обновлениях Oracle');
    ELSE
	    DBMS_OUTPUT.put_line('Текущая версия СУБД: ' || VERS);
	    --SELECT * FROM SYS.REGISTRY$HISTORY;
        --open rc for select * from dual;
        --DBMS_SQL.return_result(rc);

        dbms_output.put_line('No.   Дата обновления   Версия до обновления   Версия после обновления');
        dbms_output.put_line('____  _________________ _____________________  __________________________');
        dbms_output.put_line(' ');

        --open rc for SELECT * FROM DUAL;
        FOR vers_row IN (SELECT ID, action, action_time, VERSION FROM sys.REGISTRY$HISTORY) LOOP
                dbms_output.put_line(RPAD(vers_row.ID, 4) || ' ' || RPAD(vers_row.ACTION_TIME, 17) || ' ' ||
                                     RPAD(' ', 21) || ' ' || RPAD(vers_row.VERSION, 26));
        END LOOP;
	END IF;
END show_info;
/

