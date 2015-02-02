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
    prices varchar(255),
    dis float
)
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
    for select mp.extratype, mp.onvalue, c.shortname, mp.ptypeid, mp.pptypeid, mp.dis
      from matprices mp left join currency c on c.currid=mp.currid
      where mp.matid=:matid
       into :v_extratype, :v_onvalue, :v_currname, :v_ptypeid, :v_pptypeid, DIS do
    begin
      PRICES = PRICES||cast(v_ptypeid as varchar(10))||'^'^
      if (v_extratype = 0) then PRICES = PRICES||cast(v_onvalue as varchar(24))||'^'||'^'^
      else if (v_extratype = 1) then PRICES = PRICES||cast(v_onvalue as varchar(24))||'^'||v_currname||'^'^
      else if (v_extratype = 2) then PRICES = PRICES||cast(v_onvalue as varchar(24))||
        '^PPTYPE:'||cast(v_extratype as varchar(24))||'/'||cast(v_pptypeid as varchar(24))||'^'^
    end

    if ((remain > 0) or (ordered > 0) or ((getempty = 1) and (v_ondate is not null)) or (showallmats = 1))
      then suspend^
  end
end;

GRANT SELECT ON MATREMAINS TO PROCEDURE SP_WMAT_GET;
GRANT SELECT ON POSREMAINS TO PROCEDURE SP_WMAT_GET;
GRANT SELECT ON WAYBILLDET TO PROCEDURE SP_WMAT_GET;
GRANT SELECT ON WAYBILLLIST TO PROCEDURE SP_WMAT_GET;
GRANT SELECT ON EXTREL TO PROCEDURE SP_WMAT_GET;
GRANT SELECT ON MATPRICES TO PROCEDURE SP_WMAT_GET;
GRANT SELECT ON CURRENCY TO PROCEDURE SP_WMAT_GET;

GRANT EXECUTE ON PROCEDURE SP_WMAT_GET TO PUBLIC;
GRANT EXECUTE ON PROCEDURE SP_WMAT_GET TO SYSDBA;
GRANT EXECUTE ON PROCEDURE SP_WMAT_GET TO USERS;









ALTER PROCEDURE SP_REP_25 (
    FROMDATE TIMESTAMP,
    TODATE TIMESTAMP,
    WID INTEGER,
    GRPID VARCHAR(1024),
    KAID INTEGER,
    PTYPEID INTEGER,
    GRPBY INTEGER,
    WH VARCHAR(1024),
    ALLWH INTEGER)
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
  if (ALLWH = 0) then v_sql = v_sql||' and wmt.wid in ('||WH||')'^
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







ALTER TABLE MATGROUPPRICES ADD WITHNDS INTEGER;
ALTER TABLE MATGROUPPRICES ADD DIS INTEGER NOT NULL;








ALTER TABLE USERTREEVIEW DROP CONSTRAINT FK_USERTREE_FK_USERTR_FUNCTION;
ALTER TABLE USERTREEVIEW ADD CONSTRAINT FK_USERTREE_FK_USERTR_FUNCTION
 FOREIGN KEY (FUNID) REFERENCES FUNCTIONS (FUNID)
 ON UPDATE CASCADE
 using index FK_USERTREE_FK_USERTR_FUNCTION;





alter table USERACCESS drop constraint FK_USERACCE_FK_USERAC_FUNCTION;

alter table USERACCESS add constraint FK_USERACCE_FK_USERAC_FUNCTION
 foreign key (FUNID) references FUNCTIONS(FUNID)
 on update CASCADE
 using index FK_USERACCE_FK_USERAC_FUNCTION;





ALTER TABLE USERACCESS ADD CANPOST INTEGER DEFAULT 1 NOT NULL;

ALTER TABLE FUNCTIONS ADD FLAGS INTEGER DEFAULT 0 NOT NULL;







ALTER PROCEDURE SP_WBD_GET_OUT (
    awbillid integer)
returns (
    num integer,
    posid integer,
    wbillid integer,
    matid integer,
    wid integer,
    amount numeric(15,8),
    price numeric(15,8),
    discount numeric(15,8),
    nds numeric(15,8),
    currid integer,
    ondate timestamp,
    ptypeid integer,
    checked integer,
    matname varchar(255),
    msrname varchar(10),
    whname varchar(128),
    artikul varchar(255),
    currname varchar(10),
    onvalue numeric(15,8),
    postype integer,
    norm numeric(15,8),
    producer varchar(128),
    gtd varchar(64),
    certnum varchar(64),
    certdate timestamp,
    tax varchar(255),
    sn varchar(1000),
    barcode varchar(64),
    wperiod integer,
    wperiodtype integer,
    grpid integer,
    country varchar(128),
    cardid integer,
    holder varchar(64),
    cardnum varchar(24),
    rsv integer)
