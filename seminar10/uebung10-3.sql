-- subaufgabe a
SELECT XMLQuery('
    <Abteilungen>{
        for $d in distinct-values(ora:view("emp")/ROW/DEPTNO)
        let $anz := count(ora:view("emp")/ROW[DEPTNO = $d])
        return
            <Abteilung>
                <AbtNr>{$d}</AbtNr>
                <AnzAngest>{$anz}</AnzAngest>
            </Abteilung>
    }</Abteilungen>'
    RETURNING CONTENT
) AS Abteilungsstatistik
FROM DUAL;

-- subaufgabe b
SELECT XMLQuery('
    let $abts := (
        for $d in distinct-values(ora:view("emp")/ROW/DEPTNO)
        let $anz := count(ora:view("emp")/ROW[DEPTNO = $d])
        return
            <Abteilung>
                <AbtNr>{$d}</AbtNr>
                <AnzAngest>{$anz}</AnzAngest>
            </Abteilung>
    )
    return
        <TopAbteilung>{
            for $a in $abts
            where xs:integer($a/AnzAngest)
                  = max($abts/AnzAngest/xs:integer(.))
            return $a
        }</TopAbteilung>'
    RETURNING CONTENT
) AS Abteilung_mit_max_Angestellten
FROM DUAL;

