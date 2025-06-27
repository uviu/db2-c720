-- subaufgabe a
update companyxml
set mitarbeiterliste =
        insertxmlbefore(mitarbeiterliste,
                        '//Mitarbeiter[2]',
                        xmltype('<Mitarbeiter id="1111" Name="Morrison" Beruf="Assistant" Manager="7782" einstellDatum="2017-02">' ||
                                '<Gehalt>2500</Gehalt>' ||
                                '</Mitarbeiter>'))
where deptno = 10;

--subaufgabe b
update companyxml
set mitarbeiterliste =
        appendChildXML(mitarbeiterliste,
                       '/Mitarbeiterliste',
                       xmltype('<Mitarbeiter id="2222" Name="Miller" Beruf="Praktikant" Manager="7839" einstellDatum="2019-02">' ||
                               '<Gehalt>200</Gehalt>' ||
                               '</Mitarbeiter>'))
where deptno = 10;