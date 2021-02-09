--4. Implementa?i în Oracle diagrama conceptual? realizat?: defini?i toate tabelele, implementând toate
--constrângerile de integritate necesare (chei primare, cheile externe etc).
create table sport 
( id_sport number(4) constraint pk_id_sport primary key,
  nume_sport varchar2(30)  constraint nl_nume_sport not null
);

create table complex 
(
  id_complex number(4) constraint pk_id_complex primary key,
  oras varchar2(30),
  judet varchar2(20),
  strada varchar2(50),
  numar number(4)
);

create table echipa 
(
  id_echipa number(4) constraint pk_id_echipa primary key,
  nume_antrenor varchar2(30),
  prenume_antrenor varchar2(30),
  data_infiintare date default sysdate,
  id_sport number(4) constraint fk_id_sport references sport(id_sport)
  nume_echipa varchar2(40);
 );

create table teren
(
  id_teren number(4) constraint pk_id_teren primary key,
  id_complex number(4) constraint fk_id_complex references complex(id_complex),
  id_sport number(4) constraint fk_id_sport_teren references sport(id_sport),
  nr_teren number(2)
);

create table jucator
(
  id_jucator number(4) constraint pk_id_jucator primary key,
  id_echipa number(4) constraint fk_id_echipa references echipa(id_echipa),
  prenume varchar2(20),
  nume varchar2(20),
  data_nasterii date,
  salariu number(9, 2)
);

create table antrenament 
(
  id_antrenament number(4) constraint pk_id_antrenament primary key,
  id_echipa number(4) constraint fk_id_echipa_antr references echipa(id_echipa),
  id_teren number(4) constraint fk_id_teren references teren(id_teren),
  ora_inceput timestamp(0),
  ora_sfarsit timestamp(0)
);

create table cantonament 
(
  id_cantonament number(4) constraint pk_id_cantonament primary key, 
  id_echipa number(4) constraint fk_id_echipa_cant references echipa(id_echipa),
  data_inceput_cant date,
  data_sfarsit_cant date,
  oras varchar2(50)
);


--5. Ad?uga?i informa?ii coerente în tabelele create (minim 3-5 înregistr?ri pentru fiecare entitate
--independent?; minim 10 înregistr?ri pentru tabela asociativ?).
insert into sport 
values (1, 'Baschet');
insert into sport 
values (2, 'Handbal');
insert into sport
values (3, 'Volei');
insert into sport
values (4, 'Fotbal');

insert into complex
values (1, 'Craiova', 'Dolj', 'Bucovat', 25, 'Centrul Sportiv de Antrenament');
insert into complex
values (2, 'Craiova', 'Dolj', 'Ilie Balaci', 6, 'Centrul Sportiv Vointa');
insert into complex
values (3, 'Craiova', 'Dolj', 'Brestei', 20, 'Sala sporturilor Ion Constantinescu');
insert into complex
values (4, 'Craiova', 'Dolj', 'Decebal', 43, 'Centrul Sportiv Banie');


insert into teren
values (1, 1, 1, 1);
insert into teren
values (2, 1, 4, 2);
insert into teren 
values (3, 2, 1, 1);
insert into teren 
values (4, 2, 3, 2);
insert into teren 
values (5, 3, 1, 1);
insert into teren 
values (6, 3, 2, 2);
insert into teren 
values (7, 3, 3, 3);
insert into teren 
values (8, 4, 4, 1);



insert into echipa 
values (1, 'Todorov', 'Aco', TO_DATE('17/09/2007', 'DD/MM/YYYY'), 1, 'SCM U Craiova Baschet');
insert into echipa 
values (2, 'Burcea', 'Bogdan', TO_DATE('01/07/2006', 'DD/MM/YYYY'), 2, 'SCM Craiova Handbal');
insert into echipa 
values (3, 'Mitru', 'Claudiu', TO_DATE('30/05/2009', 'DD/MM/YYYY'), 3, 'SCM U Craiova Volei');
insert into echipa 
values (4, 'Papura', 'Corneliu', TO_DATE('10/07/2013', 'DD/MM/YYYY'), 4, 'CS U Craiova');


