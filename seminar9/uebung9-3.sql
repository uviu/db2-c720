-- subaufgabe a
update companyxml x
set mitarbeiterliste = updatexml(mitarbeiterliste,
                                 '/Mitarbeiterliste/Mitarbeiter[@Beruf="PRESIDENT"]/Beruf/text()',
                                 'BOSS');

-- subaufgabe b
update companyxml x
set mitarbeiterliste = updatexml(mitarbeiterliste,
                                 '/Mitarbeiterliste/Mitarbeiter[Beruf="SALESMAN"]/Beruf/text()',
                                 'VERKAEUFER');

-- subaufgabe c
update companyxml x
set mitarbeiterliste = updatexml(mitarbeiterliste,
                                 '/Mitarbeiterliste/Mitarbeiter[@id="7369"]/Gehalt/text()',
                                 '900');

-- subaufgabe d
update companyxml x
set mitarbeiterliste = updatexml(mitarbeiterliste,
                                 '/Mitarbeiterliste/Mitarbeiter[@id="7934"]/Beruf/text()',
                                 'ANALYST');