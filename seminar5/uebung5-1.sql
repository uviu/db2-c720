--uebung 5.1
drop type person force;

create noneditionable type person as object
(
    VNAME   varchar2(20),
    NNAME   varchar2(20),
    GEBJAHR number(4),
    STRASSE varchar2(30),
    ORT     varchar2(30),
    MANAGER REF PERSON,

    constructor function person(
        vname varchar2,
        nname varchar2,
        gebjahr number,
        strasse varchar2,
        ort varchar2,
        manager REF PERSON
    ) return self as result,

    member procedure neuername(nachname varchar2),
    member function age return number
);

create or replace noneditionable type body person as
    member procedure neuerName(nachname varchar2) is
        begin
            self.NNAME := nachname;
        end;    
    member function age return number is
        begin
            return extract(year from current_date) - gebjahr;
        end;
    constructor function person(vname varchar2, nname varchar2, gebjahr number, strasse varchar2, ort varchar2, manager REF PERSON) return self as result is
        begin
            self.VNAME := vname;
            self.NNAME := nname;
            self.GEBJAHR := gebjahr;
            self.STRASSE := strasse;
            self.ORT := 'Leipzig';
            self.MANAGER := NULL;
            return;
        end person;
end;
/
/;


