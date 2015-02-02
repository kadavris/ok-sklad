ALTER PROCEDURE SP_WB_LIST (
    IN_FROMDATE TIMESTAMP,
    IN_TODATE TIMESTAMP,
    IN_WTYPE INTEGER,
    IN_CHECKED INTEGER,
    IN_KAID INTEGER,
    WH VARCHAR(1024),
    ALLWH INTEGER,
    SHOWNULLBALANCE INTEGER,
    IN_ENTID INTEGER)
RETURNS (
    WBILLID INTEGER,
    NUM VARCHAR(20),
    ONDATE TIMESTAMP,
    KAID INTEGER,
    CURRID INTEGER,
    REASON VARCHAR(255),
    CHECKED INTEGER,
    SUMMALL NUMERIC(15,8),
    WTYPE INTEGER,
    NDS NUMERIC(15,8),
    PERSONID INTEGER,
    SUMMPAY NUMERIC(15,8),
    NOTES VARCHAR(255),
    DOCID INTEGER,
    SUMMINCURR NUMERIC(15,8),
    CURRRATE NUMERIC(5,5),
    CURRNAME VARCHAR(3),
    PERSONNAME VARCHAR(255),
    KANAME VARCHAR(255),
    KAFULLNAME VARCHAR(255),
    KAPHONE VARCHAR(255),
    ADDRESS VARCHAR(255),
    CITY VARCHAR(64),
    DISTRICT VARCHAR(64),
    COUNTRY VARCHAR(64),
    POSTINDEX VARCHAR(24),
    FAX VARCHAR(255),
    EMAIL VARCHAR(255),
    WWW VARCHAR(255),
    KATYPE INTEGER,
    ATTNUM VARCHAR(64),
    ATTDATE TIMESTAMP,
    RECEIVED VARCHAR(128),
    TODATE TIMESTAMP,
    DEFNUM INTEGER,
    ENTID INTEGER)
AS
DECLARE VARIABLE V_COUNT INTEGER^
begin
  for select wbl.wbillid, wbl.num, wbl.ondate, wbl.currid, wbl.reason,
   wbl.checked, wbl.summall, wbl.wtype, wbl.nds, wbl.personid, wbl.summpay,
   wbl.notes, wbl.docid, wbl.summincurr, c.shortname, wbl.onvalue, ka.name, ka.kaid,
   ka.fullname, ka.phone, kaemp.name, ka.address, ka.city, ka.district,
   ka.country, ka.postindex, ka.fax, ka.email, ka.www, ka.ktype, wbl.attnum, 
   wbl.attdate, wbl.received, wbl.todate, wbl.defnum, wbl.entid
   from waybilllist wbl
    join kagent ka on ka.kaid=wbl.kaid
    left join currency c on c.currid=wbl.currid
    left join kagent kaemp on wbl.personid=kaemp.kaid
   where wbl.deleted=0
    and coalesce(ka.archived, 0)=0
    and wbl.wtype=:in_wtype
    and wbl.ondate between :in_fromdate and :in_todate
    and (wbl.kaid=:in_kaid or :in_kaid=0)
    and (wbl.checked=:in_checked or :in_checked=-1)
    and (wbl.entid=:in_entid or :in_entid=0)
    and ((:shownullbalance=1) or (:shownullbalance=0 and formatfloat(coalesce(wbl.summall, 0) - coalesce(wbl.summpay, 0), -2) <> 0))
   order by wbl.ondate desc
   into :wbillid, :num, :ondate, :currid, :reason, :checked, :summall, :wtype,
        :nds, :personid, :summpay, :notes, :docid, :summincurr, :currname,
        :currrate, :kaname, :kaid, :kafullname, :kaphone, :personname,
        :address, :city, :district, :country, :postindex, :fax, :email, :www,
        :katype, :attnum, :attdate, :received, :todate, :defnum, :entid do
  begin
    if (allwh = 1) then begin
      suspend^
    end
    else begin
      v_count = 0^
      select count(posid) from waybilldet
        where wbillid=:wbillid and valueinstr(:wh, wid)=0
      into :v_count^
      if (v_count = 0) then suspend^
    end
  end