insert into jucator
values (1, 1, 'Dragos' , 'Diculescu' , TO_DATE('25/08/1999', 'DD/MM/YYYY'), 5000);
insert into jucator
values (2, 1, 'Monyea' , 'Pratt', TO_DATE('11/07/1985', 'DD/MM/YYYY'), 10000);
insert into jucator
values (3, 1, 'Goran' , 'Filipovic', TO_DATE('26/11/1996', 'DD/MM/YYYY'), 8000);
insert into jucator
values (4, 1, 'Mate' , 'Vucic' , TO_DATE('06/04/1994', 'DD/MM/YYYY'), 7000);
insert into jucator
values (5, 1, 'Bogdan' , 'Tibarna', TO_DATE('15/02/1990', 'DD/MM/YYYY'), 2500);
insert into jucator
values (6, 2, 'Cristina' , 'Zamfir' , TO_DATE('29/09/1989', 'DD/MM/YYYY'), 4000);
insert into jucator
values (7, 2, 'Ana-Maria' , 'Ticu' , TO_DATE('23/02/1992', 'DD/MM/YYYY'), 3000);
insert into jucator
values (8, 2, 'Ana-Maria' , 'Savu' , TO_DATE('24/02/1990', 'DD/MM/YYYY'), 2000);
insert into jucator
values (9, 3, 'Igor' , 'Jovanovic' , TO_DATE('21/06/1986', 'DD/MM/YYYY'), 2500);
insert into jucator
values (10, 3, 'Robert' , 'Irinel' , TO_DATE('12/09/1993', 'DD/MM/YYYY'), 3000);
insert into jucator
values (11, 3, 'Razvan' , 'Olteanu' , TO_DATE('07/02/1997', 'DD/MM/YYYY'), 5000);
insert into jucator
values (12, 3, 'Laurentiu' , 'Lica' , TO_DATE('02/03/2000', 'DD/MM/YYYY'), 1000);

insert into jucator
values (13, 4, 'Andrei' , 'Ivan' , TO_DATE('04/01/1996', 'DD/MM/YYYY'), 10000);
insert into jucator
values (14, 4, 'Ivan' , 'Mamut' , TO_DATE('30/04/1997', 'DD/MM/YYYY'), 7000);
insert into jucator
values (15, 4, 'Alexandru', 'Cicaldau', TO_DATE('08/07/1997', 'DD/MM/YYYY'), 20000);
insert into jucator
values (16, 4, 'Dan', 'Nistor', TO_DATE('08/10/1988', 'DD/MM/YYYY'), 12000);
insert into jucator
values (17, 2, 'Cristina', 'Neagu', TO_DATE('03/09/1998', 'DD/MM/YYYY'), 5000);
insert into jucator
values (18, 4, 'Elvir', 'Koljic', TO_DATE('02/06/1996', 'DD/MM/YYYY'), 20000);


insert into cantonament
values (1, 1, TO_DATE('25/01/2021', 'DD/MM/YYYY'), TO_DATE('02/02/2021', 'DD/MM/YYYY'), 'Viena');
insert into cantonament
values (2, 2, TO_DATE('24/01/2021', 'DD/MM/YYYY'), TO_DATE('01/02/2021', 'DD/MM/YYYY'), 'Poiana Brasov');
insert into cantonament
values (3, 3, TO_DATE('26/01/2021', 'DD/MM/YYYY'), TO_DATE('04/02/2021', 'DD/MM/YYYY'), 'Predeal');
insert into cantonament
values (4, 4, TO_DATE('25/01/2021', 'DD/MM/YYYY'), TO_DATE('05/02/2021', 'DD/MM/YYYY'), 'Antalya');
insert into cantonament
values (5, 4, TO_DATE('10/02/2021', 'DD/MM/YYYY'), TO_DATE('18/02/2021', 'DD/MM/YYYY'), 'Poiana Brasov');


