update rdb$function_arguments set rdb$field_length=1024
 where rdb$function_name=upper('VALUEINSTR') and rdb$argument_position=1;



CREATE GENERATOR GEN_ORDERIN;
CREATE GENERATOR GEN_ORDEROUT;



ALTER TABLE REPORTS ADD NUM INTEGER;
ALTER TABLE WAYBILLDETADDPROPS ADD NOTES VARCHAR(255);



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

execute procedure sp_fix_fk('TAXWB', 'TAXWBDET');
drop procedure sp_fix_fk;






alter table taxwbdet add constraint fk_taxwbdet_twbid foreign key (twbid) references taxwb(twbid) on delete cascade;


ALTER TABLE MATREMAINS ADD ORSV NUMERIC(15,8);


ALTER TABLE KAGENT ADD ARCHIVED INTEGER;





ALTER PROCEDURE SP_WB_LIST (
    IN_FROMDATE TIMESTAMP,
    IN_TODATE TIMESTAMP,
    IN_WTYPE INTEGER,
    IN_CHECKED INTEGER,
    IN_KAID INTEGER,
    WH VARCHAR(1024),
    ALLWH INTEGER,
    SHOWNULLBALANCE INTEGER)
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
     and wbl.wtype=:in_wtype
     and wbl.ondate between :in_fromdate and :in_todate
     and (wbl.kaid=:in_kaid or :in_kaid=0)
     and (wbl.checked=:in_checked or :in_checked=-1)
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