end;










CREATE TABLE ENTEXPARAMS (
    KAID     INTEGER NOT NULL,
    WTYPE    INTEGER NOT NULL,
    PREFFIX  VARCHAR(10),
    SUFFIX   VARCHAR(10),
    AUTONUM  INTEGER NOT NULL,
    GEN      VARCHAR(48) NOT NULL
);
ALTER TABLE ENTEXPARAMS ADD CONSTRAINT FK_EEP_KAID FOREIGN KEY (KAID) REFERENCES KAGENT (KAID) ON DELETE CASCADE;



grant all on entexparams to public;
grant all on entexparams to users;








ALTER PROCEDURE SP_MATCHANGE_GET (
    MATID INTEGER)
RETURNS (
    ID INTEGER,
    NAME VARCHAR(255),
    ARTIKUL CHAR(255),
    NOTES VARCHAR(255),
    GRPID INTEGER,
    GRPNAME VARCHAR(255),
    PRODUCER VARCHAR(255),
    COUNTRY VARCHAR(255),
    MSRNAME VARCHAR(10),
    BARCODE VARCHAR(255),
    REMAIN NUMERIC(15,8))
AS
begin
  for
   select m.matid, m.name, m.artikul, mc.notes, m.grpid,
    mg.name, ms.shortname, m.producer, m.barcode, c.name 
    from matchange mc
     join materials m on mc.changeid=m.matid
     join measures ms on ms.mid=m.mid
     join matgroup mg on mg.grpid=m.grpid
     left join countries c on c.cid=m.cid
    where mc.matid=:MATID
    union
   select m.matid, m.name, m.artikul, mc.notes, m.grpid,
    mg.name, ms.shortname, m.producer, m.barcode, c.name 
    from matchange mc
     join materials m on mc.changeid=m.matid
     join measures ms on ms.mid=m.mid
     join matgroup mg on mg.grpid=m.grpid
     left join countries c on c.cid=m.cid
    where mc.changeid=:MATID
   into :ID, :NAME, :ARTIKUL, :NOTES, :GRPID, :GRPNAME, :MSRNAME,
        :PRODUCER, :BARCODE, :COUNTRY do
  begin
    remain = null^
    select mr.remain-mr.rsv
     from matremains mr where mr.matid=:ID
      and mr.ondate=(select max(ondate) from matremains where matid=mr.matid)
    into :REMAIN^
    suspend^
  end
end;

ALTER PROCEDURE SP_MATCHANGE_GET_WP (
    MATID INTEGER,
    MCDATE TIMESTAMP)
RETURNS (
    ID INTEGER,
    NAME VARCHAR(255),
    ARTIKUL CHAR(255),
    NOTES VARCHAR(255),
    PRICE NUMERIC(15,8),
    ONDATE TIMESTAMP,
    CURRID INTEGER,
    ONVALUE NUMERIC(15,8),
    SHORTNAME VARCHAR(3),
    PRODUCER VARCHAR(255),
    COUNTRY VARCHAR(255),
    MSRNAME VARCHAR(10),
    BARCODE VARCHAR(255),
    GRPNAME VARCHAR(255)
    )
