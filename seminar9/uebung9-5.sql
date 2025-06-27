update companyxml
set mitarbeiterliste =
        deletexml(mitarbeiterliste,
                        '//Mitarbeiter[@id="2222"]')
where deptno = 10;
