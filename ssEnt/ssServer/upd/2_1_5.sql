UPDATE REPLNG SET NAME='Short income report' WHERE REPID=1 and LANGID=3;
UPDATE REPLNG SET NAME='Short sales report'  WHERE REPID=2 and LANGID=3;
UPDATE REPLNG SET NAME='Balances at warehouse'  WHERE REPID=7 and LANGID=3;
UPDATE REPLNG SET NAME='Product turnover report' WHERE REPID=9 and LANGID=3;  
UPDATE REPLNG SET NAME='Minimal goods balances report' WHERE REPID=18 and LANGID=3; 
UPDATE REPLNG SET NAME='Short service sales report' WHERE REPID=20 and LANGID=3; 





UPDATE VIEWLNG SET NAME='Sales/Incoming goods' WHERE ID=32 and LANGID=3;
UPDATE VIEWLNG SET NAME='Goods receipt' WHERE ID=26 and LANGID=3;
UPDATE VIEWLNG SET NAME='Sales' WHERE ID=27 and LANGID=3;





alter table materials
  add warranty integer default 0,
  add secMsrUnitID integer;





alter table waybilldet 
  add expires timestamp,
  add poskind integer default 0,
  add posparent integer default 0,
  add MsrUnitID integer,
  add discountkind integer default 0;






ALTER PROCEDURE SP_REP_7 (
    ondate timestamp,
    grp varchar(1024),
    wid integer,
    ptypeid integer,
    getacc integer,
    wh varchar(1024))
returns (
    matid integer,
    grpid integer,
    matname varchar(255),
    artikul varchar(255),
    msrname varchar(24),
    del integer,
    rest numeric(15,8),
    rsv numeric(15,8),
    summrest numeric(15,8),
    producer varchar(255),
    accsum numeric(15,8))
