-- salgrade table befüllen
INSERT INTO salgradesXML (xmldata)
SELECT XMLELEMENT("Salgrade",
           XMLELEMENT("Stufe", grade),
           XMLELEMENT("Min", losal),
           XMLELEMENT("Max", hisal)
       )
FROM salgrade;

-- subaufgabe a
SELECT XMLQuery('
    <Angestellte>{
        for $e in ora:view("emp")/ROW,
            $s in ora:view("salgrade")/ROW
        where xs:decimal($e/SAL) >= xs:decimal($s/LOSAL)
          and xs:decimal($e/SAL) <= xs:decimal($s/HISAL)
        order by xs:decimal($e/SAL)
        return
            <Angestellter>
                <Name>{$e/ENAME/text()}</Name>
                <Gehalt>{$e/SAL/text()}</Gehalt>
                <Gehaltsstufe>{$s/GRADE/text()}</Gehaltsstufe>
            </Angestellter>
    }</Angestellte>'
    RETURNING CONTENT) AS Mitarbeiterdaten
FROM DUAL;

-- subaufgabe b
SELECT XMLQuery('
    <Obergrenze>{
        for $e in ora:view("emp")/ROW,
            $s in ora:view("salgrade")/ROW
        where $e/ENAME = "SCOTT"
          and xs:decimal($e/SAL) >= xs:decimal($s/LOSAL)
          and xs:decimal($e/SAL) <= xs:decimal($s/HISAL)
        return $s/HISAL
    }</Obergrenze>'
    RETURNING CONTENT) AS Obergrenze_SCOTT
FROM DUAL;

-- subaufgabe c
-- Beispiel mit Bind-Variable :ename
SELECT XMLQuery('
    <Obergrenze>{
        for $e in ora:view("EMP")/ROW,
            $s in ora:view("SALGRADE")/ROW
        where $e/ENAME = $ename
          and xs:decimal($e/SAL) >= xs:decimal($s/LOSAL)
          and xs:decimal($e/SAL) <= xs:decimal($s/HISAL)
        return $s/HISAL
    }</Obergrenze>'
    PASSING :ename AS "ename"
    RETURNING CONTENT) AS Obergrenze_Eingabe
FROM DUAL;

-- subaufgabe d
SELECT XMLQuery('
    <Gehaltsstufen>{
        for $g in ora:view("salgrade")/ROW
        let $grade := $g/GRADE
        return
            <Gehaltsstufe stufe="{$grade}">
                {
                    for $e in ora:view("emp")/ROW
                    where xs:decimal($e/SAL) >= xs:decimal($g/LOSAL)
                      and xs:decimal($e/SAL) <= xs:decimal($g/HISAL)
                    return
                        <Angestellter>
                            <Name>{$e/ENAME/text()}</Name>
                            <Gehalt>{$e/SAL/text()}</Gehalt>
                        </Angestellter>
                }
            </Gehaltsstufe>
    }</Gehaltsstufen>'
    RETURNING CONTENT) AS Gehaltsgruppen_XML
FROM DUAL;