CREATE PROCEDURE SP_REP_25 (
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
          ' mats.artikul, mats.barcode, ka.kaid, ka.name,'^

  v_sql = v_sql||' cast(sum(wmt.amount) as numeric(15,8)),'||
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
       :KAID_, :KANAME, :AMOUNT, PRICE do
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






ALTER PROCEDURE SP_GET_RELDOCLIST (
    ADOCID INTEGER)
RETURNS (
    DOCID INTEGER,
    DOCTYPE INTEGER,
    NUM VARCHAR(20),
    ONDATE TIMESTAMP,
    CHECKED INTEGER,
    DELETED INTEGER,
    SUMM NUMERIC(15,2),
    SHORTNAME VARCHAR(10),
    CURRID INTEGER
)
AS
DECLARE VARIABLE V_DOCID INTEGER^
DECLARE VARIABLE V_DOCTYPE INTEGER^
begin
  for select docid, doctype from sp_get_reldocids(:ADOCID)
      into :V_DOCID,:V_DOCTYPE
  do begin
    DOCID=:V_DOCID^
    DOCTYPE=:V_DOCTYPE^
    SHORTNAME = ''^
    CURRID=null^

    if (:DOCTYPE in(-1,1,2,4,5,-5,6,-6,7,-9,16,-16)) then begin
      select wbl.num, wbl.ondate, wbl.summincurr, wbl.checked, wbl.deleted, c.currid, c.shortname
      from waybilllist wbl left outer join currency c on c.currid=wbl.currid
      where docid=:DOCID
      into :NUM, :ONDATE, :SUMM, :CHECKED, :DELETED, :CURRID, :SHORTNAME^
    end 
    else if (:DOCTYPE in(-2,-3,3)) then begin
       select pd.docnum, pd.ondate, pd.total, pd.checked, pd.deleted, pd.currid, c.shortname
         from paydoc pd, currency c where pd.docid=:DOCID and c.currid=pd.currid
       into :NUM, :ONDATE, :SUMM, :CHECKED, :DELETED, :CURRID, :SHORTNAME^
    end 
    else if (:DOCTYPE in(-7)) then begin
       select num, ondate, summall, checked, deleted from taxwb where docid=:DOCID
       into :NUM, :ONDATE, :SUMM, :CHECKED, :DELETED^
    end 
    else if (:DOCTYPE in(8,-8)) then begin
      select cnt.num, cnt.ondate, cp.summ, cnt.checked, cnt.deleted, c.currid, c.shortname
      from contracts cnt
      left outer join contrparams cp on cp.docid=cnt.docid
      left outer join currency c on c.currid=cnt.currid
      where cnt.docid=:DOCID
      into :NUM, :ONDATE, :SUMM, :CHECKED, :DELETED,:CURRID,:SHORTNAME^
    end
    else if (:DOCTYPE in(10)) then begin
      select pl.name, pl.ondate, null, null, pl.deleted, pl.currid, c.shortname
      from pricelist pl left outer join currency c on c.currid=pl.currid
      where docid=:DOCID
      into :NUM, :ONDATE, :SUMM, :CHECKED, :DELETED, :CURRID, :SHORTNAME^
    end 
    suspend^
  end
end;







CREATE TABLE POSREL (
    POSID   INTEGER NOT NULL,
    CPOSID  INTEGER NOT NULL
);

ALTER TABLE POSREL ADD CONSTRAINT FK_POSREL_CPOSID FOREIGN KEY (CPOSID) REFERENCES WAYBILLDET (POSID) ON DELETE CASCADE;
ALTER TABLE POSREL ADD CONSTRAINT FK_POSREL_POSID FOREIGN KEY (POSID) REFERENCES WAYBILLDET (POSID) ON DELETE CASCADE;

GRANT ALL ON POSREL TO PUBLIC;
GRANT ALL ON POSREL TO USERS;







CREATE PROCEDURE SP_WMATTURN_UPD (
    WBILLID INTEGER,
    TURNTYPE INTEGER)
AS
declare variable v_posid integer^
begin
  for select posid from waybilldet where wbillid=:wbillid
    into :v_posid do
   update wmatturn set turntype=:turntype where sourceid=:v_posid^
end;

grant execute on procedure sp_wmatturn_upd to public;
grant execute on procedure sp_wmatturn_upd to users;










CREATE PROCEDURE SP_ORDER_UPD_RSV (
    WBILLID INTEGER)
AS
declare variable v_posid integer^
declare variable v_cposid integer^
begin
  for select pr.posid, pr.cposid from waybilldet wbd, posrel pr
    where wbd.wbillid=:wbillid and wbd.posid=pr.cposid
    into :v_posid, :v_cposid do
  begin
   update wmatturn set posid=:v_posid, sourceid=:v_posid
    where posid=:v_cposid and turntype=3^
   delete from posremains where posid=:v_cposid^
  end
end;

grant execute on procedure sp_order_upd_rsv to public;
grant execute on procedure sp_order_upd_rsv to users;








CREATE PROCEDURE SP_ORDERED_GET (
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
    if (valueinstr(:wh, :wid) = 1) then begin
      if (((remain > 0) or (getempty = 1)) and (((w_id = 0) or (wid = w_id)) and ((kaid = 0) or (kaid = v_kaid))))
        then suspend^
    end
  end
end;

grant execute on procedure sp_ordered_get to public;
grant execute on procedure sp_ordered_get to users;






ALTER PROCEDURE SP_WBD_GET_ACC (AWBILLID INTEGER)
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
    SHIPPEDAMOUNT NUMERIC(15,8),
    RSVAMOUNT NUMERIC(15,8),
    BARCODE VARCHAR(64),
    GRPID INTEGER,
    RSV INTEGER)
AS
DECLARE VARIABLE V_TAXID INTEGER^
DECLARE VARIABLE V_ONVALUE NUMERIC(15,8)^
DECLARE VARIABLE V_SN INTEGER^
DECLARE VARIABLE SERIALNO VARCHAR(64)^
DECLARE VARIABLE RSV_SUM DOUBLE PRECISION^
begin
  for select wbd.num, wbd.posid, wbd.wbillid, wbd.matid, wbd.wid, wbd.amount,
   wbd.price, wbd.discount, wbd.nds, wbd.currid, wbd.ondate, wbd.ptypeid,
   wbd.checked, mat.name, msr.shortname, wh.name, mat.artikul, curr.shortname,
   wbd.onvalue, cast(0 as integer), cast(0 as NUMERIC(15,8)), wbdap.producer,
   wbdap.gtd, wbdap.certnum, wbdap.certdate, mat.serials, 
   cast(acd.shippedamount as numeric(15,8)), cast(acd.rsvamount as numeric(15,8)),
   mat.barcode, mat.grpid
  from WAYBILLDET wbd
   join MATERIALS mat on mat.matid=wbd.matid
   join MEASURES msr on msr.mid=mat.mid
   join WAREHOUSE wh on wh.wid=wbd.wid
   join currency curr on curr.currid=wbd.currid
   left outer join accoutdet acd on acd.posid=wbd.posid
   left outer join waybilldetaddprops wbdap on wbdap.posid=wbd.posid
  where wbd.WBILLID=:AWBILLID
     union all
  select wbs.num, -wbs.posid, wbs.wbillid, s.svcid, cast(0 as integer),
   wbs.amount, wbs.price, wbs.discount, wbs.nds, wbs.currid, wbl.ondate,
   cast(0 as integer), 0, cast(s.name as varchar(255)), ms.shortname, cast('' as varchar(64)),
   cast(s.artikul as varchar(255)), c.shortname, cast(wbl.onvalue as numeric(15,8)), 1, cast(wbs.norm as numeric(15,8)),
   cast('' as varchar(255)), cast('' as varchar(64)), cast('' as varchar(64)),
   cast(null as timestamp), 0, acs.amount,
   cast(null as NUMERIC(15,8)), cast('' as VARCHAR(64)), 0
  from waybillsvc wbs
   join services s on s.svcid=wbs.svcid
   join measures ms on ms.mid=s.mid
   join waybilllist wbl on wbl.wbillid=wbs.wbillid
   join currency c on c.currid=wbs.currid
   left outer join accoutsvc acs on acs.posid=wbs.posid
  where wbs.wbillid=:awbillid
  order by 1
   into :NUM, :POSID, :WBILLID, :MATID, :WID, :AMOUNT, :PRICE, :DISCOUNT, :NDS,
        :CURRID, :ONDATE, :PTYPEID, :CHECKED, :MATNAME, :MSRNAME, :WHNAME, :ARTIKUL,
        :CURRNAME, :ONVALUE, :POSTYPE, :NORM, :PRODUCER, :GTD, :CERTNUM, :CERTDATE,
        :V_SN, :SHIPPEDAMOUNT, :RSVAMOUNT, :BARCODE, :GRPID
  do begin
    RSV = 0^
    if (POSID > 0) then begin
      select sum(amount) from wmatturn where sourceid=:POSID and turntype=2
       into :RSV_SUM^
      if (RSV_SUM > 0) then RSV = 1^
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
   join currency curr on curr.currid=wbd.currid
   left outer join waybilldetaddprops wbdap on wbdap.posid=wbd.posid
   left outer join countries c on c.cid=mat.cid
   left outer join disccards dc on wbdap.cardid=dc.cardid
   left outer join kagent dch on dch.kaid=dc.kaid
  where wbd.WBILLID=:AWBILLID
   union all
  select wbs.num, -wbs.posid, wbl.wbillid, s.svcid, cast(0 as integer), wbs.amount, wbs.price,
    wbs.discount, wbs.nds, wbs.currid, wbl.ondate, cast(0 as integer), 0, cast(s.name as varchar(255)),
    ms.shortname, cast('' as varchar(64)), cast(s.artikul as varchar(255)),
    c.shortname, cast(wbl.onvalue as numeric(15,8)), 1, cast(wbs.norm as numeric(15,8)), cast('' as varchar(255)),
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
    ORSV NUMERIC(15,8))
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

  for select m.num, m.matid, m.name, m.artikul, ms.shortname, mg.name, m.barcode,
    c.name, m.producer, m.minreserv
   from materials m
    join measures ms on ms.mid=m.mid
    join matgroup mg on m.grpid=mg.grpid
    left outer join countries c on m.cid=c.cid
   where ((m.grpid=:grpid) or (:grpid=0)) and m.archived=0
   order by m.num
  into :num, :matid, :matname, :artikul, :msrname, :grpname, :barcode,
       :country, :producer, :minreserv do
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
    if ((remain > 0) or (ordered > 0) or ((getempty = 1) and (v_ondate is not null)) or (showallmats = 1))
      then suspend^
  end
