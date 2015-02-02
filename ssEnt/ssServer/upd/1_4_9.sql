!NOERR!CREATE PROCEDURE SP_GET_ALL_MAT_PRICES (
    matid integer)
returns (
    prices varchar(2048),
    dis float
)
as
declare variable v_extra numeric(15,8)^
declare variable v_extratype integer^
declare variable v_ptypeid integer^
declare variable v_currid integer^
declare variable v_currname varchar(24)^
declare variable v_onvalue numeric(15,8)^
declare variable v_pptypeid integer^
declare variable v_price numeric(15,8)^
begin
  prices = ''^
  select currid,shortname from currency where def=1 into :v_currid,:v_currname^

  select FIRST 1 mr.avgprice
    from matremains mr
      where mr.matid=:matid order by ondate desc
      into v_price^

  for select ptypeid, onvalue, pptypeid, extratype from pricetypes WHERE DELETED=0
      into :v_ptypeid, :V_onvalue, :V_PPTYPEID, :V_EXTRATYPE
  do begin
    for select extra from sp_get_mat_extra(:matid, :v_ptypeid, now(), :v_price, :v_currid, 1) into :v_extra
    do begin
      prices = prices || cast(v_ptypeid as varchar(10))||'^'||
               cast(v_extra as varchar(24))||'^'||v_currname||'^'^
    end
  end

end;















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
    prices varchar(2048),
    archived integer,
    avgprice numeric(15,8)
)
as
declare variable v_sql varchar(1024)^
declare variable v_extratype integer^
declare variable v_ptypeid integer^
declare variable v_currname varchar(24)^
declare variable v_onvalue numeric(15,8)^
declare variable v_dis integer^
begin
  v_sql = 'select m.matid, m.name, m.artikul, m.mid, m.notes, m.grpid, m.wid, '||
          'm.num, cast(m.minreserv as numeric(15,8)), m.cid, m.demandcat, '||
          'cast(m.weight as numeric(15,8)), cast(m.msize as numeric(15,8)), m.producer, '||
          'm.barcode, 1 as mtype, ms.shortname, c.name as cname, m.archived'||
          ' from materials m join measures ms on m.mid=ms.mid'||
          ' left outer join countries c on c.cid=m.cid where m.deleted=0'^
  if (GETARCHIVED = 0) then v_sql = v_sql||' and m.archived=0'^
  if (grp <> '') then v_sql = v_sql||' and m.grpid in ('||grp||')'^

  v_sql = v_sql||' order by m.num'^

  for execute statement v_sql
    into :MATID, :NAME, :ARTIKUL, :MID, :NOTES, :GRPID, :WID, :NUM, :MINRESERV,
         :CID, :DEMANDCAT, :WEIGHT, :MSIZE, :PRODUCER, :BARCODE, :MTYPE, :SHORTNAME,
         :CNAME, :ARCHIVED do
  begin
    select FIRST 1 mr.avgprice
      from matremains mr
        where mr.matid=:matid order by ondate desc
          into avgprice^

    if (GETPRICE = 1) then begin
      execute procedure SP_GET_ALL_MAT_PRICES(:MATID) RETURNING_VALUES prices,v_dis^
    end
    suspend^
  end
end;
















ALTER PROCEDURE SP_WMAT_GET (
    grpid integer,
    wid integer,
    kaid integer,
    ondate timestamp,
    getempty integer,
    wh varchar(1024),
    allwh integer,
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
    prices varchar(2048),
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

    execute procedure SP_GET_ALL_MAT_PRICES(:MATID) RETURNING_VALUES PRICES, DIS^


    if ((remain > 0) or (ordered > 0) or ((getempty = 1) and (v_ondate is not null)) or (showallmats = 1))
      then suspend^
  end
end;






