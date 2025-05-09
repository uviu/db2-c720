--uebung 2.3

ACCEPT anz PROMPT 'Anzahl der Spitzenverdiener'
DECLARE
    n number(3) := &anz;
    name emp.ENAME&TYPE;
    gehalt emp.SAL%TYPE;
    CURSOR empcursor IS
    SELECT ename, sal
    FROM emp 
    WHERE sal IS NOT NULL
    ORDER BY sal DESC;
BEGIN
    OPEN empcursor;
    FETCH empcursor INTO name, gehalt;
    --beginn der schleife
    CLOSE empcursor;
END;