end;

ALTER PROCEDURE SP_RECALC_REMAINS (
    POSID INTEGER,
    MATID INTEGER,
    WID INTEGER,
    ONDATE TIMESTAMP,
    AFTERDEL INTEGER)
AS
DECLARE VARIABLE V_ONDATE TIMESTAMP^
DECLARE VARIABLE V_TOTAL_REMAIN DOUBLE PRECISION^
DECLARE VARIABLE V_POSID INTEGER^
DECLARE VARIABLE V_TOTAL_SUM DOUBLE PRECISION^
DECLARE VARIABLE V_PRICE DOUBLE PRECISION^
DECLARE VARIABLE V_REMAIN DOUBLE PRECISION^
DECLARE VARIABLE V_RSV DOUBLE PRECISION^
DECLARE VARIABLE V_ORSV DOUBLE PRECISION^
DECLARE VARIABLE V_ORDERED DOUBLE PRECISION^
DECLARE VARIABLE V_NEXTDATE TIMESTAMP^
DECLARE VARIABLE V_AVGPRICE DOUBLE PRECISION^
DECLARE VARIABLE V_MINPRICE DOUBLE PRECISION^
DECLARE VARIABLE V_MAXPRICE DOUBLE PRECISION^
DECLARE VARIABLE V_CURRID INTEGER^
DECLARE VARIABLE V_CURRDATE TIMESTAMP^
DECLARE VARIABLE V_CURRVALUE DOUBLE PRECISION^
DECLARE VARIABLE V_COUNT INTEGER^
DECLARE VARIABLE V_POSEXISTS INTEGER^
DECLARE VARIABLE V_PRICEMODIFIED INTEGER^
begin
  V_ONDATE = extractdate(:ONDATE)^
  V_NEXTDATE = incdate(:V_ONDATE)^
  delete from matremains where matid=:MATID and ondate=:V_ONDATE^
  delete from posremains where posid=:POSID and ondate=:V_ONDATE^
  V_TOTAL_REMAIN = 0^
  V_TOTAL_SUM = 0^
  V_MINPRICE = 1000000000^
  V_MAXPRICE = -1000000000^
  V_POSEXISTS = 0^
  V_PRICEMODIFIED = 0^
  for select sum(wm.amount*
   (case
     when wm.turntype = 3 then 0
     else wm.turntype
    end)
   /abs(wm.turntype)), wbd.posid, wbd.price, wbd.currid, wbd.ondate, wbd.onvalue
   from wmatturn wm, waybilldet wbd
   where wm.posid=wbd.posid
    and wm.matid=:MATID
    and wm.ondate<:V_NEXTDATE
    and wm.turntype in (1, -1, 3)
   group by wbd.posid, wbd.price, wbd.currid, wbd.ondate, wbd.onvalue
  into :V_REMAIN, :V_POSID, :V_PRICE, :V_CURRID, :V_CURRDATE, :V_CURRVALUE
  do begin
    if (V_CURRVALUE is null) then V_CURRVALUE = 1^
    V_PRICE = V_PRICE * V_CURRVALUE^
    if (V_POSID = POSID) then begin
      select coalesce(sum(amount), 0) from wmatturn
        where posid=:POSID and turntype=2 and ondate<:V_NEXTDATE
        into :V_RSV^
      select coalesce(sum(amount), 0) from wmatturn
        where posid=:POSID and turntype=3 and ondate<:V_NEXTDATE
        into :V_ORDERED^
      V_COUNT = 0^
      select count(posid) from wmatturn where posid=:POSID and ondate between :V_ONDATE and :V_NEXTDATE
        into :V_COUNT^
      if ((V_COUNT > 0) or (AFTERDEL = 0)) then begin
        insert into posremains (posid, wid, matid, ondate, remain, rsv, avgprice, ordered)
        values (:POSID, :WID, :MATID, :V_ONDATE, :V_REMAIN, :V_RSV, :V_PRICE, :V_ORDERED)^
      end
    end
    V_TOTAL_REMAIN = V_TOTAL_REMAIN + :V_REMAIN^
    V_TOTAL_SUM = V_TOTAL_SUM + :V_REMAIN * :V_PRICE^
    if (V_REMAIN > 0) then begin
      V_PRICEMODIFIED = 1^
      if (V_MINPRICE > V_PRICE) then V_MINPRICE = V_PRICE^
      if (V_MAXPRICE < V_PRICE) then V_MAXPRICE = V_PRICE^
    end
    V_POSEXISTS = 1^
  end

  select coalesce(sum(wmt.amount), 0)
    from wmatturn wmt, waybilldet wbd, waybilllist wbl
    where wmt.matid=:MATID and wmt.ondate<:V_NEXTDATE
     and wmt.turntype=2 and wbd.posid=wmt.posid
     and wbl.wbillid=wbd.wbillid and wbl.wtype<>16
    into :V_RSV^

  select coalesce(sum(wmt.amount), 0)
    from wmatturn wmt, waybilldet wbd, waybilllist wbl
    where wmt.matid=:MATID and wmt.ondate<:V_NEXTDATE
     and wmt.turntype=2 and wbd.posid=wmt.posid
     and wbl.wbillid=wbd.wbillid and wbl.wtype=16
    into :V_ORSV^

  select coalesce(sum(amount), 0) from wmatturn
    where matid=:MATID and ondate<:V_NEXTDATE and turntype=3
    into :V_ORDERED^

  if (V_TOTAL_REMAIN = 0) then V_AVGPRICE = 0^
    else V_AVGPRICE = V_TOTAL_SUM / V_TOTAL_REMAIN^
  V_COUNT = 0^
  select count(posid) from posremains where matid=:MATID and ondate=:V_ONDATE
   into :V_COUNT^
  if (V_PRICEMODIFIED = 0) then begin
    V_MINPRICE = 0^
    V_MAXPRICE = 0^
  end
  if ((V_COUNT > 0) or (AFTERDEL = 0)) then begin
    if (V_POSEXISTS = 0) then begin
      V_MINPRICE = 0^
      V_MAXPRICE = 0^
    end
    insert into matremains (matid, ondate, remain, rsv, avgprice, minprice, maxprice, ordered, orsv)
      values (:MATID, :V_ONDATE, :V_TOTAL_REMAIN, :V_RSV, :V_AVGPRICE, :V_MINPRICE, :V_MAXPRICE, :V_ORDERED, :V_ORSV)^
  end