insert into antrenament
values (1, 1, 1, TO_TIMESTAMP('01/12/2020 09:00', 'DD/MM/YYYY HH24:MI'),TO_TIMESTAMP('01/12/2020 12:00', 'DD/MM/YYYY HH24:MI'));
insert into antrenament
values (2, 1, 1, TO_TIMESTAMP('05/12/2020 16:00', 'DD/MM/YYYY HH24:MI'),TO_TIMESTAMP('05/12/2020 18:00', 'DD/MM/YYYY HH24:MI'));
insert into antrenament
values (3, 1, 1, TO_TIMESTAMP('11/12/2020 08:00', 'DD/MM/YYYY HH24:MI'),TO_TIMESTAMP('11/12/2020 10:00', 'DD/MM/YYYY HH24:MI'));
insert into antrenament
values (4, 1, 1, TO_TIMESTAMP('08/12/2020 17:00', 'DD/MM/YYYY HH24:MI'),TO_TIMESTAMP('08/12/2020 20:00', 'DD/MM/YYYY HH24:MI'));
insert into antrenament
values (5, 2, 6, TO_TIMESTAMP('02/12/2020 09:00', 'DD/MM/YYYY HH24:MI'),TO_TIMESTAMP('02/12/2020 12:00', 'DD/MM/YYYY HH24:MI'));
insert into antrenament
values (6, 2, 6, TO_TIMESTAMP('06/12/2020 16:00', 'DD/MM/YYYY HH24:MI'),TO_TIMESTAMP('06/12/2020 18:00', 'DD/MM/YYYY HH24:MI'));
insert into antrenament
values (7, 2, 6, TO_TIMESTAMP('09/12/2020 12:00', 'DD/MM/YYYY HH24:MI'),TO_TIMESTAMP('09/12/2020 13:30', 'DD/MM/YYYY HH24:MI'));
insert into antrenament
values (8, 2, 6, TO_TIMESTAMP('11/12/2020 13:00', 'DD/MM/YYYY HH24:MI'),TO_TIMESTAMP('11/12/2020 15:30', 'DD/MM/YYYY HH24:MI'));
insert into antrenament
values (9, 3, 4, TO_TIMESTAMP('02/12/2020 08:00', 'DD/MM/YYYY HH24:MI'),TO_TIMESTAMP('02/12/2020 10:00', 'DD/MM/YYYY HH24:MI')); 
insert into antrenament
values (10, 3, 7, TO_TIMESTAMP('04/12/2020 09:00', 'DD/MM/YYYY HH24:MI'),TO_TIMESTAMP('04/12/2020 11:30', 'DD/MM/YYYY HH24:MI'));
insert into antrenament
values (11, 3, 4, TO_TIMESTAMP('06/12/2020 17:00', 'DD/MM/YYYY HH24:MI'),TO_TIMESTAMP('06/12/2020 19:30', 'DD/MM/YYYY HH24:MI'));
insert into antrenament
values (12, 3, 7, TO_TIMESTAMP('08/12/2020 18:00', 'DD/MM/YYYY HH24:MI'),TO_TIMESTAMP('08/12/2020 20:00', 'DD/MM/YYYY HH24:MI'));
insert into antrenament
values (13, 4, 2, TO_TIMESTAMP('04/12/2020 08:00', 'DD/MM/YYYY HH24:MI'),TO_TIMESTAMP('04/12/2020 11:00', 'DD/MM/YYYY HH24:MI'));
insert into antrenament
values (14, 4, 2, TO_TIMESTAMP('05/12/2020 17:00', 'DD/MM/YYYY HH24:MI'),TO_TIMESTAMP('05/12/2020 19:30', 'DD/MM/YYYY HH24:MI'));
insert into antrenament
values (15, 4, 2, TO_TIMESTAMP('07/12/2020 08:00', 'DD/MM/YYYY HH24:MI'),TO_TIMESTAMP('07/12/2020 10:30', 'DD/MM/YYYY HH24:MI')); 
insert into antrenament
values (16, 4, 8, TO_TIMESTAMP('09/12/2020 08:00', 'DD/MM/YYYY HH24:MI'),TO_TIMESTAMP('09/12/2020 10:30', 'DD/MM/YYYY HH24:MI')); 


