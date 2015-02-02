update rdb$fields set RDB$FIELD_SCALE=-8, RDB$FIELD_SUB_TYPE=1 
  where RDB$SYSTEM_FLAG<>1 and RDB$FIELD_TYPE=16 and RDB$FIELD_SUB_TYPE=1 and RDB$FIELD_SCALE<>-8 and rdb$field_precision=15;

update rdb$fields set RDB$FIELD_SUB_TYPE=1 
  where RDB$SYSTEM_FLAG<>1 and RDB$FIELD_TYPE=16 and RDB$FIELD_SCALE=-8 and rdb$field_precision=15;






alter table serials add invnumb varchar(255);








ALTER PROCEDURE SP_MAT_LIST (
    grp varchar(255),
    getprice integer,
    getarchived integer)
returns (
    matid integer,
    mid integer,
    name varchar(255),
    artikul varchar(255),
    notes varchar(255),
    grpid integer,
    shortname varchar(6),
    mtype integer,
    wid integer,
    num integer,
    minreserv numeric(15,8),
    cid integer,
    demandcat integer,
    barcode varchar(64),
    producer varchar(255),
    weight numeric(15,8),
    msize numeric(15,8),
    cname varchar(128),
    prices varchar(1500),
    archived integer,
    avgprice numeric(15,8),
    cf1 integer,
    cf2 integer,
    cf3 integer,
    cf4 integer,
    cf5 integer)
as
declare variable v_sql varchar(1024)^
declare variable v_extratype integer^
declare variable v_ptypeid integer^
declare variable v_onvalue numeric(15,8)^
declare variable v_dis integer^
declare variable v_currid integer^
declare variable v_currname varchar(24)^
begin
  v_sql = 'select m.matid, m.name, m.artikul, m.mid, m.notes, m.grpid, m.wid,'
          || ' m.num, cast(m.minreserv as numeric(15,8)), m.cid, m.demandcat,'
          || ' cast(m.weight as numeric(15,8)), cast(m.msize as numeric(15,8)), m.producer,'
          || ' m.barcode, 1 as mtype, ms.shortname, c.name as cname, m.archived,'
          || ' m.cf1,m.cf2,m.cf3,m.cf4,m.cf5'
          || ' from materials m join measures ms on m.mid=ms.mid'
          || ' left outer join countries c on c.cid=m.cid where m.deleted=0'^

  if (getarchived = 0) then v_sql = v_sql || ' and m.archived=0'^

  if (grp <> '') then v_sql = v_sql || ' and m.grpid in (' || grp || ')'^

  v_sql = v_sql || ' order by m.num'^

  for execute statement v_sql
    into :matid, :name, :artikul, :mid, :notes, :grpid, :wid, :num, :minreserv,
         :cid, :demandcat, :weight, :msize, :producer, :barcode, :mtype, :shortname,
         :cname, :archived,
         :cf1, :cf2, :cf3, :cf4, :cf5
  do begin
    select first 1 mr.avgprice
      from matremains mr
      where mr.matid=:matid order by ondate desc
      into avgprice^

    if (getprice = 1)
      then execute procedure sp_get_all_mat_prices(:matid, null) returning_values prices, v_dis^

    suspend^
  end
end;









ALTER PROCEDURE SP_REP_7 (
    ondate timestamp,
    grp varchar(1024),
    wid integer,
    ptypeid integer,
    getacc integer,
    wh varchar(1024),
    allwh integer)
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

  if (ALLWH <> 1) then V_SQL = V_SQL || ' and pr.wid in (' || WH || ') '^

  if (GRP <> '') then V_SQL = V_SQL || ' and mats.grpid in (' || GRP || ') '^

  if (WID > 0) then V_SQL = V_SQL || ' and pr.wid=' || CAST(WID as varchar(10))^

  V_SQL = V_SQL || 'group by pr.matid, mats.grpid, mats.name, msr.shortname, mats.deleted, mats.artikul, mats.producer order by 3'^

  for execute statement v_sql
  into :MATID, :GRPID, :MATNAME, :MSRNAME, :DEL, :REST, :RSV, :SUMMREST, :ARTIKUL, :PRODUCER do
  begin
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
















ALTER PROCEDURE SP_GET_MAT_EXTRA (
    matid integer, ptypeid integer, ondate timestamp,price numeric(15,8),
    in_currid integer, onvalue numeric(15,8)
) returns (
    extra numeric(15,8), withnds integer, currid integer, currname varchar(24)
)
as
begin
end;