as
declare variable v_taxid integer^
declare variable v_onvalue numeric(15,8)^
declare variable v_sn integer^
declare variable serialno varchar(64)^
declare variable v_rsv numeric(15,8)^
begin
  for select wbd.num, wbd.posid, wbd.wbillid, wbd.matid, wbd.wid, wbd.amount, wbd.price,
   wbd.discount, wbd.nds, wbd.currid, wbd.ondate, wbd.ptypeid, wbd.checked,
   mat.name, msr.shortname, wh.name, mat.artikul, curr.shortname, cast(wbd.onvalue as numeric(15,8)),
   cast(0 as integer) as postype, cast(0 as NUMERIC(15,8)) as norm,
   wbdap.producer, wbdap.gtd, wbdap.certnum, wbdap.certdate, mat.serials, mat.barcode,
   wbdap.warrantyperiod, wbdap.warrantyperiodtype, mat.grpid, c.name,
   wbdap.cardid, cast(dc.num as varchar(24)), dch.name, s.serialno
  from WAYBILLDET wbd
   join MATERIALS mat on mat.matid=wbd.matid
   join MEASURES msr on msr.mid=mat.mid
   left outer join WAREHOUSE wh on wh.wid=wbd.wid
   left outer join currency curr on curr.currid=wbd.currid
   left outer join waybilldetaddprops wbdap on wbdap.posid=wbd.posid
   left outer join countries c on c.cid=mat.cid
   left outer join disccards dc on wbdap.cardid=dc.cardid
   left outer join kagent dch on dch.kaid=dc.kaid
   left outer join serials s on s.posid=wbd.posid
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
    cast('' as varchar(64)), cast('' as varchar(64))
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
        :HOLDER, :SN
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

    if ((V_SN = 1) and (sn is null)) then begin
      SN = ''^
      for select s.serialno
        from wmatturn wmt, serials s
        where wmt.sourceid=:POSID and s.posid=wmt.posid
       into :SERIALNO do
      begin
        if (SN <> '') then SN = SN||', '^
        SN = SN||:SERIALNO^
      end
    end

    suspend^
  end
end;

GRANT SELECT ON WAYBILLDET TO PROCEDURE SP_WBD_GET_OUT;
GRANT SELECT ON MATERIALS TO PROCEDURE SP_WBD_GET_OUT;
GRANT SELECT ON MEASURES TO PROCEDURE SP_WBD_GET_OUT;
GRANT SELECT ON WAREHOUSE TO PROCEDURE SP_WBD_GET_OUT;
GRANT SELECT ON CURRENCY TO PROCEDURE SP_WBD_GET_OUT;
GRANT SELECT ON WAYBILLDETADDPROPS TO PROCEDURE SP_WBD_GET_OUT;
GRANT SELECT ON COUNTRIES TO PROCEDURE SP_WBD_GET_OUT;
GRANT SELECT ON DISCCARDS TO PROCEDURE SP_WBD_GET_OUT;
GRANT SELECT ON KAGENT TO PROCEDURE SP_WBD_GET_OUT;
GRANT SELECT ON SERIALS TO PROCEDURE SP_WBD_GET_OUT;
GRANT SELECT ON WAYBILLSVC TO PROCEDURE SP_WBD_GET_OUT;
GRANT SELECT ON SERVICES TO PROCEDURE SP_WBD_GET_OUT;
GRANT SELECT ON WAYBILLLIST TO PROCEDURE SP_WBD_GET_OUT;
GRANT SELECT ON WMATTURN TO PROCEDURE SP_WBD_GET_OUT;
GRANT SELECT ON WAYBILLDETTAXES TO PROCEDURE SP_WBD_GET_OUT;

GRANT EXECUTE ON PROCEDURE SP_WBD_GET_OUT TO PUBLIC;
GRANT EXECUTE ON PROCEDURE SP_WBD_GET_OUT TO SYSDBA;
GRANT EXECUTE ON PROCEDURE SP_WBD_GET_OUT TO USERS;
