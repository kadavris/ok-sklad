CREATE PROCEDURE SP_ACCOUTDET_FIX (
    WBILLID INTEGER)
AS
declare variable v_posid integer^
declare variable v_posid2 integer^
declare variable v_srcid integer^
declare variable v_amount numeric(15,8)^
declare variable v_amount2 numeric(15,8)^
begin
  for select posid, amount from waybilldet
   where wbillid=:wbillid into :v_posid2, :v_amount2 do
  begin
    select accposid from accoutposrel where posid=:v_posid2
     into :v_posid^
    select first 1 sourceid from wmatturn where sourceid=:v_posid2
     into :v_srcid^
    if (v_srcid is null) then v_amount = 0^
     else v_amount = :v_amount2^
    update accoutdet set rsvamount=rsvamount-:v_amount
      where posid=:v_posid^
  end
end;

grant execute on procedure sp_accoutdet_fix to public;
grant execute on procedure sp_accoutdet_fix to users;

DROP TRIGGER WAYBILLDET_BD0;

update functions set logging=1 where funid in (64,65);

ALTER TRIGGER WAYBILLLIST_AI
ACTIVE AFTER INSERT POSITION 0
AS
declare variable funid integer^
declare variable v_kaname varchar(128)^
BEGIN
  if (NEW.kaid is null) then v_kaname = ''^
  else select name from kagent where kaid=NEW.kaid
   into :v_kaname^
  funid = 0^
  if (NEW.wtype = 1) then funid = 21^ else
  if (NEW.wtype = -1) then funid = 23^ else
  if (NEW.wtype = 4) then funid = 36^ else
  if (NEW.wtype = -5) then funid = 41^ else
  if (NEW.wtype = 5) then funid = 44^ else
  if (NEW.wtype = -6) then funid = 43^ else
  if (NEW.wtype = 6) then funid = 42^ else
  if (NEW.wtype = 16) then funid = 65^ else
  if (NEW.wtype = -16) then funid = 64^ else
  if (NEW.wtype = 2) then funid = 30^
  if (funid = 0) then exit^
  insert into operlog (username, opcode, ondate, tabid, id, databefore, dataafter, funid, docnum)
    values (CURRENT_USER, 'I', current_timestamp, 24, NEW.wbillid, null,
     NEW.num||'^'||extract(day from NEW.ondate)||'.'||extract(month from NEW.ondate)||'.'||extract(year from NEW.ondate)||' '||extract(hour from NEW.ondate)||':'||extract(minute from NEW.ondate)||':'||extract(second from NEW.ondate)||'^'||cast(NEW.wtype as varchar(3))||'^'||cast(NEW.summall as varchar(24))||'^'||:v_kaname, :funid, NEW.num)^
END;

ALTER TRIGGER WAYBILLLIST_AU
ACTIVE AFTER UPDATE POSITION 0
AS
declare variable funid integer^
declare variable v_kaname varchar(128)^
BEGIN
  if (NEW.kaid is null) then v_kaname = ''^
  else select name from kagent where kaid=NEW.kaid
   into :v_kaname^
  funid = 0^
  if (NEW.wtype = 1) then funid = 21^ else
  if (NEW.wtype = -1) then funid = 23^ else
  if (NEW.wtype = 4) then funid = 36^ else
  if (NEW.wtype = -5) then funid = 41^ else
  if (NEW.wtype = 5) then funid = 44^ else
  if (NEW.wtype = -6) then funid = 43^ else
  if (NEW.wtype = 6) then funid = 42^ else
  if (NEW.wtype = 16) then funid = 65^ else
  if (NEW.wtype = -16) then funid = 64^ else
  if (NEW.wtype = 2) then funid = 30^
  if (funid = 0) then Exit^
  insert into operlog (username, opcode, ondate, tabid, id, databefore, dataafter, funid, docnum)
    values (CURRENT_USER, 'U', current_timestamp, 24, NEW.wbillid,
     OLD.num||'^'||extract(day from OLD.ondate)||'.'||extract(month from OLD.ondate)||'.'||extract(year from OLD.ondate)||' '||extract(hour from OLD.ondate)||':'||extract(minute from OLD.ondate)||':'||extract(second from OLD.ondate)||'^'||cast(OLD.wtype as varchar(3))||'^'||cast(OLD.summall as varchar(20))||'^'||:v_kaname,
     NEW.num||'^'||extract(day from NEW.ondate)||'.'||extract(month from NEW.ondate)||'.'||extract(year from NEW.ondate)||' '||extract(hour from NEW.ondate)||':'||extract(minute from NEW.ondate)||':'||extract(second from NEW.ondate)||'^'||cast(NEW.wtype as varchar(3))||'^'||cast(NEW.summall as varchar(20))||'^'||:v_kaname, :funid, NEW.num)^
