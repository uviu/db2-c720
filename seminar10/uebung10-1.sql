-- example
SELECT XMLQuery('
    <result>{
        for $m in ora:view("companyXML")//Mitarbeiter
        return $m/Name
    }</result>'
                RETURNING CONTENT) AS Angestellte
FROM DUAL;

-- subaufgabe a
SELECT XMLQuery('
    for $m in ora:view("companyXML")//Mitarbeiter
    return $m'
                RETURNING CONTENT) AS Mitarbeiterdaten
FROM DUAL;

-- subaufgabe b
SELECT XMLQuery('
    <Mitarbeiter_Namen>{
        for $m in ora:view("companyXML")//Mitarbeiter/Name
        order by $m
        return $m
    }</Mitarbeiter_Namen>'
                RETURNING CONTENT) AS Sortierte_Namen
FROM DUAL;

-- subaufgabe c
SELECT XMLQuery('
    <Angestelltenliste>{
        for $m in ora:view("companyXML")//Mitarbeiter
        return
            <Angestellter>
                <ID>{$m/@id}</ID>
                <EDat>{$m/@einstellDatum}</EDat>
                <Name>{$m/Name/text()}</Name>
                <Beruf>{$m/@Beruf}</Beruf>
                <Gehalt>{$m/Gehalt/text()}</Gehalt>
            </Angestellter>
    }</Angestelltenliste>'
                RETURNING CONTENT) AS Angestellte
FROM DUAL;

-- subaufgabe d
SELECT XMLQuery('
    <Abteilungsliste>{
        for $m in distinct-values(ora:view("companyXML")//Mitarbeiterliste/@abteilung)
        return <Abteilung>{$m}</Abteilung>
    }</Abteilungsliste>'
                RETURNING CONTENT) AS Abteilungen
FROM DUAL;

-- subaufgabe e
SELECT XMLQuery('
    <Topdogs>{
        for $m in ora:view("companyXML")//Mitarbeiter
        where xs:decimal($m/Gehalt) >= 2500
        order by xs:decimal($m/Gehalt) descending
        return
            <topdog>
                <Name>{$m/Name/text()}</Name>
                <Gehalt>{$m/Gehalt/text()}</Gehalt>
            </topdog>
    }</Topdogs>'
                RETURNING CONTENT) AS Besserverdiener
FROM DUAL;