as
declare variable v_sql varchar(3000)^
declare variable v_price double precision^
declare variable v_extra numeric(15,8)^
declare variable v_extratype integer^
declare variable v_currid integer^
declare variable v_basecurrid integer^
declare variable v_onvalue numeric(15,8)^
declare variable v_posid integer^
declare variable v_summ numeric(15,8)^
declare variable v_rest double precision^
declare variable v_rsv double precision^
declare variable v_summrest double precision^
begin
  select currid from currency where def=1 into :V_BASECURRID^

  V_SQL = 'select pr.matid, -mats.grpid as grpid, mats.name as matname,'
          || ' msr.shortname as msrname, mats.deleted as del,'
          || ' cast(sum(pr.remain) as numeric(15,8)), cast(sum(pr.rsv) as numeric(15,8)),'
          || ' cast(sum(cast(pr.remain as double precision) * cast(pr.avgprice as double precision)) as numeric(15,8)),'
          || ' mats.artikul, mats.producer '
          || 'from posremains pr, materials mats, measures msr '
          || 'where pr.ondate=(select max(ondate) from posremains '
          || ' where posid=pr.posid and ondate<=''' || cast(ONDATE as varchar(24))||''')'
          || ' and mats.matid=pr.matid and msr.mid=mats.mid '^

  if (WH <> '*') then V_SQL = V_SQL || ' and pr.wid in (' || WH || ') '^

  if (GRP <> '') then V_SQL = V_SQL || ' and mats.grpid in (' || GRP || ') '^

  if (WID > 0) then V_SQL = V_SQL || ' and pr.wid=' || CAST(WID as varchar(10))^

  V_SQL = V_SQL || 'group by pr.matid, mats.grpid, mats.name, msr.shortname, mats.deleted, mats.artikul, mats.producer order by 3'^

  for execute statement v_sql
    into :MATID, :GRPID, :MATNAME, :MSRNAME, :DEL, :REST, :RSV, :SUMMREST, :ARTIKUL, :PRODUCER 
  do begin
    V_SUMMREST = SUMMREST^
    V_REST = REST^
    V_RSV = RSV^

    if (PTYPEID = 0) then begin
      SUMMREST = formatfloat(SUMMREST, -2)^
    end
    else begin
      if (V_REST = 0)
        then V_PRICE = 0^
        else V_PRICE = V_SUMMREST / V_REST^
      select extra
        from sp_get_mat_extra(:MATID, :PTYPEID, :ONDATE, :V_PRICE, 0, 1)
        into :V_PRICE^
      SUMMREST = cast(formatfloat(V_PRICE * V_REST, -2) as numeric(15,8))^
    end

    ACCSUM = 0^

    if (GETACC = 1) then begin
      ACCSUM = 0^

      select sum(wbd.amount - acd.shippedamount - acd.rsvamount)
        from waybilllist wbl, waybilldet wbd, accoutdet acd
        where wbl.wbillid=wbd.wbillid
          and wbl.wtype=2 and wbd.matid=:MATID
          and wbd.posid=acd.posid
          and not exists (select posid from wmatturn where sourceid=wbd.posid)
      into :ACCSUM^
    end

    if ((REST > 0) or (ACCSUM > 0)) then suspend^
  end
end;














ALTER PROCEDURE SP_REP_25 (
    FROMDATE TIMESTAMP,
    TODATE TIMESTAMP,
    WID INTEGER,
    GRPID VARCHAR(1024),
    KAID INTEGER,
    PTYPEID INTEGER,
    GRPBY INTEGER,
    WH VARCHAR(1024))
RETURNS (
    MATID INTEGER,
    MATNAME VARCHAR(255),
    ARTIKUL VARCHAR(255),
    BARCODE VARCHAR(128),
    KAID_ INTEGER,
    KANAME VARCHAR(255),
    GRPID_ INTEGER,
    GRPNAME VARCHAR(128),
    MSRNAME VARCHAR(24),
    AMOUNT NUMERIC(15,8),
    PRICE NUMERIC(15,8),
    PRICEIN NUMERIC(15,8),
    PRICEOUT NUMERIC(15,8),
    SUMM NUMERIC(15,8),
    SUMMOUT NUMERIC(15,8),
    WHNAME VARCHAR(128))
AS
DECLARE VARIABLE V_PRICE DOUBLE PRECISION^
DECLARE VARIABLE V_SQL VARCHAR(2000)^
DECLARE VARIABLE V_ORDERBY VARCHAR(100)^
begin
  v_sql = 'select wmt.matid, mats.name, -mats.grpid, mg.name, msr.shortname,'||
          ' mats.artikul, mats.barcode, ka.kaid, ka.name,'||
          ' cast(sum(wmt.amount) as numeric(15,8)),'||
          ' cast(sum(wbd.price) as numeric(15,8)),'||
          ' cast(sum(formatfloat(cast(wbd.price as double precision)*cast(wbd.onvalue as double precision)*cast(wmt.amount as double precision), -2)) as numeric(15,8))'||
          ' from wmatturn wmt'||
          ' join waybilldet wbd on wbd.posid=wmt.sourceid'||
          ' join waybilllist wbl on wbd.wbillid=wbl.wbillid'||
          ' left join kagent ka on wbl.kaid=ka.kaid'||
          ' join materials mats on mats.matid=wmt.matid'||
          ' join warehouse wh on wh.wid=wmt.wid'||
          ' join measures msr on msr.mid=mats.mid'||
          ' join matgroup mg on mg.grpid=mats.grpid'||
          ' where wmt.turntype=1 and wbl.wtype<>4'||
          ' and wmt.ondate between '''||cast(fromdate as varchar(24))||''' and '''||cast(todate as varchar(24))||''''^

  if (WH <> '*') then v_sql = v_sql||' and wmt.wid in (' || WH || ')'^
  if (WID > 0) then v_sql = v_sql||' and wmt.wid='||cast(WID as varchar(24))^
  if (KAID > 0) then v_sql = v_sql||' and ka.kaid='||cast(KAID as varchar(24))^
  if (GRPID <> '') then v_sql = v_sql||' and mg.grpid in ('||GRPID||')'^
  v_sql = v_sql||' group by 1,2,3,4,5,6,7,8,9'^
  if (GRPBY = 0) then V_ORDERBY = ' order by 2'^ else
  if (GRPBY = 1) then V_ORDERBY = ' order by 2'^ else
  if (GRPBY = 2) then V_ORDERBY = ' order by 4,2'^ else
  if (GRPBY = 3) then V_ORDERBY = ' order by 9,2'^
  v_sql = v_sql||V_ORDERBY^

  for execute statement v_sql
  into :MATID, :MATNAME, :GRPID_,:GRPNAME, :MSRNAME, :ARTIKUL, :BARCODE,
       :KAID_, :KANAME, :AMOUNT, :PRICEIN, :PRICE do
  begin
    SUMM = PRICE^
    PRICE = SUMM / cast(AMOUNT as double precision)^
    PRICEOUT = 0^
    select extra
      from sp_get_mat_extra(:MATID, :PTYPEID, :TODATE, :PRICE, 0, 1)
    into :PRICEOUT^
    if (PRICEOUT is null) then PRICEOUT = 0^
    SUMMOUT = formatfloat(cast(PRICEOUT as double precision)*cast(AMOUNT as double precision), -2)^
    suspend^
  end
end;

grant execute on procedure sp_rep_25 to public;
grant execute on procedure sp_rep_25 to users;









ALTER PROCEDURE SP_WMAT_GET (
    grpid integer,
    wid integer,
    kaid integer,
    ondate timestamp,
    getempty integer,
    wh varchar(1024),
    showallmats integer,
    grp varchar(1024))
returns (
    matid integer,
    remain numeric(15,8),
    rsv numeric(15,8),
    matname varchar(255),
    msrname varchar(10),
    artikul varchar(255),
    avgprice numeric(15,8),
    grpname varchar(64),
    num integer,
    barcode varchar(64),
    country varchar(128),
    producer varchar(255),
    minreserv numeric(15,8),
    ordered numeric(15,8),
    orsv numeric(15,8),
    isserial integer,
    prices varchar(1500),
    dis float)
as
declare variable v_remain numeric(15,8)^
declare variable v_matid integer^
declare variable v_ondate timestamp^
declare variable v_maxdate timestamp^
declare variable v_posid integer^
declare variable v_tmp_remain double precision^
declare variable v_tmp_rsv double precision^
declare variable v_tmp_ordered double precision^
declare variable v_tmp_avgprice double precision^
declare variable v_sum double precision^
declare variable v_kaid integer^
declare variable v_wtype integer^
declare variable v_wid integer^
declare variable v_remain_ex double precision^
declare variable v_extratype integer^
declare variable v_ptypeid integer^
declare variable v_currname varchar(24)^
declare variable v_onvalue numeric(15,8)^
declare variable v_sql varchar(2048)^
declare variable v_pptypeid integer^
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

  if ((wid > 0) and (wh <> '*') and (valueinstr(:wh, :wid) <> 1)) then exit^

  V_SQL = 'select m.num, m.matid, m.name, m.artikul, ms.shortname, mg.name, m.barcode,
    c.name, m.producer, cast(m.minreserv as numeric(15,8)), m.serials
   from materials m
     join measures ms on ms.mid=m.mid
     join matgroup mg on m.grpid=mg.grpid
     left outer join countries c on m.cid=c.cid
   where m.archived=0'^

  if (GRP <> '')
    then V_SQL = V_SQL || ' and m.grpid in (' || GRP || ')'^
    else if (GRPID > 0) then V_SQL = V_SQL || ' and m.grpid=' || cast(GRPID as VARCHAR(10))^

  V_SQL = V_SQL||' order by m.num'^

  for execute statement V_SQL
    into :num, :matid, :matname, :artikul, :msrname, :grpname, :barcode,
         :country, :producer, :minreserv, :isserial 
  do begin
    remain = 0^
    ordered = 0^
    orsv = 0^
    v_remain_ex = 0^
    avgprice = 0^
    rsv = 0^
    v_sum = 0^
    v_ondate = null^

    if ((wid = 0) and (kaid = 0)) then begin
      if (wh = '*') then begin
        select first 1 mr.remain, mr.rsv, mr.avgprice, mr.ordered, mr.orsv
          from matremains mr
          where mr.matid = :matid and mr.ondate <= :ondate
          order by mr.ondate desc
          into :remain, :rsv, :avgprice, :ordered, :orsv^
      end
      else begin
        v_posid = 0^
        v_maxdate = null^
        v_ondate = null^

        for select posid, max(ondate) from posremains where matid = :matid and ondate <= :ondate
          group by posid
          into :v_posid, :v_maxdate
        do begin
          v_tmp_remain = null^
          v_tmp_rsv = 0^
          v_tmp_ordered = 0^
          v_tmp_avgprice = 0^

          select pr.remain, pr.rsv, pr.avgprice, pr.wid, coalesce(pr.ordered, 0)
            from posremains pr
            where pr.posid=:v_posid and pr.ondate=:v_maxdate
            into :v_tmp_remain, :v_tmp_rsv, :v_tmp_avgprice, :v_wid, :v_tmp_ordered^

          if ((wh = '*') or (valueinstr(:wh, :v_wid) = 1)) then begin
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
      where matid=:matid and wid=:wid
        and ondate=(select max(ondate) from posremains where posid=pr.posid and ondate<=:ondate and wid=:wid)
        into :v_posid, :v_tmp_remain, :V_TMP_RSV, :V_TMP_AVGPRICE, :v_tmp_ordered
      do begin
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
        into :v_posid, :v_wid, :v_maxdate
      do begin

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

    execute procedure sp_get_all_mat_prices(:matid, null) returning_values prices, dis^


    if ((remain > 0) or (ordered > 0) or ((getempty = 1) and (v_ondate is not null)) or (showallmats = 1))
      then suspend^
  end
end;

GRANT SELECT ON MATREMAINS TO PROCEDURE SP_WMAT_GET;
GRANT SELECT ON POSREMAINS TO PROCEDURE SP_WMAT_GET;
GRANT SELECT ON WAYBILLDET TO PROCEDURE SP_WMAT_GET;
GRANT SELECT ON WAYBILLLIST TO PROCEDURE SP_WMAT_GET;
GRANT SELECT ON EXTREL TO PROCEDURE SP_WMAT_GET;
GRANT EXECUTE ON PROCEDURE SP_GET_ALL_MAT_PRICES TO PROCEDURE SP_WMAT_GET;
GRANT EXECUTE ON PROCEDURE SP_WMAT_GET TO PUBLIC;
GRANT EXECUTE ON PROCEDURE SP_WMAT_GET TO SYSDBA;
GRANT EXECUTE ON PROCEDURE SP_WMAT_GET TO USERS;









ALTER PROCEDURE SP_WB_LIST (
    IN_FROMDATE TIMESTAMP,
    IN_TODATE TIMESTAMP,
    IN_WTYPE INTEGER,
    IN_CHECKED INTEGER,
    IN_KAID INTEGER,
    WH VARCHAR(1024),
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
        :katype, :attnum, :attdate, :received, :todate, :defnum, :entid 
  do begin
    if (wh = '*') then begin
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
  v_sql_wh = 'select wid, name from warehouse'^
  if (:wh <> '*') then v_sql_wh = :v_sql_wh || ' where wid in (' || WH || ')'^

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

      if (((W_ID = 0) or (WID = W_ID)) and ((KAID = 0) or (KAID = V_KAID))) 
      then begin
        REMAIN = REMAIN + V_REMAIN^
        RSV = RSV + V_RSV^
      end
    end

    if (REMAIN > 0) then suspend^
  end
end;












ALTER PROCEDURE SP_ORDERED_GET (
    MATID INTEGER,
    W_ID INTEGER,
    KAID INTEGER,
    ON_DATE TIMESTAMP,
    GETEMPTY INTEGER,
    WH VARCHAR(1024))
RETURNS (
    POSID INTEGER,
    REMAIN NUMERIC(15,8),
    ORDERED NUMERIC(15,8),
    RSV NUMERIC(15,8),
    WID INTEGER,
    NAME VARCHAR(128),
    ONDATE TIMESTAMP,
    TODATE TIMESTAMP,
    PRICE NUMERIC(15,8),
    CURRID INTEGER,
    SHORTNAME VARCHAR(10),
    ONVALUE NUMERIC(15,8),
    WTYPE INTEGER,
    DOCNUM VARCHAR(20),
    WBILLID INTEGER,
    DOCID INTEGER,
    KANAME VARCHAR(255),
    NOTES VARCHAR(255),
    CERTNUM VARCHAR(64),
    POSDATE TIMESTAMP)
AS
DECLARE VARIABLE V_KAID INTEGER^
begin
  for select pr.remain, pr.ordered, pr.rsv, wbd.posid, w.wid,
    w.name, wbl.ondate, wbd.ondate, wbd.price, wbd.currid,
    wbl.wtype, wbl.num, wbl.wbillid, wbl.docid, wbl.todate, 
    wbd.onvalue, c.shortname, wbl.kaid, ka.name, wbdap.notes,
    wbdap.certnum
  from posremains pr
    join warehouse w on pr.wid=w.wid
    join waybilldet wbd on pr.posid=wbd.posid
    join waybilllist wbl on wbl.wbillid=wbd.wbillid
    join wmatturn wmt on wmt.posid=wbd.posid
    left outer join currency c on wbd.currid=c.currid
    left outer join waybilldetaddprops wbdap on wbdap.posid=wbd.posid
    left outer join kagent ka on ka.kaid=wbl.kaid
  where pr.matid=:matid
    and wmt.turntype=3
    and pr.ondate=
     (select max(ondate) from posremains where posid=pr.posid and ondate<=:on_date)
  into :remain, :ordered, :rsv, :posid, :wid, :name, :ondate, :posdate, :price, :currid, :wtype, :docnum, :wbillid, :docid,
       :todate, :onvalue, :shortname, :v_kaid, :kaname, :notes, :certnum do
  begin
    suspend^

    if ((:wh = '*') or (valueinstr(:wh, :wid) = 1)) then begin
      if (((remain > 0) or (getempty = 1)) and (((w_id = 0) or (wid = w_id)) and ((kaid = 0) or (kaid = v_kaid))))
        then suspend^
    end
  end
end;

grant execute on procedure sp_ordered_get to public;
grant execute on procedure sp_ordered_get to users;






CREATE OR ALTER PROCEDURE SP_WBREST_LIST (
    fromdate timestamp,
    todate timestamp,
    in_checked integer,
    wh varchar(1024),
    allwh integer)
returns (
    wbillid integer,
    num varchar(20),
    ondate timestamp,
    kaid integer,
    currid integer,
    reason varchar(255),
    checked integer,
    summall numeric(15,8),
    wtype integer,
    nds numeric(15,8),
    personid integer,
    summpay numeric(15,8),
    notes varchar(255),
    docid integer,
    summincurr numeric(15,8),
    currrate numeric(5,5),
    currname varchar(3),
    personname varchar(255))
as
declare variable v_count integer^
begin
  for select wbl.wbillid, wbl.num, wbl.ondate, wbl.currid, wbl.reason,
    wbl.checked, wbl.summall, wbl.wtype, wbl.nds, wbl.personid, wbl.summpay,
    wbl.notes, wbl.docid, wbl.summincurr, c.shortname, wbl.onvalue, ka.name, ka.kaid
  from waybilllist wbl
    join currency c on c.currid=wbl.currid
    left join kagent ka on ka.kaid=wbl.personid
  where wbl.deleted=0
    and wbl.wtype=5
    and wbl.ondate between :fromdate and :todate
  order by wbl.ondate desc
  into :WBILLID, :NUM, :ONDATE, :CURRID, :REASON, :CHECKED, :SUMMALL, :WTYPE, 
        :NDS, :PERSONID, :SUMMPAY, :NOTES, :DOCID, :SUMMINCURR, :CURRNAME,
        :CURRRATE, :PERSONNAME, :KAID
  do begin
    if (WH = '*') then begin
      if ((IN_CHECKED = -1) or (IN_CHECKED = CHECKED))
        then suspend^
    end
    else begin
      v_count = 0^
      select count(posid) from waybilldet
        where wbillid=:WBILLID and :wh<>'*'and valueinstr(:WH, wid)=0
      into :v_count^

      if ((v_count = 0) and ((IN_CHECKED = -1) or (IN_CHECKED = CHECKED)))
        then suspend^
    end
  end
end;

GRANT SELECT ON WAYBILLLIST TO PROCEDURE SP_WBREST_LIST;
GRANT SELECT ON CURRENCY TO PROCEDURE SP_WBREST_LIST;
GRANT SELECT ON KAGENT TO PROCEDURE SP_WBREST_LIST;
GRANT SELECT ON WAYBILLDET TO PROCEDURE SP_WBREST_LIST;
GRANT EXECUTE ON PROCEDURE SP_WBREST_LIST TO "PUBLIC";
GRANT EXECUTE ON PROCEDURE SP_WBREST_LIST TO SYSDBA;
GRANT EXECUTE ON PROCEDURE SP_WBREST_LIST TO USERS;












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
        where wbm.wbillid=:wbillid and wbm.destwid=wd.wid and wbm.sourcewid=ws.wid
      into :v_sourcewid, :v_sourcename, :v_destwid, :v_destname^

      if ((:wh = '*') or (valueinstr(:wh, :v_sourcewid) = 1))
        then fromwh = v_sourcename^
        else fromwh = ''^

      fromwid = v_sourcewid^

      if ((:wh = '*') or (valueinstr(:wh, :v_destwid) = 1))
        then towh = v_destname^
        else towh = ''^

      towid = v_destwid^
    end
    else begin
      towid = null^
      towh = null^
    end

    if ((wtype = 4) or (:wh = '*') or (valueinstr(:wh, :fromwid) = 1)) then begin
      if (((kaid_in = 0) or (v_kaid = kaid_in))
         and ((wtype_in = 0) or (wtype_in = wtype))
         and ((wid_in = 0) or (wid_in = towid) or (wid_in = fromwid)))
      then begin
        if ((wid_in = fromwid) and (wtype=4)) then wtype = -wtype^

        if ((WID_IN > 0) or (wtype <> 4)) then remain = remain + amount * wtype/abs(wtype)^

        if ((wid_in = fromwid) and (wtype=-4)) then wtype = -wtype^

        suspend^
      end
    end
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
    wbdap.gtd, wbdap.certnum, wbdap.certdate, wbdap.producer, wbd.onvalue, c.shortname, s.serialno
  from posremains pr
    join warehouse w on pr.wid=w.wid
    join waybilldet wbd on pr.posid=wbd.posid
    join currency c on wbd.currid=c.currid
    join waybilllist wbl on wbl.wbillid=wbd.wbillid
    left outer join serials s on s.posid=wbd.posid
    left outer join waybilldetaddprops wbdap on wbdap.posid=wbd.posid
  where pr.matid=:matid
    and pr.ondate=
     (select max(ondate) from posremains where posid=pr.posid and ondate<=:on_date)
    and wbl.wtype<>16
  into :remain, :rsv, :posid, :wid, :name, :ondate, :v_ondate, :price, :currid, :wtype, :docnum, :wbillid, :docid,
       :gtd, :certnum, :certdate, :producer, :onvalue, :shortname, :sn do
  begin
    if ((:wh='*') or (valueinstr(:wh, :wid) = 1)) then begin
      v_kaid = 0^
      v_wtype = 0^

      if ((v_issn = 1) and (sn is null)) then begin
        sn = null^
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













CREATE OR ALTER PROCEDURE SP_WMAT_GET_POS (
    ondate timestamp,
    wid integer,
    wh varchar(1024))
returns (
    matid integer,
    posid integer,
    remain numeric(15,8),
    rsv numeric(15,8),
    price numeric(15,8),
    currid integer,
    nds numeric(15,8),
    onvalue numeric(15,8),
    matname varchar(255),
    msrname varchar(10))
as
declare variable v_wid integer^
begin
  matid = null^
  rsv = null^
  remain = null^
  posid = null^
  price = null^
  onvalue = null^
  nds = null^

  for select m.matid, m.name, ms.shortname
    from materials m, measures ms where m.archived=0
     and m.deleted=0 and ms.mid=m.mid
    into :MATID, :MATNAME, :MSRNAME do
  begin
    remain = 0^
    price = 0^
    rsv = 0^
    currid = null^
    onvalue = 0^
    nds = 0^

    for select pr.posid, pr.remain, pr.rsv, wbd.price, wbd.currid, wbd.nds, wbd.onvalue, pr.wid
      from posremains pr, waybilldet wbd
      where pr.matid=:MATID and pr.wid=:WID and wbd.posid=pr.posid
        and pr.ondate=(select max(ondate) from posremains where posid=pr.posid and ondate<=:ONDATE)
        and pr.remain-pr.rsv>0
      into :POSID, :REMAIN, :RSV, :PRICE, :CURRID, :NDS, :ONVALUE, :v_wid do
    begin
      if ((remain > 0) and ((:wh='*') or (valueinstr(:WH, v_wid)=1))) then suspend^
    end
  end
end;

GRANT SELECT ON MATERIALS TO PROCEDURE SP_WMAT_GET_POS;
GRANT SELECT ON MEASURES TO PROCEDURE SP_WMAT_GET_POS;
GRANT SELECT ON POSREMAINS TO PROCEDURE SP_WMAT_GET_POS;
GRANT SELECT ON WAYBILLDET TO PROCEDURE SP_WMAT_GET_POS;
GRANT EXECUTE ON PROCEDURE SP_WMAT_GET_POS TO "PUBLIC";
GRANT EXECUTE ON PROCEDURE SP_WMAT_GET_POS TO SYSDBA;
GRANT EXECUTE ON PROCEDURE SP_WMAT_GET_POS TO USERS;
