ALTER TABLE WAYBILLDET ADD BASEPRICE NUMERIC(15,8);
ALTER TABLE WAYBILLSVC ADD SVCTOPRICE INTEGER;









ALTER PROCEDURE SP_WMAT_GET_BY_WHLIST (
    IN_MATID INTEGER,
    ONDATE TIMESTAMP,
    WH VARCHAR(1000))
RETURNS (
    MATID INTEGER,
    GRPID INTEGER,
    REMAIN NUMERIC(15,8),
    RSV NUMERIC(15,8),
    MATNAME VARCHAR(128),
    MSRNAME VARCHAR(10),
    ARTIKUL VARCHAR(128),
    AVGPRICE NUMERIC(15,8),
    GRPNAME VARCHAR(64),
    NUM INTEGER)
AS
DECLARE VARIABLE V_REMAIN DOUBLE PRECISION^
DECLARE VARIABLE V_MATID INTEGER^
DECLARE VARIABLE V_ONDATE TIMESTAMP^
DECLARE VARIABLE V_MAXDATE TIMESTAMP^
DECLARE VARIABLE V_POSID INTEGER^
DECLARE VARIABLE V_TMP_REMAIN DOUBLE PRECISION^
DECLARE VARIABLE V_TMP_RSV DOUBLE PRECISION^
DECLARE VARIABLE V_TMP_AVGPRICE DOUBLE PRECISION^
DECLARE VARIABLE V_SUM DOUBLE PRECISION^
DECLARE VARIABLE V_KAID INTEGER^
DECLARE VARIABLE V_WTYPE INTEGER^
DECLARE VARIABLE V_WID INTEGER^
DECLARE VARIABLE V_SQL VARCHAR(2000)^
DECLARE VARIABLE V_SQLEX VARCHAR(2000)^
begin
  matid = null^
  rsv = null^
  remain = null^
  matname = null^
  msrname = null^
  artikul = null^
  avgprice = null^
  grpid = null^
  grpname = null^

  V_SQL = 'select m.num, m.matid, m.name, m.artikul, ms.shortname, mg.name, mg.grpid'||
          ' from materials m, measures ms, matgroup mg'||
          ' where mg.grpid=m.grpid and m.mid=ms.mid and m.archived=0 '^
  if (IN_MATID <> 0) then V_SQL = V_SQL||' and m.matid='||cast(IN_MATID as VARCHAR(20))^
  for execute statement V_SQL
  into :num, :matid, :matname, :artikul, :msrname, :grpname, :grpid do begin
    remain = 0^
    avgprice = 0^
    rsv = 0^
    v_sum = 0^
    v_ondate = null^

    v_posid = 0^
    v_maxdate = null^
    v_ondate = null^

    V_SQLEX = 'select posid, max(ondate) from posremains where matid='||
              cast(MATID as VARCHAR(20))||' and ondate<='''||
              cast(ONDATE as varchar(24))||''' and wid in ('||WH||')'||
              'group by posid'^
    for execute statement V_SQLEX
      into :v_posid, :v_maxdate do begin
     v_tmp_remain = null^
     v_tmp_rsv = 0^
     v_tmp_avgprice = 0^
     select pr.remain, pr.rsv, pr.avgprice
       from posremains pr
       where pr.posid=:v_posid
         and pr.ondate=:v_maxdate
       into :v_tmp_remain, :v_tmp_rsv, :v_tmp_avgprice^
     if (v_tmp_remain is not null) then begin
       remain = remain + v_tmp_remain^
       v_sum = v_sum + (v_tmp_remain * v_tmp_avgprice)^
       v_ondate = v_maxdate^
     end
     rsv = rsv + v_tmp_rsv^
    end
    remain = formatfloat(remain, -4)^
    if (remain <> 0) then avgprice = v_sum / remain^
    if ((remain > 0) and (v_ondate is not null)) then suspend^
  end
end;






ALTER PROCEDURE SP_WBD_GET_OUT_P2 (
    AWBILLID INTEGER)
RETURNS (
    NUM INTEGER,
    POSID INTEGER,
    WBILLID INTEGER,
    MATID INTEGER,
    WID INTEGER,
    AMOUNT NUMERIC(15,8),
    PRICE NUMERIC(15,8),
    PRICE2 NUMERIC(15,8),
    DISCOUNT NUMERIC(15,8),
    NDS NUMERIC(15,8),
    CURRID INTEGER,
    ONDATE TIMESTAMP,
    PTYPEID INTEGER,
    CHECKED INTEGER,
    MATNAME VARCHAR(255),
    MSRNAME VARCHAR(10),
    WHNAME VARCHAR(128),
    ARTIKUL VARCHAR(255),
    CURRNAME VARCHAR(10),
    COUNTRY VARCHAR(128),
    ONVALUE NUMERIC(15,8),
    POSTYPE INTEGER,
    NORM NUMERIC(15,8),
    GTD VARCHAR(64),
    TAX VARCHAR(255),
    SN VARCHAR(1000),
    WPERIOD INTEGER,
    WPERIODTYPE INTEGER,
    PRODUCER VARCHAR(255),
    MWEIGHT NUMERIC(15,8),
    MSIZE NUMERIC(15,8),
    GRPNAME VARCHAR(128))
AS
DECLARE VARIABLE V_TAXID INTEGER^
DECLARE VARIABLE V_ONVALUE NUMERIC(15,8)^
DECLARE VARIABLE V_SN INTEGER^
DECLARE VARIABLE SERIALNO VARCHAR(64)^
begin
  for select wbd.num, wbd.posid, wbd.wbillid, wbd.matid, wbd.wid, wbd.amount,
   wbd.price, wbd.discount, wbd.nds, wbd.currid, wbd.ondate, wbd.ptypeid,
   wbd.checked, mat.name, msr.shortname, wh.name, mat.artikul, c.name,
   curr.shortname, wbd.onvalue, wbd.price, cast(0 as integer),
   cast(1 as NUMERIC(15,8)), wbdap.gtd, mat.serials, wbdap.warrantyperiod,
   wbdap.warrantyperiodtype, wbdap.producer, cast(mat.weight as numeric(15,8)),
   cast(mat.msize as numeric(15,8)), cast(mg.name as varchar(128))
  from WAYBILLDET wbd
   join MATERIALS mat on mat.matid=wbd.matid
   join matgroup mg on mg.grpid=mat.grpid
   join MEASURES msr on msr.mid=mat.mid
   join WAREHOUSE wh on wh.wid=wbd.wid
   join currency curr on curr.currid=wbd.currid
   left join countries c on c.cid=mat.cid
   left join waybilldetaddprops wbdap on wbdap.posid=wbd.posid
  where wbd.WBILLID=:AWBILLID
      union all
  select wbs.num, -wbs.posid as posid, wbs.wbillid, s.svcid as matid,
   cast(0 as integer),
   case
    when s.isnormed=0 then wbs.amount
    when s.isnormed=1 then wbs.amount*wbs.norm
   end, wbs.price, wbs.discount, wbs.nds, wbs.currid, wbl.ondate,
   cast(0 as integer), 0, cast(s.name as varchar(255)), ms.shortname, cast('' as varchar(64)),
   cast(s.artikul as varchar(255)), cast('' as varchar(128)),
   c.shortname,
   case when coalesce(wbl.onvalue, 0) = 0 then 1
    else cast(wbl.onvalue as numeric(15,8))
   end,
   wbs.price as price2, 1, cast(wbs.norm as numeric(15,8)), cast('' as varchar(64)), 0,
   cast(null as integer), cast(null as integer), cast('' as varchar(255)),
   cast(0 as numeric(15,8)), cast(0 as numeric(15,8)), cast(sg.name as varchar(128))
  from waybillsvc wbs
   join services s on s.svcid=wbs.svcid
   join services sg on s.pid=sg.svcid
   join measures ms on ms.mid=s.mid
   join waybilllist wbl on wbl.wbillid=wbs.wbillid
   join currency c on c.currid=wbs.currid
  where wbs.wbillid=:awbillid
  order by 1
   into :NUM, :POSID, :WBILLID, :MATID, :WID, :AMOUNT, :PRICE, :DISCOUNT, :NDS,
        :CURRID, :ONDATE, :PTYPEID, :CHECKED, :MATNAME, :MSRNAME, :WHNAME, :ARTIKUL,
        :COUNTRY, :CURRNAME, :ONVALUE, :PRICE2, :POSTYPE, :NORM, :GTD, :V_SN,
        :WPERIOD, :WPERIODTYPE, :PRODUCER, :MWEIGHT, :MSIZE, :GRPNAME do
  begin
    tax = ''^
    for select taxid, onvalue
      from waybilldettaxes where posid=:POSID
     into :v_taxid, :v_onvalue do
    begin
      tax = tax||cast(v_taxid as varchar(10))||','||cast(formatfloat(v_onvalue, -3) as varchar(10))||'^'^
    end

    SN = ''^
    if (V_SN = 1) then begin
      for select s.serialno
        from wmatturn wmt, serials s
        where wmt.sourceid=:POSID and s.posid=wmt.posid
       into :SERIALNO do
      begin
        SN = SN||:SERIALNO||', '^
      end
    end

    suspend^
  end
end;









ALTER PROCEDURE SP_WBD_GET_OUT (
    AWBILLID INTEGER)
RETURNS (
    NUM INTEGER,
    POSID INTEGER,
    WBILLID INTEGER,
    MATID INTEGER,
    WID INTEGER,
    AMOUNT NUMERIC(15,8),
    PRICE NUMERIC(15,8),
    DISCOUNT NUMERIC(15,8),
    NDS NUMERIC(15,8),
    CURRID INTEGER,
    ONDATE TIMESTAMP,
    PTYPEID INTEGER,
    CHECKED INTEGER,
    MATNAME VARCHAR(255),
    MSRNAME VARCHAR(10),
    WHNAME VARCHAR(128),
    ARTIKUL VARCHAR(255),
    CURRNAME VARCHAR(10),
    ONVALUE NUMERIC(15,8),
    POSTYPE INTEGER,
    NORM NUMERIC(15,8),
    PRODUCER VARCHAR(128),
    GTD VARCHAR(64),
    CERTNUM VARCHAR(64),
    CERTDATE TIMESTAMP,
    TAX VARCHAR(255),
    SN VARCHAR(1000),
    BARCODE VARCHAR(64),
    WPERIOD INTEGER,
    WPERIODTYPE INTEGER,
    GRPID INTEGER,
    COUNTRY VARCHAR(128),
    CARDID INTEGER,
    HOLDER VARCHAR(64),
    CARDNUM VARCHAR(24),
    RSV INTEGER)
AS
DECLARE VARIABLE V_TAXID INTEGER^
DECLARE VARIABLE V_ONVALUE NUMERIC(15,8)^
DECLARE VARIABLE V_SN INTEGER^
DECLARE VARIABLE SERIALNO VARCHAR(64)^
DECLARE VARIABLE V_RSV NUMERIC(15,8)^
begin
  for select wbd.num, wbd.posid, wbd.wbillid, wbd.matid, wbd.wid, wbd.amount, wbd.price,
   wbd.discount, wbd.nds, wbd.currid, wbd.ondate, wbd.ptypeid, wbd.checked,
   mat.name, msr.shortname, wh.name, mat.artikul, curr.shortname, cast(wbd.onvalue as numeric(15,8)),
   cast(0 as integer) as postype, cast(0 as NUMERIC(15,8)) as norm,
   wbdap.producer, wbdap.gtd, wbdap.certnum, wbdap.certdate, mat.serials, mat.barcode,
   wbdap.warrantyperiod, wbdap.warrantyperiodtype, mat.grpid, c.name,
   wbdap.cardid, cast(dc.num as varchar(24)), dch.name
  from WAYBILLDET wbd
   join MATERIALS mat on mat.matid=wbd.matid
   join MEASURES msr on msr.mid=mat.mid
   join WAREHOUSE wh on wh.wid=wbd.wid
   left outer join currency curr on curr.currid=wbd.currid
   left outer join waybilldetaddprops wbdap on wbdap.posid=wbd.posid
   left outer join countries c on c.cid=mat.cid
   left outer join disccards dc on wbdap.cardid=dc.cardid
   left outer join kagent dch on dch.kaid=dc.kaid
  where wbd.WBILLID=:AWBILLID
   union all
  select wbs.num, -wbs.posid, wbl.wbillid, s.svcid, cast(0 as integer), wbs.amount, wbs.price,
    wbs.discount, wbs.nds, wbs.currid, wbl.ondate, cast(0 as integer), 0, cast(s.name as varchar(255)),
    ms.shortname, cast('' as varchar(64)), cast(s.artikul as varchar(255)),
    c.shortname,
    case when coalesce(wbl.onvalue, 0)=0 then 1
     else cast(wbl.onvalue as numeric(15,8))
    end, 1, cast(wbs.norm as numeric(15,8)),
    cast('' as varchar(255)),
    cast('' as varchar(64)), cast('' as varchar(64)), cast(null as timestamp), 0,
    cast('' as varchar(64)), cast(null as integer), cast(null as integer), 0,
    cast('' as varchar(128)), cast(null as integer), cast('' as varchar(24)),
    cast('' as varchar(64))
  from waybillsvc wbs
   join services s on s.svcid=wbs.svcid
   join measures ms on ms.mid=s.mid
   join waybilllist wbl on wbl.wbillid=wbs.wbillid
   join currency c on c.currid=wbs.currid
  where wbs.wbillid=:awbillid
  order by 1
   into :NUM, :POSID, :WBILLID, :MATID, :WID, :AMOUNT, :PRICE, :DISCOUNT, :NDS,
        :CURRID, :ONDATE, :PTYPEID, :CHECKED, :MATNAME, :MSRNAME, :WHNAME, :ARTIKUL,
        :CURRNAME, :ONVALUE, :POSTYPE, :NORM, :PRODUCER, :GTD, :CERTNUM, :CERTDATE,
        :V_SN, :BARCODE, :WPERIOD, :WPERIODTYPE, :GRPID, :COUNTRY, :CARDID, :CARDNUM,
        :HOLDER
  do begin
    RSV = 0^
    V_RSV = 0^
    if (POSID > 0) then begin
      select sum(amount) from wmatturn where sourceid=:POSID and turntype=2
        into :V_RSV^
      if (V_RSV > 0) then RSV = 1^
    end

    tax = ''^
    for select taxid, onvalue
      from waybilldettaxes where posid=:POSID
     into :v_taxid, :v_onvalue do
    begin
      tax = tax||cast(v_taxid as varchar(10))||','||cast(formatfloat(v_onvalue, -3) as varchar(10))||'^'^
    end

    SN = ''^
    if (V_SN = 1) then begin
      for select s.serialno
        from wmatturn wmt, serials s
        where wmt.sourceid=:POSID and s.posid=wmt.posid
       into :SERIALNO do
      begin
        SN = SN||:SERIALNO||', '^
      end
    end

    suspend^
  end
end;








ALTER PROCEDURE SP_PLREF 
RETURNS (
  ISGROUP INTEGER,
  ID INTEGER,
  PID INTEGER,
  NAME VARCHAR(255),
  ART VARCHAR(255),
  MSRNAME VARCHAR(6),
  REMAIN NUMERIC(15,8),
  PRICE NUMERIC(15,8)
)
AS
DECLARE VARIABLE TMPREM NUMERIC(15,5)^
DECLARE VARIABLE TMPPRICE NUMERIC(15,6)^
DECLARE VARIABLE V_ONDATE DATE^
BEGIN
 for select CAST(0 as integer) as IsGroup, mats.matid, -1 * mats.grpid, mats.name, mats.artikul, msr.shortname
   from materials mats, measures msr
   where mats.deleted = 0 and msr.mid = mats.mid and mats.archived = 0
   into :ISGROUP, :ID, :PID, :NAME, :ART, :MSRNAME
 do begin
   TMPREM = null^
   TMPPRICE = null^

   select max(ondate) from matremains where matid = :ID
     into :V_ONDATE^

   select mr.remain, mr.avgprice
     from matremains mr
     where mr.matid = :ID and mr.ondate = :V_ONDATE
     into :TMPREM, :TMPPRICE^

   REMAIN = null^
   PRICE = null^
   if (not TMPREM is null) then REMAIN = TMPREM^
   if (not TMPPRICE is null) then PRICE = TMPPRICE^
   suspend^
 end

 for select CAST(1 as integer) as IsGroup, -1 * mg.grpid as id, -1 * mg.pid as pid,
       CAST(mg.name as varchar(128)) as name, CAST('' as varchar(128)) as art,
       CAST('' as varchar(6)) as msrname, CAST(null as numeric(18,5)) as remain,
       CAST(null as numeric(18,6)) as price
   from matgroup mg
   where mg.deleted = 0
   into :ISGROUP, :ID, :PID, :NAME, :ART, :MSRNAME, :REMAIN, :PRICE
 do begin
   suspend^
 end
END;







ALTER TABLE MEASURES ADD CODE VARCHAR(14);
ALTER TABLE DISCCARDS ADD STARTSALDO NUMERIC(15,8);









ALTER PROCEDURE SP_DC_RECALC (
    CARDID INTEGER)
AS
DECLARE VARIABLE V_POSCOUNT INTEGER^
DECLARE VARIABLE V_TOTAL DOUBLE PRECISION^
DECLARE VARIABLE V_TOTALRET DOUBLE PRECISION^
DECLARE VARIABLE V_STARTSALDO DOUBLE PRECISION^
begin
  select startsaldo from disccards where cardid=:CARDID
    into :V_STARTSALDO^
  select count(wbd.posid),
    sum(cast(wbd.total as double precision))
    from wmatturn wmt, waybilldet wbd, waybilldetaddprops wbdap
    where wbdap.cardid=:cardid
     and wbdap.posid=wbd.posid
     and wbd.posid=wmt.sourceid
     and wmt.turntype=-1
  into :v_poscount, :v_total^

  select sum(cast(wbd.total as double precision))
    from wmatturn wmt, waybilldet wbd, waybilldetaddprops wbdap, returnrel rr
    where wbdap.cardid=:cardid
     and rr.outposid=wbd.posid
     and rr.dposid=wmt.sourceid
     and wbdap.posid=wbd.posid
     and wmt.turntype=1
  into :v_totalret^

  if (v_total is null) then v_total = 0^
  if (v_totalret is null) then v_totalret = 0^
  v_total = v_total - v_totalret + v_startsaldo^
  delete from dc_stat where cardid=:cardid^
  insert into dc_stat (cardid, poscount, total)
    values (:CARDID, :v_poscount, :v_total)^
end;

create procedure sp_fix_fk(
  TMASTER varchar(48),
  TDET varchar(48))
as
declare variable v_name varchar(64)^
begin
 for select rc2.rdb$constraint_name
 from rdb$relation_constraints rc,
      rdb$relation_constraints rc2,
      rdb$ref_constraints rfc
 where rc.rdb$relation_name=:TMASTER
  and rc.rdb$constraint_type='PRIMARY KEY'
  and rfc.rdb$const_name_uq=rc.rdb$constraint_name
  and rfc.rdb$constraint_name=rc2.rdb$constraint_name
  and rc2.rdb$relation_name=:TDET
 into :v_name do
 begin
   execute statement 'alter table '||TDET||' drop constraint '||v_name^
 end
end;

execute procedure sp_fix_fk('KAGENT', 'AGENTPERSONS');
execute procedure sp_fix_fk('KAGENT', 'AGENTDOC');
execute procedure sp_fix_fk('KAGENT', 'AGENTACCOUNT');
drop procedure sp_fix_fk;







alter table AGENTPERSONS add constraint FK_AP_KAID foreign key (KAID) references KAGENT(KAID) on delete CASCADE;
alter table AGENTDOC add constraint FK_ADOC_KAID foreign key (KAID) references KAGENT(KAID) on delete CASCADE;
alter table AGENTACCOUNT add constraint FK_AACC_KAID foreign key (KAID) references KAGENT(KAID) on delete CASCADE;












ALTER PROCEDURE SP_MAT_MOVE (
    MATID INTEGER,
    FROMDATE TIMESTAMP,
    TODATE TIMESTAMP,
    WID_IN INTEGER,
    KAID_IN INTEGER,
    WTYPE_IN INTEGER,
    WH VARCHAR(1024))
RETURNS (
    WBILLID INTEGER,
    WTYPE INTEGER,
    ONDATE TIMESTAMP,
    NUM VARCHAR(20),
    AMOUNT NUMERIC(15,8),
    PRICE NUMERIC(15,8),
    SHORTNAME VARCHAR(10),
    ONVALUE NUMERIC(15,8),
    POSID INTEGER,
    KAGENTNAME VARCHAR(255),
    FROMWH VARCHAR(128),
    FROMWID INTEGER,
    TOWH VARCHAR(128),
    TOWID INTEGER,
    DOCID INTEGER,
    REMAIN NUMERIC(15,8))
AS
DECLARE VARIABLE V_DESTWID INTEGER^
DECLARE VARIABLE V_SOURCEWID INTEGER^
DECLARE VARIABLE V_DESTNAME VARCHAR(128)^
DECLARE VARIABLE V_SOURCENAME VARCHAR(128)^
DECLARE VARIABLE V_KAID INTEGER^
begin
  remain = 0^
  for select wbl.wtype, wbl.wbillid, wbl.ondate, wbl.num,
    wbd.amount, wbd.price, wbd.posid, wbd.wid, c.shortname, wbd.onvalue,
    ka.name, ka.kaid, wh.name, wbl.docid
   from waybilldet wbd
    join waybilllist wbl on wbl.wbillid=wbd.wbillid
    join warehouse wh on wbd.wid=wh.wid
    join currency c on wbd.currid=c.currid
    left outer join kagent ka on wbl.kaid=ka.kaid
    left outer join returnrel rr on rr.posid=wbd.posid
   where wbl.ondate between :fromdate and :todate
    and wbl.checked=1
    and wbl.deleted=0
    and wbl.wtype in (1, -1, 5, -5, 6, -6, 4)
    and (rr.posid is not null or ((wbl.wtype=6) and (rr.posid is not null)) or (wbl.wtype<>6))
    and wbd.matid=:matid
   order by wbl.ondate
   into :wtype, :wbillid, :ondate, :num, :amount, :price,
    :posid, :fromwid, :shortname, :onvalue, :kagentname, :v_kaid, :fromwh, :docid do
  begin
    if (wtype = 4) then begin
      select ws.wid, ws.name, wd.wid, wd.name
       from waybillmove wbm, warehouse ws, warehouse wd
       where wbm.wbillid=:wbillid
        and wbm.destwid=wd.wid
        and wbm.sourcewid=ws.wid
       into :v_sourcewid, :v_sourcename, :v_destwid, :v_destname^
      if (valueinstr(:wh, :v_sourcewid) = 1)
        then fromwh = v_sourcename^
        else fromwh = ''^
      fromwid = v_sourcewid^
      if (valueinstr(:wh, :v_destwid) = 1)
        then towh = v_destname^
        else towh = ''^
      towid = v_destwid^
    end
    else begin
      towid = null^
      towh = null^
    end
    if ((wtype = 4) or (valueinstr(:wh, :fromwid) = 1)) then begin
      if (((kaid_in = 0) or (v_kaid = kaid_in)) and
        ((wtype_in = 0) or (wtype_in = wtype)) and
        ((wid_in = 0) or (wid_in = towid) or (wid_in = fromwid)))
        then begin
          if ((wid_in = fromwid) and (wtype=4)) then wtype = -wtype^
          if ((WID_IN > 0) or (wtype <> 4)) then begin
            remain = remain + amount * wtype/abs(wtype)^
          end
          if ((wid_in = fromwid) and (wtype=-4)) then wtype = -wtype^
          suspend^
        end
    end
  end
end;















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
        select max(ondate) from matremains
          where ondate<=:ondate and matid=:matid
        into :v_ondate^
        select mr.remain, mr.rsv, mr.avgprice, mr.ordered, mr.orsv
          from matremains mr
          where mr.ondate=:v_ondate
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
      if (valueinstr(:wh, :wid) = 1) then begin
        for select posid, max(ondate) from posremains where matid=:matid and ondate<=:ondate
         group by posid
          into :v_posid, :v_maxdate do begin
         v_tmp_remain = null^
         v_tmp_rsv = 0^
         v_tmp_ordered = 0^
         v_tmp_avgprice = 0^
         select pr.remain, pr.rsv, pr.avgprice, coalesce(pr.ordered, 0)
           from posremains pr
           where pr.posid=:v_posid
             and pr.ondate=:v_maxdate
             and pr.wid=:wid
           into :v_tmp_remain, :v_tmp_rsv, :v_tmp_avgprice, :v_tmp_ordered^
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
    else if (kaid <> 0) then begin
      v_posid = 0^
      v_maxdate = null^
      for select posid, wid, max(ondate) from posremains where matid=:matid and ondate<=:ondate
       group by posid, wid
        into :v_posid, :v_wid, :v_maxdate do begin
       if (valueinstr(:wh, :v_wid) = 1) then begin
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
           select wbl.kaid from waybilllist wbl, waybilldet wbd, extrel er
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

insert into functions (funid, classname, tabid, logging) values (67, 'TfmDCG', 0, 0);

insert into usertreeview (id, funid, treeid, pid, num, imageindex, isgroup, showintree, gtype, showexpanded, visible, disabledindex)
 values (70, 67, 0, 50, 1, 0, 0, 0, 520, 0, 0, 0);

insert into viewlng (id, langid, name) values (70, 1, 'Группы дисконтных карт');
insert into viewlng (id, langid, name) values (70, 2, 'Групи дисконтних карт');


ALTER PROCEDURE SP_WBD_GET_IN (
    AWBILLID INTEGER)
RETURNS (
    NUM INTEGER,
    POSID INTEGER,
    WBILLID INTEGER,
    MATID INTEGER,
    WID INTEGER,
    AMOUNT NUMERIC(15,8),
    PRICE NUMERIC(15,8),
    DISCOUNT NUMERIC(15,8),
    NDS NUMERIC(15,8),
    CURRID INTEGER,
    ONDATE TIMESTAMP,
    PTYPEID INTEGER,
    CHECKED INTEGER,
    MATNAME VARCHAR(255),
    MSRNAME VARCHAR(10),
    WHNAME VARCHAR(128),
    ARTIKUL VARCHAR(255),
    CURRNAME VARCHAR(10),
    ONVALUE NUMERIC(15,8),
    POSTYPE INTEGER,
    NORM NUMERIC(15,8),
    PRODUCER VARCHAR(128),
    GTD VARCHAR(64),
    CERTNUM VARCHAR(64),
    CERTDATE TIMESTAMP,
    SN VARCHAR(1000),
    BARCODE VARCHAR(64),
    GRPID INTEGER,
    COUNTRY VARCHAR(128),
    ARCHIVED INTEGER,
    FULLPRICE NUMERIC(15,8),
    SVCTOPRICE INTEGER)
AS
DECLARE VARIABLE V_ONVALUE NUMERIC(15,8)^
DECLARE VARIABLE V_SN INTEGER^
DECLARE VARIABLE SERIALNO VARCHAR(64)^
begin
  for select wbd.num, wbd.posid, wbd.wbillid, wbd.matid, wbd.wid, wbd.amount, wbd.price,
   wbd.discount, wbd.nds, wbd.currid, wbd.ondate, wbd.ptypeid, wbd.checked,
   mat.name, msr.shortname, wh.name, mat.artikul, curr.shortname, cast(wbd.onvalue as numeric(15,8)),
   cast(0 as integer) as postype, cast(0 as numeric(15,8)) as norm,
   wbdap.producer, wbdap.gtd, wbdap.certnum, wbdap.certdate, mat.serials, mat.barcode,
   mat.grpid, c.name, mat.archived, s.serialno, wbd.baseprice, cast(null as integer)
  from waybilldet wbd
   join materials mat on mat.matid=wbd.matid
   join measures msr on msr.mid=mat.mid
   join warehouse wh on wh.wid=wbd.wid
   left outer join currency curr on curr.currid=wbd.currid
   left outer join serials s on s.posid=wbd.posid
   left outer join waybilldetaddprops wbdap on wbdap.posid=wbd.posid
   left outer join countries c on c.cid=mat.cid
  where wbd.wbillid=:awbillid
   union all
  select wbs.num, -wbs.posid, wbl.wbillid, s.svcid, cast(0 as integer), wbs.amount, wbs.price,
    wbs.discount, wbs.nds, wbs.currid, wbl.ondate, cast(0 as integer), 0, cast(s.name as varchar(255)),
    ms.shortname, cast('' as varchar(64)), cast(s.artikul as varchar(255)),
    c.shortname, cast(wbl.onvalue as numeric(15,8)), 1, cast(wbs.norm as numeric(15,8)), cast('' as varchar(255)),
    cast('' as varchar(64)), cast('' as varchar(64)), cast(null as timestamp), 0,
    cast('' as varchar(64)), 0, cast('' as varchar(128)), 0, cast('' as varchar(64)),
    cast(null as numeric(15,8)), wbs.svctoprice
  from waybillsvc wbs
   join services s on s.svcid=wbs.svcid
   join measures ms on ms.mid=s.mid
   join waybilllist wbl on wbl.wbillid=wbs.wbillid
   join currency c on c.currid=wbs.currid
  where wbs.wbillid=:awbillid
  order by 1
   into :num, :posid, :wbillid, :matid, :wid, :amount, :price, :discount, :nds,
        :currid, :ondate, :ptypeid, :checked, :matname, :msrname, :whname, :artikul,
        :currname, :onvalue, :postype, :norm, :producer, :gtd, :certnum, :certdate,
        :v_sn, :barcode, :grpid, :country, :archived, :sn, :fullprice, :svctoprice
  do begin
    suspend^
  end
end;
