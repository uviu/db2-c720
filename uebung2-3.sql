--uebung 2.3

ACCEPT anz PROMPT 'Anzahl der Spitzenverdiener'
DECLARE
    n number(3) := &anz;
    name emp.ENAME%TYPE;
    gehalt emp.SAL%TYPE;
    CURSOR empcursor IS
    SELECT ename, sal
    FROM emp 
    WHERE sal IS NOT NULL
    ORDER BY sal DESC;
BEGIN
    OPEN empcursor;
    LOOP
        FETCH empcursor INTO name, gehalt;
        EXIT WHEN empcursor%NOTFOUND OR empcursor%ROWCOUNT >n;
        INSERT INTO TOPDOGS (NAME, SALARY) VALUES (name, gehalt);
    end loop;
    CLOSE empcursor;
    COMMIT;
END;
/

