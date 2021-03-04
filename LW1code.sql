SET SERVEROUTPUT ON FORMAT WRAPPED;
set autoprint on


CREATE PROCEDURE show_info
IS
    VERS VARCHAR(30) := '';
    ROWNUM INT := 0;

BEGIN
    SELECT version into VERS from V$INSTANCE;
    IF (VERS = '')
    THEN
	    DBMS_OUTPUT.put_line('Отсутствует информация об обновлениях Oracle');
    ELSE
	    DBMS_OUTPUT.put_line('Текущая версия СУБД: ' || VERS);

        dbms_output.put_line('No.   Дата обновления   Версия до обновления   Версия после обновления');
        dbms_output.put_line('____  _________________ _____________________  __________________________');
        dbms_output.put_line(' ');

        FOR vers_row IN (SELECT DISTINCT ID, action_time, VERSION FROM SYS.REGISTRY$HISTORY) LOOP
                ROWNUM := ROWNUM + 1;
                dbms_output.put_line(RPAD(ROWNUM, 5) || ' ' || RPAD(vers_row.ACTION_TIME, 17) || ' ' ||
                                     RPAD(' ', 22) || ' ' || RPAD(vers_row.VERSION, 28));
        END LOOP;
	END IF;
END show_info;
/