--6.	Defini?i un subprogram stocat care s? utilizeze un tip de colec?ie studiat. Apela?i subprogramul.
--Definiti o procedura stocata care micsoreaza cu 5% salariile jucatorilor de volei cu salariul initial >=2500;
create or replace type nested_table is table of number;
/

create or replace procedure micsorare_salarii 

is 
    cnt_rez NUMBER := 0;
    id_volei NUMBER := 3;
    
    ids nested_table := nested_table();
    
BEGIN
    
    SELECT id_jucator 
    bulk collect into ids
        FROM jucator j, echipa e
        WHERE j.salariu >= 2500
        and j.id_echipa = e.id_echipa and id_volei = e.id_sport;
    
    IF ids is null THEN
        
        RAISE NO_DATA_FOUND;
    
    END IF;
    
    for i in ids.first..ids.last loop
    
        UPDATE jucator
            SET salariu = salariu * 0.95
            WHERE id_jucator = ids(i);

    end loop;
    
    EXCEPTION
    
    WHEN NO_DATA_FOUND THEN
          DBMS_OUTPUT.PUT_LINE('Nu exista jucatori de volei care sa corespunda cerintei');

end micsorare_salarii;
/

begin 
    micsorare_salarii;
end;
/

select * 
from jucator;

rollback;

--7 Defini?i un subprogram stocat care s? utilizeze un tip de cursor studiat. Apela?i subprogramul.
--Definiti o procedura cu ajutorul careia sa se calculeze ce procent din bugetul lunar al clubului sportiv este cheltuit de fiecare echipa pentru salarii. Se vor afisa numele echipei, numele antrenorului si procentul.

create or replace procedure proc (v_buget in number default 100000)
is 
  v_suma number(7);
  v_nume_echipa echipa.nume_echipa%type;
  v_nume_antrenor echipa.nume_antrenor%type;
  cursor crs is 
      select nume_echipa , nume_antrenor, sum(salariu) suma
      from jucator j, echipa e
      where j.id_echipa = e.id_echipa
      group by e.nume_echipa, e.nume_antrenor
      order by suma desc;
      
begin 
    open crs;
    loop
      fetch crs into v_nume_echipa, v_nume_antrenor, v_suma;
      exit when crs%notfound;
      DBMS_OUTPUT.PUT_LINE('Echipa '|| v_nume_echipa || ' antrenata de ' || v_nume_antrenor
                      || ' cheltuie ' || round(v_suma/v_buget *100, 2) || '% din bugetul total al clubului sportiv');
      end loop;
      close crs;
end proc;
/

begin 
    proc(150000);
end;
/


--8 Defini?i un subprogram stocat de tip func?ie care s? utilizeze 3 dintre tabelele definite. Trata?i toate excep?iile care pot ap?rea. Apela?i subprogramul astfel încât s? eviden?ia?i toate cazurile tratate.
--Sa se afiseze numele complexului cu cele mai multe antrenamente dintr-o zi data ca parametru.

create or replace function func (v_data date)
return varchar2 is
    nume_com complex.nume_complex%type;
    v_nr_antr number;
    nume_com2 complex.nume_complex%type;
    v_nr_antr2 number;
    exceptie exception;
    cursor crs is 
          select nume_complex, count(an.id_teren) nr_antr
          from teren t, complex com, antrenament an
          where an.id_teren = t.id_teren and com.id_complex = t.id_complex
          and to_char(cast(ora_inceput as date)) = to_char(v_data)
          group by nume_complex
          order by nr_antr desc;
        
  begin 
      open crs;
      fetch crs into nume_com, v_nr_antr;
      if crs%notfound then
          raise NO_DATA_FOUND;
      end if;
      
      fetch crs into nume_com2, v_nr_antr2;
      
      if crs%found then 
          if v_nr_antr = v_nr_antr2 then
            raise exceptie;
          end if;
      end if;
      close crs;
      return nume_com;
      
      exception
        when NO_DATA_FOUND then 
            RAISE_APPLICATION_ERROR(-20005, 'In aceasta zi nu s-a desfasurat niciun antrenament');
            
        WHEN exceptie THEN
            RAISE_APPLICATION_ERROR(-20006, 'Exista mai multe complexe in care s-a desfasurat acelasi numar de antrenamente');