AS
DECLARE VARIABLE POSID INTEGER^
begin
  for select m.matid, m.name, m.artikul, mc.notes, mg.name, 
    ms.shortname, c.name, m.barcode, m.producer
    from matchange mc
     join materials m on mc.changeid=m.matid
     join measures ms on ms.mid=m.mid
     join matgroup mg on mg.grpid=m.grpid
     left join countries c on c.cid=m.cid
    where mc.matid=:MATID
    union
   select m.matid, m.name, m.artikul, mc.notes, mg.name, 
    ms.shortname, c.name, m.barcode, m.producer
    from matchange mc
     join materials m on mc.changeid=m.matid
     join measures ms on ms.mid=m.mid
     join matgroup mg on mg.grpid=m.grpid
     left join countries c on c.cid=m.cid
    where mc.changeid=:MATID
   into :ID, :NAME, :ARTIKUL, :NOTES, :GRPNAME,
        :MSRNAME, :COUNTRY, :BARCODE, :PRODUCER do begin
    PRICE = null^
    CURRID = null^
    ONVALUE = null^
    SHORTNAME = null^
    ONDATE = null^
    select max(ondate) from wmatturn where matid=:ID and turntype=1 and ondate<=:MCDATE
      into :ondate^
    if (:ondate is not null) then begin
      select first 1 posid from wmatturn where matid=:ID and turntype=1 and
        ondate=:ondate into :POSID^
      select wbd.price, c.currid, c.shortname, wbd.onvalue
        from waybilldet wbd, currency c
        where wbd.posid=:posid
          and wbd.currid=c.currid
        into :PRICE, :CURRID, :SHORTNAME, :ONVALUE^
    end
    suspend^
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
    MSIZE NUMERIC(15,8))
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
   cast(mat.msize as numeric(15,8))
  from WAYBILLDET wbd
   join MATERIALS mat on mat.matid=wbd.matid
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
   c.shortname, cast(wbl.onvalue as numeric(15,8)), wbs.price as price2, 1, cast(wbs.norm as numeric(15,8)), cast('' as varchar(64)), 0,
   cast(null as integer), cast(null as integer), cast('' as varchar(255)),
   cast(0 as numeric(15,8)), cast(0 as numeric(15,8))
  from waybillsvc wbs
   join services s on s.svcid=wbs.svcid
   join measures ms on ms.mid=s.mid
   join waybilllist wbl on wbl.wbillid=wbs.wbillid
   join currency c on c.currid=wbs.currid
  where wbs.wbillid=:awbillid
  order by 1
   into :NUM, :POSID, :WBILLID, :MATID, :WID, :AMOUNT, :PRICE, :DISCOUNT, :NDS,
        :CURRID, :ONDATE, :PTYPEID, :CHECKED, :MATNAME, :MSRNAME, :WHNAME, :ARTIKUL,
        :COUNTRY, :CURRNAME, :ONVALUE, :PRICE2, :POSTYPE, :NORM, :GTD, :V_SN,
        :WPERIOD, :WPERIODTYPE, :PRODUCER, :MWEIGHT, :MSIZE do
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







ALTER PROCEDURE SP_WMAT_GET (
    GRPID INTEGER,
    WID INTEGER,
    KAID INTEGER,
    ONDATE TIMESTAMP,
    GETEMPTY INTEGER,
    WH VARCHAR(1024),
    ALLWH INTEGER,
    SHOWALLMATS INTEGER)
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

  for select m.num, m.matid, m.name, m.artikul, ms.shortname, mg.name, m.barcode,
    c.name, m.producer, m.minreserv, m.serials
   from materials m
    join measures ms on ms.mid=m.mid
    join matgroup mg on m.grpid=mg.grpid
    left outer join countries c on m.cid=c.cid
   where ((m.grpid=:grpid) or (:grpid=0)) and m.archived=0
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
    end
    else if ((wid <> 0) and (kaid = 0)) then begin
      v_posid = 0^
      v_maxdate = null^
      v_ondate = null^
      for select pr.posid, pr.remain, pr.rsv, pr.avgprice, pr.ordered
       from posremains pr
       where matid=:matid and wid=:wid and ondate=
        (select max(ondate) from posremains where posid=pr.posid and ondate<=:ondate and wid=:wid)
        into :v_posid, :v_tmp_remain, :V_TMP_RSV, :V_TMP_AVGPRICE, :v_tmp_ordered do begin
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