END;

ALTER TRIGGER WAYBILLLIST_AD
ACTIVE AFTER DELETE POSITION 0
AS
declare variable funid integer^
declare variable v_kaname varchar(128)^
BEGIN
  if (OLD.kaid is null) then v_kaname = ''^
  else select name from kagent where kaid=OLD.kaid
   into :v_kaname^
  funid = 0^
  if (OLD.wtype = 1) then funid = 21^ else
  if (OLD.wtype = -1) then funid = 23^ else
  if (OLD.wtype = -5) then funid = 41^ else
  if (OLD.wtype = 5) then funid = 44^ else
  if (OLD.wtype = -6) then funid = 43^ else
  if (OLD.wtype = 6) then funid = 42^ else
  if (OLD.wtype = 4) then funid = 36^ else
  if (OLD.wtype = 16) then funid = 65^ else
  if (OLD.wtype = -16) then funid = 64^ else
  if (OLD.wtype = 2) then funid = 30^
  if (funid = 0) then Exit^
  insert into operlog (username, opcode, ondate, tabid, id, databefore, dataafter, funid, docnum)
    values (CURRENT_USER, 'D', current_timestamp, 24, OLD.wbillid,
     OLD.num||'^'||extract(day from OLD.ondate)||'.'||extract(month from OLD.ondate)||'.'||extract(year from OLD.ondate)||' '||extract(hour from OLD.ondate)||':'||extract(minute from OLD.ondate)||':'||extract(second from OLD.ondate)||'^'||cast(OLD.wtype as varchar(3))||'^'||cast(OLD.summall as varchar(24))||'^'||:v_kaname,
     null, :funid, OLD.num)^
END;

ALTER PROCEDURE SP_WMAT_GET (
    GRPID INTEGER,
    WID INTEGER,
    KAID INTEGER,
    ONDATE TIMESTAMP,
    GETEMPTY INTEGER,
    WH VARCHAR(1024),
    ALLWH INTEGER,
    SHOWALLMATS INTEGER,
    GRP VARCHAR(1024))
RETURNS (
    MATID INTEGER,
    REMAIN NUMERIC(15,8),
    RSV NUMERIC(15,8),
    MATNAME VARCHAR(255),
    MSRNAME VARCHAR(10),
    ARTIKUL VARCHAR(255),
    AVGPRICE NUMERIC(15,8),
    GRPNAME VARCHAR(64),
    NUM INTEGER,
    BARCODE VARCHAR(64),
    COUNTRY VARCHAR(128),
    PRODUCER VARCHAR(255),
    MINRESERV NUMERIC(15,8),
    ORDERED NUMERIC(15,8),
    ORSV NUMERIC(15,8),
    ISSERIAL INTEGER,
    PRICES VARCHAR(255))