end;

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
    ARCHIVED INTEGER)
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
   mat.grpid, c.name, mat.archived, s.serialno
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
    cast('' as varchar(64)), 0, cast('' as varchar(128)), 0, cast('' as varchar(64))
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
        :v_sn, :barcode, :grpid, :country, :archived, :sn
  do begin
    suspend^
  end
end;

CREATE PROCEDURE SP_ORDERED_LIST (
    IN_FROMDATE TIMESTAMP,
    IN_TODATE TIMESTAMP,
    IN_MATID INTEGER,
    IN_KAID INTEGER,
    IN_WTYPE INTEGER,
    IN_ACTIVE INTEGER)
RETURNS (
    POSID INTEGER,
    WBILLID INTEGER,
    WTYPE INTEGER,
    NUM VARCHAR(24),
    ONDATE TIMESTAMP,
    TODATE TIMESTAMP,
    KAID INTEGER,
    KANAME VARCHAR(255),
    WID INTEGER,
    WHNAME VARCHAR(128),
    MATID INTEGER,
    MATNAME VARCHAR(255),
    ARTIKUL VARCHAR(255),
    AMOUNT NUMERIC(15,8),
    PRICE NUMERIC(15,8),
    ONVALUE NUMERIC(15,8),
    CURRID INTEGER,
    SHORTNAME VARCHAR(15),
    CHECKED INTEGER,
    MEASURE VARCHAR(15),
    DOCID INTEGER)
