--aufgabe 6.4
insert into table ( select h.studgaenge
                    from HOCHSCHULE h
                    where FBEZ = 'I')
values ('EI-B')