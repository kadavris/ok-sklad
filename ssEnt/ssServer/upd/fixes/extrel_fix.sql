CREATE PROCEDURE z_EXTREL_FIX 
as
declare variable c integer;
declare variable i integer;
declare variable e integer;
begin
  for select distinct intposid, extposid from extrel
    into :i, :e
  do begin
    for select count(*) from extrel where extposid=:e and intposid=:i
        into :c
    do begin
      if (c>1) then begin
        delete from extrel where extposid=:e and intposid=:i;
        insert into extrel (extposid,intposid) values (:e,:i);
      end
    end
  end
end^

GRANT SELECT ON EXTREL TO PROCEDURE z_EXTREL_FIX;

GRANT EXECUTE ON PROCEDURE z_EXTREL_FIX TO SYSDBA;