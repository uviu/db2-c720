--uebung 5.3
create table personal of PERSON;
insert into personal values (PERSON('Peter', 'Müller', 1982, 'Hillerstr. 10', null, null));
insert into personal values (PERSON('Horst', 'Meier', 1996, 'Herderstr. 13', 'Paderborn',
                             (select ref(p) from personal p where nname = 'Müller')));
select value(p) from personal p;
