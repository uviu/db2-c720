--aufgabe 6.2
insert into hochschule
values ('ING', 'Wächterstr. 13', SG_TABLE_TYPE());
insert into hochschule
values ('IM', 'Karl-Liebknecht-Straße. 145', SG_TABLE_TYPE(SG('INB', 6, 'B.Sc.')));
COMMIT;

insert into table ( select h.studgaenge
                    from hochschule h
                    where fbez = 'IM')
values (SG('MIB', 6, 'B.Sc.'));

insert into table ( select h.studgaenge
                    from HOCHSCHULE h
                    where FBEZ = 'ING')
values (SG('EIB', 6, 'B.Sc.'));