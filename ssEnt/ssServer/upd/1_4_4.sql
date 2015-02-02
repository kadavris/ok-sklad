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
   wbdap.cardid, cast(dc.num as varchar(24)), dch.name, s.serialno
  from WAYBILLDET wbd
   join MATERIALS mat on mat.matid=wbd.matid
   join MEASURES msr on msr.mid=mat.mid
   join WAREHOUSE wh on wh.wid=wbd.wid
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
    GRPNAME VARCHAR(128),
    MSRCODE VARCHAR(14),
    NOTES VARCHAR(255))
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
   cast(mat.msize as numeric(15,8)), cast(mg.name as varchar(128)), msr.code,
   mat.notes, s.serialno
  from WAYBILLDET wbd
   join MATERIALS mat on mat.matid=wbd.matid
   join matgroup mg on mg.grpid=mat.grpid
   join MEASURES msr on msr.mid=mat.mid
   join WAREHOUSE wh on wh.wid=wbd.wid
   join currency curr on curr.currid=wbd.currid
   left join countries c on c.cid=mat.cid
   left join waybilldetaddprops wbdap on wbdap.posid=wbd.posid
   left join serials s on s.posid=wbd.posid
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
   cast(0 as numeric(15,8)), cast(0 as numeric(15,8)), cast(sg.name as varchar(128)),
   ms.code, cast('' as varchar(255)), cast('' as varchar(64))
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
        :WPERIOD, :WPERIODTYPE, :PRODUCER, :MWEIGHT, :MSIZE, :GRPNAME, :MSRCODE,
        :NOTES, :SN do
  begin
    tax = ''^
    for select taxid, onvalue
      from waybilldettaxes where posid=:POSID
     into :v_taxid, :v_onvalue do
    begin
      tax = tax||cast(v_taxid as varchar(10))||','||cast(formatfloat(v_onvalue, -3) as varchar(10))||'^'^
    end

    if ((V_SN = 1) and (SN is null)) then begin
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













ALTER PROCEDURE SP_SET_EXTPOSID (
    POSID INTEGER,
    SOURCEID INTEGER)
AS
DECLARE VARIABLE V_PPOSID INTEGER^
DECLARE VARIABLE V_WTYPE INTEGER^
DECLARE VARIABLE V_SN VARCHAR(255)^
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
        select pposid from returnrel
        where dposid=:posid
        into :V_PPOSID^
      end

      select wbl.wtype from waybilllist wbl, waybilldet wbd
       where wbl.wbillid=wbd.wbillid and wbd.posid=:V_PPOSID
       into :V_WTYPE^

      if (not :V_WTYPE in(4,6)) then begin
        insert into extrel (IntPosId, ExtPosId) values (:POSID, :V_PPOSID)^
      end
      else begin
        select ExtPosId
         from extrel
         where IntPosId=:V_PPOSID
         into :V_PPOSID^

        insert into extrel (IntPosId, ExtPosId) values (:POSID, :V_PPOSID)^

      end
    end
  end
  else begin
    select wbl.wtype from waybilllist wbl, waybilldet wbd
    where wbl.wbillid=wbd.wbillid
    and wbd.posid=:SOURCEID
    into :V_WTYPE^
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
    if (valueinstr(:wh, :wid) = 1) then begin
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