ALTER PROCEDURE SP_MATCHANGE_GET (
    MATID INTEGER)
RETURNS (
    ID INTEGER,
    NAME VARCHAR(255),
    ARTIKUL CHAR(255),
    NOTES VARCHAR(255),
    GRPID INTEGER,
    GRPNAME VARCHAR(255),
    PRODUCER VARCHAR(255),
    COUNTRY VARCHAR(255),
    MSRNAME VARCHAR(10),
    BARCODE VARCHAR(255),
    REMAIN NUMERIC(15,8))
AS
begin
  for
   select m.matid, m.name, m.artikul, mc.notes, m.grpid,
    mg.name, ms.shortname, m.producer, m.barcode, c.name 
    from matchange mc
     join materials m on mc.changeid=m.matid
     join measures ms on ms.mid=m.mid
     join matgroup mg on mg.grpid=m.grpid
     left join countries c on c.cid=m.cid
    where mc.matid=:matid
    union
   select m.matid, m.name, m.artikul, mc.notes, m.grpid,
    mg.name, ms.shortname, m.producer, m.barcode, c.name 
    from matchange mc
     join materials m on mc.matid=m.matid
     join measures ms on ms.mid=m.mid
     join matgroup mg on mg.grpid=m.grpid
     left join countries c on c.cid=m.cid
    where mc.changeid=:matid
   into :id, :name, :artikul, :notes, :grpid, :grpname, :msrname,
        :producer, :barcode, :country do
  begin
    remain = null^
    select mr.remain-mr.rsv
     from matremains mr where mr.matid=:id
      and mr.ondate=(select max(ondate) from matremains where matid=mr.matid)
    into :remain^
    suspend^
  end
end;














ALTER PROCEDURE SP_WMAT_GET_BY_WH (
    MATID INTEGER,
    W_ID INTEGER,
    KAID INTEGER,
    ONDATE TIMESTAMP,
    WH VARCHAR(1024))
RETURNS (
    REMAIN NUMERIC(15,8),
    RSV NUMERIC(15,8),
    WID INTEGER,
    NAME VARCHAR(128))
AS
DECLARE VARIABLE V_REMAIN NUMERIC(15,8)^
DECLARE VARIABLE V_RSV NUMERIC(15,8)^
DECLARE VARIABLE V_POSID INTEGER^
DECLARE VARIABLE V_KAID INTEGER^
DECLARE VARIABLE V_WTYPE INTEGER^
DECLARE VARIABLE V_SQL_WH VARCHAR(2000)^
begin
  v_sql_wh = 'select wid, name from warehouse where wid in ('||WH||')'^
  for execute statement v_sql_wh
   into :WID, :NAME do
  begin
    REMAIN = 0^
    RSV = 0^
    for select formatfloat(pr.remain, -4), pr.rsv, pr.posid
      from posremains pr
      where pr.matid=:MATID
        and pr.wid=:WID
        and pr.ondate=
       (select max(ondate) from posremains
         where posid=pr.posid and ondate<=:ONDATE)
        and pr.remain>0
      into :V_REMAIN, :V_RSV, :V_POSID do
    begin
      select wbl.wtype, wbl.kaid
        from waybilldet wbd, waybilllist wbl
        where wbd.posid=:V_POSID and wbd.wbillid=wbl.wbillid
      into :V_WTYPE, :V_KAID^
      if (V_WTYPE in (4, 6)) then begin
        select first 1 wbl.kaid from waybilllist wbl, waybilldet wbd, extrel er
          where wbl.wbillid=wbd.wbillid and wbd.posid=er.extposid and er.intposid=:V_POSID
        into :V_KAID^
      end
      if (((W_ID = 0) or (WID = W_ID)) and ((KAID = 0) or (KAID = V_KAID))) then
      begin
        REMAIN = REMAIN + V_REMAIN^
        RSV = RSV + V_RSV^
      end
    end
    if (REMAIN > 0) then suspend^
  end
end;
















