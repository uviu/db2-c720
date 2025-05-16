ACCEPT anz PROMPT 'Anzahl der Spitzenverdiener'
DECLARE 
    n number(3) := &anz;
    name emp.ENAME%TYPE;
    gehalt emp.SAL%TYPE;
    lastsal emp.sal&Type;
    CURSOR empcursor is 
    SELECT ename, sal
    from EMP
    where sal is not null
    order by sal DESC;
begin 
OPEN empcursor;
FETCH empcursor INTO name, gehalt;
--Beginn der Schleife --> Abbrichkriterium definieren
-- insert => topdogs Tabelle
--weiter fetchen
-- Ende der SChleife

    FOR i IN 1..n LOOP
        INSERT INTO TOPDOGS (NAME, GEHALT)
        VALUES (name, gehalt);
        FETCH empcursor INTO name, gehalt;
        EXIT WHEN empcursor%NOTFOUND;
    END LOOP;

close empcursor;
COMMIT;
END;



--Musterlösung für Zeile 19 - 24
while (empcursor%rowcount <= n  or lastsal = currentsal)and empcursor%found LOOP
    insert into todogs values (name, gehalt);
    lastsal := gehalt; 
    fetch empcursor into name, gehalt;
end LOOP;