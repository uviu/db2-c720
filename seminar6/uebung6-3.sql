--aufgabe 6.3
select s.*
from HOCHSCHULE h, table ( h.STUDGAENGE ) s;

select h.fbez, s.*
from HOCHSCHULE h, table ( h.STUDGAENGE ) s
order by h.FBEZ;