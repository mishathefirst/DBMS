
DECLARE
    IDinc INT := 0;
    NAME VARCHAR(30) := 'ABCDE';
    FLAG INT := 0;
BEGIN
    WHILE (IDinc > -1)
    LOOP
            INSERT INTO NEW VALUES (IDinc, NAME);
            IDinc := IDinc + 1;
            IF (FLAG = 0)
            THEN
                --SELECT LEFT (NAME, 3) INTO NAME;
                NAME := substr(NAME, 3);
                FLAG := 1;
            ELSE
                --SELECT CONCAT (NAME, 'DE');
                NAME := concat(NAME, 'DE');
                FLAG := 0;
            END IF;
    END LOOP;
END;
/
