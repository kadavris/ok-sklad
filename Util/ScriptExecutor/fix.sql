drop trigger wmatturn_ad0;
CREATE TRIGGER WMATTURN_AD0 FOR WMATTURN
ACTIVE AFTER DELETE POSITION 0
AS
begin
  execute procedure sp_recalc_remains_ex(old.posid, old.matid, old.wid, old.ondate, 1)^
  delete from extrel where extrel.intposid=old.sourceid^
end;

CREATE PROCEDURE SP_GET_INPOS (
    POSID INTEGER)
RETURNS (
    PID INTEGER)
AS
DECLARE VARIABLE V_WTYPE INTEGER^
begin
  select first 1 wmt.posid, wbl.wtype
   from wmatturn wmt, waybilldet wbd, waybilllist wbl
     where wmt.sourceid=:POSID and wmt.posid<>sourceid
      and wmt.posid=wbd.posid and wbd.wbillid=wbl.wbillid
  into :PID, :v_wtype^
  if (v_wtype = 4)
    then select pid from sp_get_inpos(:pid) into :PID^
  suspend^
end;

CREATE PROCEDURE SP_FIX_MOVE 
AS
DECLARE VARIABLE V_POSID INTEGER^
DECLARE VARIABLE V_EXTPOSID INTEGER^
DECLARE VARIABLE V_TMP INTEGER^
begin
  for select wmt.sourceid
   from wmatturn wmt, waybilldet wbd, waybilllist wbl
   where wmt.sourceid=wbd.posid
    and wbd.wbillid=wbl.wbillid
    and wmt.posid<>wmt.sourceid
    and wbl.wtype=4
    and wmt.turntype<>2
   into :v_posid do
  begin
    v_tmp = null^
    select extposid
      from extrel where intposid=:v_posid
    into :v_tmp^
    if (v_tmp is null) then begin
      select pid from sp_get_inpos(:v_posid) into :v_extposid^
      if (v_extposid is not null) then
        insert into extrel (intposid, extposid) values (:v_posid, :v_extposid)^
    end
  end
end;

execute procedure sp_fix_move;
drop procedure sp_fix_move;
drop procedure sp_get_inpos;
