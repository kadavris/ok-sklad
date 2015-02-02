CREATE PROCEDURE FIX_WH 
AS
DECLARE VARIABLE V_WBILLID INTEGER^
DECLARE VARIABLE V_MATID INTEGER^
DECLARE VARIABLE V_WID INTEGER^
DECLARE VARIABLE V_POSID INTEGER^
DECLARE VARIABLE V_SOURCEID INTEGER^
DECLARE VARIABLE V_AMOUNT DOUBLE PRECISION^
DECLARE VARIABLE V_WMT_MATID INTEGER^
DECLARE VARIABLE V_WMT_POSID INTEGER^
DECLARE VARIABLE V_WMT_WID INTEGER^
begin
  for select wbillid from waybilllist
   where wtype in (-1) and deleted=0
   union all
   select wbillid from waybilllist
   where wtype=2 and deleted=0 and checked=0
   into :v_wbillid do
  begin
    for select distinct wbd.posid, wbd.matid, wbd.amount, wbd.wid
     from waybilldet wbd, wmatturn wmt
       where wbillid=:v_wbillid and wmt.sourceid=wbd.posid
        and formatfloat(wbd.amount, -4) <
         (select formatfloat(sum(amount), -4) from wmatturn where sourceid=wbd.posid)
     into :v_posid, :v_matid, :v_amount, :v_wid do
    begin
      for select posid, matid, wid
        from wmatturn where sourceid=:v_posid
        into :v_wmt_posid, :v_wmt_matid, :v_wmt_wid do
      begin
        if ((v_wmt_matid <> v_matid) or (v_wid <> v_wmt_wid)) then begin
          delete from wmatturn where sourceid=:V_POSID and wid=:V_WMT_WID
            and matid=:V_WMT_MATID and posid=:V_WMT_POSID^
        end
      end
    end
  end
end;

execute procedure fix_wh;
drop procedure fix_wh;