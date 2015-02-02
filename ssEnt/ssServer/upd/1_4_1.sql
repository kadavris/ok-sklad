update reports set fil=1 where repid=22;

create procedure sp_fix_rb
as
declare variable id integer^
begin
  for select delid from recyclebin
   where funid in (64, 65) into :id do
  begin
    delete from waybilllist where wbillid=:id^
    delete from recyclebin where delid=:id^
  end
end;
execute procedure sp_fix_rb;
drop procedure sp_fix_rb;

ALTER PROCEDURE SP_MAT_REMAIN_GET (
    MATID INTEGER,
    WID INTEGER,
    ONDATE TIMESTAMP)
RETURNS (
    POSID INTEGER,
    REMAIN NUMERIC(15,8),
    RSV NUMERIC(15,8),
    AVGPRICE NUMERIC(15,8),
    V_ONDATE TIMESTAMP,
    SERIAL VARCHAR(64),
    ORDERED NUMERIC(15,8))
AS
DECLARE VARIABLE V_ISSN INTEGER^
begin
  select serials from materials where matid=:MATID into :v_IsSN^
  if (v_IsSN is null) then v_IsSN = 0^
  for select pr.posid, pr.remain, pr.rsv, pr.avgprice, pr.ordered
    from posremains pr
     where pr.wid=:WID and pr.matid=:MATID
       and pr.ondate=
        (select max(ondate) from posremains
           where posid=pr.posid and ondate<=:ONDATE
             and matid=:MATID and wid=:WID)
     into :POSID, :REMAIN, :RSV, :AVGPRICE, :ORDERED do begin
    select ondate from waybilldet where posid=:POSID into :V_ONDATE^
    if (v_IsSN = 1) then begin
      select serialno from serials where posid=:POSID into :SERIAL^
      if (serial is null) then
        select s.serialno from extrel er, serials s
          where s.posid=er.extposid and er.intposid=:POSID
        into :SERIAL^
    end
    else SERIAL = null^
    suspend^
  end
end;

CREATE PROCEDURE SP_GET_LAST_PRICE (
    MATID INTEGER,
    KAID INTEGER,
    ONDATE TIMESTAMP)
RETURNS (
    CURRID INTEGER,
    ONVALUE NUMERIC(15,8),
    PRICE NUMERIC(15,8))
AS
DECLARE VARIABLE V_ONDATE TIMESTAMP^
begin
  price = 0^
  currid = 0^
  onvalue = 1^
  if (KAID > 0) then begin
    select max(wbd.ondate) from waybilldet wbd, waybilllist wbl
    where wbd.wbillid=wbl.wbillid
     and wbl.wtype=-1 and wbl.checked=1 and wbd.matid=:matid
     and wbd.ondate<=:ondate and wbl.kaid=:kaid
    into :v_ondate^
    if (v_ondate is not null) then begin
      select wbd.price, wbd.currid, wbd.onvalue
       from waybilldet wbd, waybilllist wbl
       where wbd.matid=:matid and wbd.wbillid=wbl.wbillid
        and wbl.wtype=-1 and wbl.checked=1 and wbl.kaid=:kaid
        and wbd.ondate=:v_ondate
       into :PRICE, :CURRID, :ONVALUE^
    end
  end
  else begin
    select max(wbd.ondate) from waybilldet wbd, waybilllist wbl
    where wbd.wbillid=wbl.wbillid
     and wbl.wtype=-1 and wbl.checked=1 and wbd.matid=:matid
     and wbd.ondate<=:ondate
    into :v_ondate^
    if (v_ondate is not null) then begin
      select wbd.price, wbd.currid, wbd.onvalue
       from waybilldet wbd, waybilllist wbl
       where wbd.matid=:matid and wbd.wbillid=wbl.wbillid
        and wbl.wtype=-1 and wbl.checked=1
        and wbd.ondate=:v_ondate
       into :PRICE, :CURRID, :ONVALUE^
    end
  end
  suspend^
end;

grant execute on procedure sp_get_last_price to users;
grant execute on procedure sp_get_last_price to public;

alter table payorder add add1 varchar(48);
alter table payorder add add2 varchar(48);
alter table payorder add add3 varchar(48);
alter table payorder add add4 varchar(48);
alter table payorder add add5 varchar(48);
alter table payorder add add6 varchar(48);
alter table payorder add add7 varchar(48);

