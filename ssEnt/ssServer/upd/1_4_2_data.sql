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
