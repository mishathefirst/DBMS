SET SERVEROUTPUT ON FORMAT WRAPPED;
set autoprint on


CREATE PROCEDURE show_info
IS
    VERS VARCHAR(30) := '';
    ROWNUM INT := 0;
    PREV_VERS VARCHAR(30):= '-';
    ALL_SESS VARCHAR(30) := '';
    USER_SESS VARCHAR(30) := '';

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

        FOR vers_row IN (SELECT DISTINCT ID, action_time, VERSION FROM SYS.REGISTRY$HISTORY ORDER BY ACTION_TIME) LOOP
                ROWNUM := ROWNUM + 1;
                dbms_output.put_line(RPAD(ROWNUM, 5) || ' ' || RPAD(cast(vers_row.ACTION_TIME as date), 17) || ' ' ||
                                     RPAD(PREV_VERS, 22) || ' ' || RPAD(vers_row.VERSION, 28));
                PREV_VERS := vers_row.VERSION;
        END LOOP;
	END IF;
    SELECT COUNT(*) INTO ALL_SESS FROM V$SESSION WHERE STATUS = 'ACTIVE';
    SELECT COUNT(USERNAME) INTO USER_SESS FROM V$SESSION WHERE STATUS = 'ACTIVE';
    DBMS_OUTPUT.PUT_LINE('Количество активных сессий: ' || ALL_SESS);
    DBMS_OUTPUT.PUT_LINE('Из них клиентов: ' || USER_SESS);
END show_info;
/