end func;
/

begin 
    DBMS_OUTPUT.PUT_LINE('Complexul cu cele mai multe antrenamente din data de '|| to_date('25/12/2020','DD/MM/YYYY') ||' este '|| func(to_date('25/12/2020','DD/MM/YYYY')));
end;
/

begin 
    DBMS_OUTPUT.PUT_LINE('Complexul cu cele mai multe antrenamente din data de '|| to_date('02/12/2020','DD/MM/YYYY') ||' este '|| func(to_date('02/12/2020','DD/MM/YYYY')));
end;
/

begin 
    DBMS_OUTPUT.PUT_LINE('Complexul cu cele mai multe antrenamente din data de '|| to_date('05/12/2020','DD/MM/YYYY') ||' este '|| func(to_date('05/12/2020','DD/MM/YYYY')));
end;
/

--9 Defini?i un subprogram stocat de tip procedur? care s? utilizeze 5 dintre tabelele definite. Trata?i toate excep?iile care pot ap?rea. Apela?i subprogramul astfel încât s? eviden?ia?i toate cazurile tratate.
	--Sa se afiseze jucatorul cu cel mai mare salariu ce se antreneaza in perioada 08.12.2020-11.12.2020, intr-un complex al carui id e dat ca parametru al procedurii.

create or replace procedure proc_ex9 (v_nr_complex in complex.id_complex%type)
is 
  v_max_sal jucator.salariu%type;
  v_id_echipa echipa.id_echipa%type;
  v_nume_juc jucator.nume%type;
  v_nume_echipa echipa.nume_echipa%type;
  v_max_sal_fin number := 0;
  v_id_echipa_fin number := 0;
  contor number(4) :=0;
  exceptie exception;
  
  cursor crs is 
      select max(salariu),j.id_echipa
      from teren t, complex com, antrenament an, echipa e, jucator j
      where an.id_teren = t.id_teren and com.id_complex = t.id_complex
      and an.id_echipa = e.id_echipa and j.id_echipa = e.id_echipa 
      and extract( day from ora_inceput) <=11 and extract( day from ora_inceput) >=8
      and extract ( month from ora_inceput) = 12
      and extract( year from ora_inceput) = 2020
      and com.id_complex = v_nr_complex
      group by j.id_echipa;
begin 
    open crs;
    loop
        fetch crs into v_max_sal, v_id_echipa;
        exit when crs%notfound;
        contor := contor + 1;
        if v_max_sal > v_max_sal_fin then 
                v_max_sal_fin := v_max_sal;
                v_id_echipa_fin := v_id_echipa;
        else if v_max_sal = v_max_sal_fin then
              raise exceptie;
              end if;
        end if;
    end loop;
    close crs; 
    if contor = 0 then
            raise NO_DATA_FOUND;
    end if;
        
    select nume , nume_echipa 
    into v_nume_juc, v_nume_echipa
    from echipa e, jucator j
    where salariu = v_max_sal_fin and j.id_echipa = v_id_echipa_fin
    and e.id_echipa = v_id_echipa;  
        
    DBMS_OUTPUT.PUT_LINE( v_nume_juc || ' este jucatorul cel mai bine platit, de la echipa ' 
                        || v_nume_echipa );
        
    
exception 
          when NO_DATA_FOUND then 
              RAISE_APPLICATION_ERROR(-20010, 'In perioada 08.12.2020-11.12.2020 nicio echipa nu a desfasurat antrenamente la complexul cu id-ul ' || v_nr_complex);
          when exceptie then
              RAISE_APPLICATION_ERROR(-20011, 'Exista mai multi jucatori cu salariul maxim, in echipe diferite' );
          when TOO_MANY_ROWS then
              RAISE_APPLICATION_ERROR(-20012, 'Exista mai multi jucatori cu salariul maxim, in cadrul aceleiasi echipe' );
end proc_ex9;
/

declare 
      v_id_complex number(4) := &p_id_complex;