ALTER PROCEDURE SP_GET_MAT_EXTRA (
    matid integer,
    ptypeid integer,
    ondate timestamp,
    price numeric(15,8),
    in_currid integer,
    onvalue numeric(15,8))
returns (
    extra numeric(15,8),
    withnds integer,
    currid integer,
    currname varchar(24))
as
declare variable v_dis integer^
declare variable v_pptypeid integer^
declare variable v_extratype integer^
declare variable v_extra double precision^
declare variable v_res double precision^
declare variable v_onvalue double precision^
declare variable v_defcurrid integer^
BEGIN
  if (price is null) then price = 0^

  select extratype, onvalue, currid, dis, withnds, pptypeid
    from matprices where matid = :MATID and ptypeid = :PTYPEID
    into :v_extratype, :V_EXTRA, :currid, :v_DIS, :WITHNDS, :v_pptypeid^

  if (v_dis = 1) then begin
    extra = null^
    withnds = null^
    suspend^
    exit^
  end

  if (v_extratype is null) then begin
    select mgp.extratype, mgp.onvalue, mgp.currid, mgp.pptypeid
      from matgroupprices mgp, materials m
      where m.matid = :matid and m.grpid = mgp.grpid and mgp.ptypeid = :ptypeid
      into :v_extratype, :v_extra, :currid, :v_pptypeid^

    if (v_extratype is null) then begin
      select onvalue, pptypeid, extratype
        from pricetypes where ptypeid = :ptypeid
        into :v_extra, :v_pptypeid, :v_extratype^

      if (v_extratype is null) then v_extratype = 0^
    end
  end

  if (v_extratype = 1) then begin
    if ((:in_currid is null) or (:in_currid = :currid))
      then v_onvalue = 1^
      else begin
        select currid from currency where def=1 into v_defcurrid^

        if (:in_currid <> v_defcurrid) then begin
          select first 1 cr.onvalue from currencyrate cr
            where cr.currid = :in_currid
            order by cr.ondate desc
          into :v_onvalue^

          if (v_onvalue is null) then v_onvalue = 1^

          v_extra = v_extra / v_onvalue^
        end

        select first 1 cr.onvalue from currencyrate cr
          where cr.currid = :currid 
          order by cr.ondate desc
        into :v_onvalue^

        if (v_onvalue is null) then v_onvalue = 1^
      end

    v_res = v_extra * v_onvalue^
  end
  else begin
    if (v_pptypeid is null) then begin
      v_res = price * (100 + v_extra) / 100^
      withnds = 1^
    end
    else begin
      select extra, withnds, currid, currname
        from sp_get_mat_extra(:matid, :v_pptypeid, :ondate, :price, :in_currid, :onvalue)
        into :v_res, :WITHNDS, :currid, :currname^

      if (v_extratype = 2)
        then v_res = v_res * (100 + v_extra) / 100^
        else v_res = v_res * (100 - v_extra) / 100^
    end
  end

  extra = v_res^

  if (:currid is null)
    then select currid, shortname from currency where def = 1 into :currid, :currname^
    else if (:currname is null)
         then select shortname from currency where currid = :currid into :currname^

  suspend^
end;






ALTER PROCEDURE SP_SET_EXTPOSID (
    POSID INTEGER,
    SOURCEID INTEGER)
AS
DECLARE VARIABLE V_PPOSID INTEGER^
DECLARE VARIABLE V_WTYPE INTEGER^
begin
  if (POSID=SOURCEID) then begin
    select wbl.wtype from waybilllist wbl, waybilldet wbd
      where wbl.wbillid=wbd.wbillid and wbd.posid=:POSID
      into :V_WTYPE^

    if (V_WTYPE in(4,6)) then begin
      if (V_WTYPE=4) then begin
        select posid from wmatturn wmt
          where wmt.sourceid=:posid and wmt.posid<>wmt.sourceid
          into :V_PPOSID^
      end
      else if (V_WTYPE=6) then begin
        select pposid from returnrel where dposid=:posid into :V_PPOSID^
      end

      select wbl.wtype from waybilllist wbl, waybilldet wbd
        where wbl.wbillid=wbd.wbillid and wbd.posid=:V_PPOSID
        into :V_WTYPE^

      if (not :V_WTYPE in(4,6)) then begin
        insert into extrel (IntPosId, ExtPosId) values (:POSID, :V_PPOSID)^
      end
      else begin
        select ExtPosId from extrel where IntPosId=:V_PPOSID into :V_PPOSID^

        insert into extrel (IntPosId, ExtPosId) values (:POSID, :V_PPOSID)^

      end
    end
  end
end;