ALTER PROCEDURE SP_POS_GET (
    MATID INTEGER,
    W_ID INTEGER,
    KAID INTEGER,
    ON_DATE TIMESTAMP,
    GETEMPTY INTEGER,
    WH VARCHAR(1024))
RETURNS (
    POSID INTEGER,
    REMAIN NUMERIC(15,8),
    RSV NUMERIC(15,8),
    WID INTEGER,
    NAME VARCHAR(128),
    ONDATE TIMESTAMP,
    PRICE NUMERIC(15,8),
    CURRID INTEGER,
    SHORTNAME VARCHAR(10),
    ONVALUE NUMERIC(15,8),
    SN VARCHAR(64),
    WTYPE INTEGER,
    DOCNUM VARCHAR(20),
    WBILLID INTEGER,
    DOCID INTEGER,
    GTD VARCHAR(64),
    CERTNUM VARCHAR(64),
    CERTDATE TIMESTAMP,
    PRODUCER VARCHAR(64))
AS
DECLARE VARIABLE V_ONDATE TIMESTAMP^
DECLARE VARIABLE V_WTYPE INTEGER^
DECLARE VARIABLE V_KAID INTEGER^
DECLARE VARIABLE V_ISSN INTEGER^
begin
  select serials from materials where matid=:matid into :v_issn^
  if (v_issn is null) then v_issn = 0^

  for select pr.remain, pr.rsv, wbd.posid, w.wid,
    w.name, wbl.ondate, wbd.ondate, wbd.price, wbd.currid, wbl.wtype, wbl.num, wbl.wbillid, wbl.docid,
    wbdap.gtd, wbdap.certnum, wbdap.certdate, wbdap.producer, wbd.onvalue, c.shortname
   from posremains pr
    join warehouse w on pr.wid=w.wid
    join waybilldet wbd on pr.posid=wbd.posid
    join currency c on wbd.currid=c.currid
    join waybilllist wbl on wbl.wbillid=wbd.wbillid
    left outer join waybilldetaddprops wbdap on wbdap.posid=wbd.posid
   where pr.matid=:matid
    and pr.ondate=
     (select max(ondate) from posremains where posid=pr.posid and ondate<=:on_date)
    and wbl.wtype<>16
  into :remain, :rsv, :posid, :wid, :name, :ondate, :v_ondate, :price, :currid, :wtype, :docnum, :wbillid, :docid,
       :gtd, :certnum, :certdate, :producer, :onvalue, :shortname do
  begin
    if (valueinstr(:wh, :wid) = 1) then begin
      v_kaid = 0^
      v_wtype = 0^
      sn = null^
      if (v_issn = 1) then begin
        if (wtype in (4, 6)) then begin
          select s.serialno from waybilldet wbd, extrel er, serials s
            where s.posid=wbd.posid and wbd.posid=er.extposid and er.intposid=:posid
          into :sn^
        end
        else select serialno from serials where posid=:posid into :sn^
      end

      if (kaid <> 0) then begin
        select wbl.wtype, wbl.kaid
          from waybilldet wbd, waybilllist wbl
          where wbd.posid=:posid and wbd.wbillid=wbl.wbillid
        into :v_wtype, :v_kaid^
        if (v_wtype in (4, 6)) then begin
          select first 1 wbl.kaid from waybilllist wbl, waybilldet wbd, extrel er
            where wbl.wbillid=wbd.wbillid and wbd.posid=er.extposid and er.intposid=:posid
          into :v_kaid^
        end
      end
      if (((remain > 0) or (getempty = 1)) and (((w_id = 0) or (wid = w_id)) and ((kaid = 0) or (kaid = v_kaid))))
        then suspend^
    end
  end
end;

delete from rdb$procedure_parameters where upper(rdb$procedure_name)='SP_GET_LAST_PRICE';
delete from rdb$procedures where upper(rdb$procedure_name)='SP_GET_LAST_PRICE';

