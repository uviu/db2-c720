variable message varchar2(50);

begin
    :message := 'Mein erster Block funktioniert';
end;
/
print message;

--alternativ
declare
    message varchar2(50) := 'Mein Block funktioniert auch so';
BEGIN
    dbms_output.put_line(message);
end;
/

--Aufgabe 5
declare
    result number(5, 2);
begin
    result := &z1/&z2 + &z2;
    dbms_output.put_line(to_char(result));
end;
/

-- alternativ
ACCEPT zahl1 NUMBER PROMPT 'Geben Sie die erste Zahl ein: '
ACCEPT zahl2 NUMBER PROMPT 'Geben Sie die zweite Zahl ein: '

DECLARE
  v_zahl1 NUMBER := &zahl1;
  v_zahl2 NUMBER := &zahl2;
  v_ergebnis NUMBER;
BEGIN
  v_ergebnis := (v_zahl1 / v_zahl2) + v_zahl2;
  DBMS_OUTPUT.PUT_LINE('Ergebnis: ' || v_ergebnis);
END;
/

--Aufgabe 6
-- Eingabe der Variablen über SQL*Plus
ACCEPT gehalt PROMPT 'Bitte geben Sie das Jahresgehalt ein: '
ACCEPT bonus PROMPT 'Bitte geben Sie den Bonus-Prozentsatz ein: '

-- PL/SQL-Block zur Berechnung der Gesamtvergütung
DECLARE
    v_gehalt        NUMBER := NVL(&gehalt, 0); -- NVL setzt NULL auf 0
    v_bonus_prozent NUMBER := &bonus / 100; -- Umrechnung in Dezimalzahl
    v_gesamt        NUMBER;
BEGIN
    v_gesamt := v_gehalt + (v_gehalt * v_bonus_prozent);
    DBMS_OUTPUT.PUT_LINE('Die gesamte Vergütung beträgt: ' || TO_CHAR(v_gesamt, '999,999.99'));
END;
/

-- Aufgabe 7
DECLARE
    max_deptno NUMBER;
BEGIN
    SELECT MAX(deptno)
      INTO max_deptno
      FROM dept;
    DBMS_OUTPUT.PUT_LINE('Maximaler Wert: ' || max_deptno);
END;
/

--Aufgabe 8
--anzahl := sql%rowcount

-- Aufgabe 10
INSERT INTO dept (deptno, dname, loc) VALUES (50, 'EDUCATION', 'LEIPZIG');
INSERT INTO dept (deptno, dname, loc) VALUES (60, 'ADMINISTRATION', 'LEIPZIG');
COMMIT;

ACCEPT ort CHAR PROMPT 'Bitte geben Sie die Location ein: '

DECLARE
    v_ort   dept.loc%TYPE := '&ort';
    v_count NUMBER;
BEGIN
    DELETE FROM dept WHERE loc = v_ort;
    v_count := SQL%ROWCOUNT;
    DBMS_OUTPUT.PUT_LINE('Anzahl der gelöschten Abteilungen: ' || v_count);
END;
/