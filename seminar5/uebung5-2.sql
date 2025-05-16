--uebung 5.2
--!enable dbmsoutput in datagrip
declare
    p1 PERSON;
    p2 PERSON;
    lebensalter number(4);
    oldname varchar2(30);
    begin
        p1 := person('Hans', 'Meier', 1975, 'Herdestr.12', 'Berlin', null);
        DBMS_OUTPUT.PUT_LINE(p1.NNAME || ' wohnt in' || p1.ORT);
        p2 := person('Lisa', 'Müller', 1982, 'Peterstr.23', null, null);
        DBMS_OUTPUT.PUT_LINE(p1.NNAME || ' wohnt in ' || p2.ORT);
        oldname := p2.NNAME;
        p2.NEUERNAME('Lehmann');
        DBMS_OUTPUT.PUT_LINE('Der neue Name von ' || oldname || ' ist ' || p2.NNAME);
        lebensalter := p1.AGE();
    end;
/