AS
DECLARE VARIABLE V_SQL VARCHAR(2000)^
begin
  v_sql = 'select wbd.posid, wbl.wbillid, wbl.wtype, wbl.num, wbl.ondate, wbl.docid, '||
          '  ka.kaid, ka.name, w.wid, w.name, m.matid, m.name, m.artikul, '||
          '  cast(wbd.amount as numeric(15,8)), wbl.todate, cast(wbd.price as numeric(15,8)),'||
          '  cast(wbd.onvalue as numeric(15,8)), wbd.currid, c.shortname, wbl.checked, ms.shortname'||
          ' from waybilldet wbd'||
          ' join waybilllist wbl on wbl.wbillid=wbd.wbillid'||
          ' join warehouse w on w.wid=wbd.wid'||
          ' join materials m on m.matid=wbd.matid'||
          ' join measures ms on ms.mid=m.mid'||
          ' left join kagent ka on ka.kaid=wbl.kaid'||
          ' left join currency c on c.currid=wbd.currid'||
          ' where wbl.ondate between '''||cast(:in_fromdate as varchar(24))||''' and '''||cast(:in_todate as varchar(24))||''''^
  if (IN_MATID <> 0) then v_sql = v_sql||' and m.matid='||cast(IN_MATID as VARCHAR(15))^
  if (IN_KAID <> 0) then v_sql = v_sql||' and ka.kaid='||cast(IN_KAID as VARCHAR(15))^
  if (IN_ACTIVE = 1) then v_sql = v_sql||' and wbl.checked<>1 '^
  if (IN_WTYPE <> 0)
    then v_sql = v_sql||' and wbl.wtype='||cast(IN_WTYPE as varchar(5))^
    else v_sql = v_sql||' and wbl.wtype in (16,-16)'^
  for execute statement v_sql
  into :POSID, :WBILLID, :WTYPE, :NUM, :ONDATE, :DOCID, :KAID, :KANAME, :WID, :WHNAME,
       :MATID, :MATNAME, :ARTIKUL, :AMOUNT, :TODATE, :PRICE, :ONVALUE, :CURRID,
       :SHORTNAME, :CHECKED, :MEASURE
  do begin
    suspend^
  end
end;

grant execute on procedure sp_ordered_list to public;
grant execute on procedure sp_ordered_list to users;

CREATE PROCEDURE SP_GET_POS_STATUS (
    WBILLID INTEGER)
RETURNS (
    RES INTEGER)
AS
DECLARE VARIABLE V_TYPE INTEGER^
begin
  RES = 0^

  for select wmt2.turntype
    from wmatturn wmt, waybilldet wbd, wmatturn wmt2
    where wbd.wbillid=:WBILLID and wbd.posid=wmt.sourceid
     and wmt2.posid=wmt.posid and wmt2.posid=wmt2.sourceid
   into :v_type do
  begin
    if (v_type <> 1) then begin
      RES = 1^
      suspend^ exit^
    end
  end
  suspend^
end;

grant execute on procedure sp_get_pos_status to public;
grant execute on procedure sp_get_pos_status to users;

drop trigger waybilllist_ai;
CREATE TRIGGER WAYBILLLIST_AI FOR WAYBILLLIST
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
  if (NEW.wtype = 2) then funid = 30^
  if (funid = 0) then exit^
  insert into operlog (username, opcode, ondate, tabid, id, databefore, dataafter, funid, docnum)
    values (CURRENT_USER, 'I', current_timestamp, 24, NEW.wbillid, null,
     NEW.num||'^'||extract(day from NEW.ondate)||'.'||extract(month from NEW.ondate)||'.'||extract(year from NEW.ondate)||' '||extract(hour from NEW.ondate)||':'||extract(minute from NEW.ondate)||':'||extract(second from NEW.ondate)||'^'||cast(NEW.wtype as varchar(2))||'^'||cast(NEW.summall as varchar(24))||'^'||:v_kaname, :funid, NEW.num)^
END;

drop trigger waybilllist_au;
CREATE TRIGGER WAYBILLLIST_AU FOR WAYBILLLIST
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
  if (NEW.wtype = 2) then funid = 30^
  if (funid = 0) then Exit^
  insert into operlog (username, opcode, ondate, tabid, id, databefore, dataafter, funid, docnum)
    values (CURRENT_USER, 'U', current_timestamp, 24, NEW.wbillid,
     OLD.num||'^'||extract(day from OLD.ondate)||'.'||extract(month from OLD.ondate)||'.'||extract(year from OLD.ondate)||' '||extract(hour from OLD.ondate)||':'||extract(minute from OLD.ondate)||':'||extract(second from OLD.ondate)||'^'||cast(OLD.wtype as varchar(2))||'^'||cast(OLD.summall as varchar(20))||'^'||:v_kaname,
     NEW.num||'^'||extract(day from NEW.ondate)||'.'||extract(month from NEW.ondate)||'.'||extract(year from NEW.ondate)||' '||extract(hour from NEW.ondate)||':'||extract(minute from NEW.ondate)||':'||extract(second from NEW.ondate)||'^'||cast(NEW.wtype as varchar(2))||'^'||cast(NEW.summall as varchar(20))||'^'||:v_kaname, :funid, NEW.num)^
END;

drop trigger waybilllist_ad;
CREATE TRIGGER WAYBILLLIST_AD FOR WAYBILLLIST
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
  if (OLD.wtype = 2) then funid = 30^
  if (funid = 0) then Exit^
  insert into operlog (username, opcode, ondate, tabid, id, databefore, dataafter, funid, docnum)
    values (CURRENT_USER, 'D', current_timestamp, 24, OLD.wbillid,
     OLD.num||'^'||extract(day from OLD.ondate)||'.'||extract(month from OLD.ondate)||'.'||extract(year from OLD.ondate)||' '||extract(hour from OLD.ondate)||':'||extract(minute from OLD.ondate)||':'||extract(second from OLD.ondate)||'^'||cast(OLD.wtype as varchar(2))||'^'||cast(OLD.summall as varchar(24))||'^'||:v_kaname,
     null, :funid, OLD.num)^
END;
