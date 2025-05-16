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

--Aufagbe 8
--anzahl := sql%rowcount
