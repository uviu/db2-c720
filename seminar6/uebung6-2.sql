--aufgabe 6.2
insert into hochschule
values ('ING', 'Wächterstr. 13', SG_TABLE_TYPE());
insert into hochschule
values ('IM', 'Karl-Liebknecht-Straße. 145', SG_TABLE_TYPE(SG('INB', 6, 'B.Sc.')));
COMMIT;