AS
DECLARE VARIABLE V_REMAIN NUMERIC(15,8)^
DECLARE VARIABLE V_MATID INTEGER^
DECLARE VARIABLE V_ONDATE TIMESTAMP^
DECLARE VARIABLE V_MAXDATE TIMESTAMP^
DECLARE VARIABLE V_POSID INTEGER^
DECLARE VARIABLE V_TMP_REMAIN DOUBLE PRECISION^
DECLARE VARIABLE V_TMP_RSV DOUBLE PRECISION^
DECLARE VARIABLE V_TMP_ORDERED DOUBLE PRECISION^
DECLARE VARIABLE V_TMP_AVGPRICE DOUBLE PRECISION^
DECLARE VARIABLE V_SUM DOUBLE PRECISION^
DECLARE VARIABLE V_KAID INTEGER^
DECLARE VARIABLE V_WTYPE INTEGER^
DECLARE VARIABLE V_WID INTEGER^
DECLARE VARIABLE V_REMAIN_EX DOUBLE PRECISION^
DECLARE VARIABLE V_EXTRATYPE INTEGER^
DECLARE VARIABLE V_PTYPEID INTEGER^
DECLARE VARIABLE V_CURRNAME VARCHAR(24)^
DECLARE VARIABLE V_ONVALUE NUMERIC(15,8)^
DECLARE VARIABLE V_SQL VARCHAR(2048)^
begin
  matid = null^
  rsv = null^
  remain = null^
  ordered = null^
  orsv = null^
  matname = null^
  msrname = null^
  artikul = null^
  avgprice = null^
  if ((wid > 0) and (valueinstr(:wh, :wid) <> 1)) then exit^

  V_SQL = 'select m.num, m.matid, m.name, m.artikul, ms.shortname, mg.name, m.barcode,
    c.name, m.producer, cast(m.minreserv as numeric(15,8)), m.serials
   from materials m
    join measures ms on ms.mid=m.mid
    join matgroup mg on m.grpid=mg.grpid
    left outer join countries c on m.cid=c.cid
   where m.archived=0'^
  if (GRP <> '') then V_SQL = V_SQL||' and m.grpid in ('||GRP||')'^ else
  if (GRPID > 0) then V_SQL = V_SQL||' and m.grpid='||cast(GRPID as VARCHAR(10))^
  V_SQL = V_SQL||' order by m.num'^
  for execute statement V_SQL
  into :num, :matid, :matname, :artikul, :msrname, :grpname, :barcode,
       :country, :producer, :minreserv, :isserial do
  begin
    remain = 0^
    ordered = 0^
    orsv = 0^
    v_remain_ex = 0^
    avgprice = 0^
    rsv = 0^
    v_sum = 0^
    v_ondate = null^
    if ((wid = 0) and (kaid = 0)) then begin
      if (allwh = 1) then begin
        select mr.remain, mr.rsv, mr.avgprice, mr.ordered, mr.orsv
          from matremains mr
          where mr.ondate=
           (select max(ondate) from matremains
            where ondate<=:ondate and matid=mr.matid)
           and mr.matid=:matid
        into :remain, :rsv, :avgprice, :ordered, :orsv^
      end
      else begin
        v_posid = 0^
        v_maxdate = null^
        v_ondate = null^
        for select posid, max(ondate) from posremains where matid=:matid and ondate<=:ondate
         group by posid
         into :v_posid, :v_maxdate do
        begin
         v_tmp_remain = null^
         v_tmp_rsv = 0^
         v_tmp_ordered = 0^
         v_tmp_avgprice = 0^
         select pr.remain, pr.rsv, pr.avgprice, pr.wid, coalesce(pr.ordered, 0)
           from posremains pr
           where pr.posid=:v_posid
             and pr.ondate=:v_maxdate
           into :v_tmp_remain, :v_tmp_rsv, :v_tmp_avgprice, :v_wid, :v_tmp_ordered^
         if (valueinstr(:wh, :v_wid) = 1) then begin
           if (v_tmp_remain is not null) then begin
             remain = remain + v_tmp_remain^
             v_sum = v_sum + v_tmp_remain * v_tmp_avgprice^
             v_ondate = v_maxdate^
           end
           ordered = ordered + v_tmp_ordered^
           if (v_tmp_ordered > 0)
             then orsv = orsv + v_tmp_rsv^
             else rsv = rsv + v_tmp_rsv^
         end
         if (remain <> 0) then avgprice = v_sum / remain^
        end
      end
    end
    else if ((wid <> 0) and (kaid = 0)) then begin
      v_posid = 0^
      v_maxdate = null^
      v_ondate = null^
      for select pr.posid, pr.remain, pr.rsv, pr.avgprice, pr.ordered
       from posremains pr
       where matid=:matid and wid=:wid and ondate=
        (select max(ondate) from posremains where posid=pr.posid and ondate<=:ondate and wid=:wid)
        into :v_posid, :v_tmp_remain, :V_TMP_RSV, :V_TMP_AVGPRICE, :v_tmp_ordered do
      begin
        if (v_tmp_remain is not null) then begin
          remain = remain + v_tmp_remain^
          v_sum = v_sum + v_tmp_remain * v_tmp_avgprice^
          v_ondate = v_maxdate^
        end
        ordered = ordered + v_tmp_ordered^
        if (v_tmp_ordered > 0)
          then orsv = orsv + v_tmp_rsv^
          else rsv = rsv + v_tmp_rsv^
        if (remain <> 0) then avgprice = v_sum / remain^
      end
    end
    else if (kaid <> 0) then begin
      v_posid = 0^
      v_maxdate = null^
      for select posid, wid, max(ondate) from posremains where matid=:matid and ondate<=:ondate
       group by posid, wid
        into :v_posid, :v_wid, :v_maxdate do begin
       v_tmp_remain = 0^
       v_tmp_rsv = 0^
       v_tmp_ordered = 0^
       v_tmp_avgprice = 0^
       v_wtype = 0^
       v_kaid = null^
       select wbl.wtype, wbl.kaid
         from waybilldet wbd, waybilllist wbl
         where wbd.posid=:v_posid and wbd.wbillid=wbl.wbillid
       into :v_wtype, :v_kaid^
       if (v_wtype in (4, 6)) then begin
         select first 1 wbl.kaid from waybilllist wbl, waybilldet wbd, extrel er
           where wbl.wbillid=wbd.wbillid and wbd.posid=er.extposid and er.intposid=:v_posid
         into :v_kaid^
       end
       if (v_kaid is null) then v_ondate = null^
       if ((v_kaid = kaid) and ((wid = 0) or (wid = v_wid))) then begin
         select pr.remain, pr.rsv, pr.avgprice, coalesce(pr.ordered, 0)
           from posremains pr
           where pr.posid=:v_posid
             and pr.ondate=:v_maxdate
           into :v_tmp_remain, :v_tmp_rsv, :v_tmp_avgprice, :v_tmp_ordered^
         if (v_tmp_remain is not null) then begin
           remain = remain + v_tmp_remain^
           v_sum = v_sum + (v_tmp_remain * v_tmp_avgprice)^
         end
         ordered = ordered + v_tmp_ordered^
         if (v_tmp_ordered > 0)
           then orsv = orsv + v_tmp_rsv^
           else rsv = rsv + v_tmp_rsv^
       end
      if (remain <> 0) then avgprice = v_sum / remain^
     end
    end

    PRICES = ''^
    for select mp.extratype, mp.onvalue, c.shortname, mp.ptypeid
      from matprices mp, currency c
      where mp.matid=:matid and c.currid=mp.currid
       into :v_extratype, :v_onvalue, :v_currname, :v_ptypeid do
    begin
      if (v_extratype = 0)
        then PRICES = PRICES||cast(v_ptypeid as varchar(10))||'^'||cast(v_onvalue as varchar(24))||'^'||'^'^
        else PRICES = PRICES||cast(v_ptypeid as varchar(10))||'^'||cast(v_onvalue as varchar(24))||'^'||v_currname||'^'^
    end

    if ((remain > 0) or (ordered > 0) or ((getempty = 1) and (v_ondate is not null)) or (showallmats = 1))
      then suspend^
  end
end;