begin 
    proc_ex9(v_id_complex); -- se testeaza pt 1, 2, 3, 4
end;
/


--10 Defini?i un trigger de tip LMD la nivel de comand?. Declan?a?i trigger-ul.
--Definiti un declansator care sa nu permita planificarea unui antrenament in vacanta de iarna (1-22 ianuarie) . O planificare se face cu exact o saptamana inainte de ziua dorita.

create or replace trigger trig_ex10
  before insert or update on antrenament
begin 
  
  if(sysdate+7> to_date('2021/01/01', 'yyyy/mm/dd'))  or (sysdate+7 < to_date('2021/01/22', 'yyyy/mm/dd'))
      then
      raise_application_error(-20002, 'Nu se pot planifica antrenamente in vacanta');
  end if;
end;
/
insert into antrenament
values (17, 4, 2, TO_TIMESTAMP(sysdate+7, 'DD/MM/YYYY HH24:MI'),TO_TIMESTAMP(sysdate+7, 'DD/MM/YYYY HH24:MI'));

drop trigger trig_ex10;

--11 Defini?i un trigger de tip LMD la nivel de linie. Declan?a?i trigger-ul.
--Definiti un declansator prin care sa nu se permita adaugare unui jucator mai batran decat cel mai varstnic component al echipei respective.

CREATE OR REPLACE PACKAGE pachet
AS
    TYPE tip_rec IS RECORD
    ( echipa number(2),
      d_nastere jucator.data_nasterii%type
    );
      TYPE tip_ind IS TABLE OF tip_rec INDEX BY PLS_INTEGER;
        t tip_ind;
END;
/


CREATE OR REPLACE TRIGGER trig_comanda

BEFORE INSERT ON jucator

BEGIN

    select j.id_echipa, min(j.data_nasterii)
    bulk collect into pachet.t
    from jucator j, echipa e
    where j.id_echipa = e.id_echipa
    group by e.id_echipa;
    
end;
/

CREATE OR REPLACE TRIGGER trig_linie

BEFORE INSERT ON jucator
    
FOR EACH ROW

BEGIN

  FOR i in 1..pachet.t.last LOOP
      IF pachet.t(i).echipa = :NEW.id_echipa
          AND pachet.t(i).d_nastere >= :NEW.data_nasterii THEN
              RAISE_APPLICATION_ERROR(-20000, 'Jucatorul este prea batran');
      END IF;
  END LOOP;
END;
/

insert into jucator
values (23, 4 , 'Lebron ' , 'James', TO_DATE('26/11/1987', 'DD/MM/YYYY'), 8000);

drop trigger trig_linie;
drop trigger trig_comanda;

--12 Defini?i un trigger de tip LDD. Declan?a?i trigger-ul.
--Crea?i tabelul tabel_audit cu urm?toarele câmpuri:
-- utilizator (numele utilizatorului);
-- nume_bd (numele bazei de date);
-- eveniment (evenimentul sistem);
-- nume_obiect (numele obiectului);
-- data (data producerii evenimentului).
-- Defini?i un declan?ator care s? introduc? date în acest tabel dup? ce utilizatorul a folosit o comand? LDD (declan?ator sistem - la nivel de schem?).

CREATE TABLE tabel_audit
(utilizator VARCHAR2(20),
nume_bd VARCHAR2(50),
eveniment VARCHAR2(20),
nume_obiect VARCHAR2(30),
data DATE);

CREATE OR REPLACE TRIGGER trig3
  AFTER CREATE OR DROP OR ALTER ON SCHEMA
BEGIN
  INSERT INTO tabel_audit
  VALUES (SYS.LOGIN_USER, SYS.DATABASE_NAME, SYS.SYSEVENT,
    SYS.DICTIONARY_OBJ_NAME, SYSDATE);
END;
/

CREATE INDEX ind ON jucator(nume);
CREATE TABLE  tabel (col_1 number(2));
insert into tabel values(10);
DROP INDEX ind;
drop table tabel;
SELECT * FROM tabel_audit;
DROP TRIGGER trig3;
drop table tabel_audit;
