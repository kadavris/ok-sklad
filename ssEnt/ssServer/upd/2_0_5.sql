create index idx_mat_added on materials (DateAdded);
create index idx_mat_modified on materials (DateModified);
create index idx_mat_type on materials (TypeID);


alter table blobs add userData integer;


alter table customtree add XMLTag varchar(64);



alter table ctInt add ID Integer not null;
alter table ctInt add constraint pk_ctInt primary key (id);

create generator gen_ctInt_id;
set generator gen_ctInt_id to 0;

create trigger ctInt_bi0 for ctInt
active before insert position 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_ctInt_id,1)^
end;





alter table ctNumeric add ID Integer not null;
alter table ctNumeric add constraint pk_ctNumeric primary key (id);

create generator gen_ctNumeric_id;
set generator gen_ctNumeric_id to 0;

create trigger ctNumeric_bi0 for ctNumeric
active before insert position 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_ctNumeric_id,1)^
end;





alter table ctDouble add ID Integer not null;
alter table ctDouble add constraint pk_ctDouble primary key (id);

create generator gen_ctDouble_id;
set generator gen_ctDouble_id to 0;

create trigger ctDouble_bi0 for ctDouble
active before insert position 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_ctDouble_id,1)^
end;





alter table ctText add ID Integer not null;
alter table ctText add constraint pk_ctText primary key (id);

create generator gen_ctText_id;
set generator gen_ctText_id to 0;

create trigger ctText_bi0 for ctText
active before insert position 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_ctText_id,1)^
end;










alter procedure sp_ct_set_node_data (
    in_ID integer,
    in_CTNodeID integer,
    in_OwnerID  integer,
    in_cid      integer,
    fType  integer,
    fint   integer,
    fnum   numeric(18,5),
    fdbl   double precision,
    ftxt   varchar(1024)
) returns (
	v_ID integer
)
as
begin

  if (:in_id > 0) then begin
    if (fType = 1) then delete from CTInt where id=:in_id^
    else if (fType = 2) then delete from CTNumeric where id=:in_id^
    else if (fType = 3) then delete from CTDouble where id=:in_id^
    else if (fType = 4) then delete from CTText where id=:in_id^
    v_id=:in_id^
  end
  else begin
    if (fType = 1) then v_id=gen_id(gen_ctInt_id, 1)^
    else if (fType = 2) then v_id=gen_id(gen_ctNumeric_id, 1)^
    else if (fType = 3) then v_id=gen_id(gen_ctDouble_id, 1)^
    else if (fType = 4) then v_id=gen_id(gen_ctText_id, 1)^
  end

  if (fType = 1) then insert into CTInt (id, cid, data, CTNodeID, OwnerID) values (:v_id, :in_cid, :fint, :in_CTNodeID, :in_OwnerID)^
  else if (fType = 2) then insert into CTNumeric (id, cid, data, CTNodeID, OwnerID) values (:v_id, :in_cid, :fnum, :in_CTNodeID, :in_OwnerID)^
  else if (fType = 3) then insert into CTDouble (id, cid, data, CTNodeID, OwnerID) values (:v_id, :in_cid, :fdbl, :in_CTNodeID, :in_OwnerID)^
  else if (fType = 4) then insert into CTText (id, cid, data, CTNodeID, OwnerID) values (:v_id, :in_cid, :ftxt, :in_CTNodeID, :in_OwnerID)^

  suspend^
end;








alter procedure sp_ct_get_node_data (
    in_CTNodeID integer,
    in_OwnerID integer
) returns (
	fID integer,
	fOwnerID integer,
	fType    integer,
	fcid     integer,
    fint     integer,
    fnum     numeric(18,5),
    fdbl     double precision,
    ftxt     varchar(1024))
as
begin
  fType = 1^
  for select ID,OwnerID,cid,data from CTInt 
  where CTNodeID = :in_CTNodeID and ((:in_OwnerID = -1) or (OwnerID = :in_OwnerID))
      into fID,fOwnerID,fcid,fint do suspend^

  fType = 2^
  for select ID,OwnerID,cid,data from CTNumeric 
  where CTNodeID = :in_CTNodeID and ((:in_OwnerID = -1) or (OwnerID = :in_OwnerID))
      into fID,fOwnerID,fcid,fnum do suspend^

  fType = 3^
  for select ID,OwnerID,cid,data from CTDouble 
  where CTNodeID = :in_CTNodeID and ((:in_OwnerID = -1) or (OwnerID = :in_OwnerID))
      into fID,fOwnerID,fcid,fdbl do suspend^

  fType = 4^
  for select ID,OwnerID,cid,data from CTText 
  where CTNodeID = :in_CTNodeID and ((:in_OwnerID = -1) or (OwnerID = :in_OwnerID))
      into fID,fOwnerID,fcid,ftxt do suspend^

end;











create procedure sp_ct_delete_node (
    NodeID integer
)
as
declare variable v_id integer^
begin
  for select ID from CustomTree where ParentID = :NodeID into :v_id
    do execute procedure sp_ct_delete_node(:v_id)^

  delete from ctInt where CTNodeID = :nodeID^
  delete from ctNumeric where CTNodeID = :nodeID^
  delete from ctDouble where CTNodeID = :nodeID^
  delete from ctText where CTNodeID = :nodeID^

  delete from CustomTree where ID = :NodeID^
end;








ALTER PROCEDURE SP_CT_NEWCTREEID 
returns (treeid integer)
as
begin
  treeid = gen_id(gen_customtree_treeid, 1)^
  suspend^
end;










CREATE PROCEDURE SP_LIST_MAT_PRICES (
    matid integer,
    in_currid integer
) returns (
    ptype integer,
    price numeric(15,8),
    currid integer,
    currname varchar(16),
    dis float)
as
declare variable v_pptypeid integer^
begin
  select FIRST 1 mr.avgprice
    from matremains mr
      where mr.matid = :matid order by ondate desc
      into price^

  for select ptypeid, pptypeid from pricetypes WHERE DELETED = 0
      into :ptype, :V_PPTYPEID
  do begin
    for select extra, currid, currname
          from sp_get_mat_extra(:matid, :ptype, now(), :price, :in_currid, 1)
          into :price, :currid, :currname
    do suspend^
  end
end;

GRANT SELECT ON MATREMAINS TO PROCEDURE SP_LIST_MAT_PRICES;
GRANT SELECT ON PRICETYPES TO PROCEDURE SP_LIST_MAT_PRICES;
GRANT EXECUTE ON PROCEDURE SP_LIST_MAT_PRICES TO PUBLIC;
GRANT EXECUTE ON PROCEDURE SP_LIST_MAT_PRICES TO SYSDBA;
GRANT EXECUTE ON PROCEDURE SP_LIST_MAT_PRICES TO USERS;















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

  if ((wid > 0) and (valueinstr(:wh, :wid) <> 1)) then exit^

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






!NOERR!CREATE UNIQUE INDEX VIEWLNG_IDX_UNIQ ON VIEWLNG (ID,LANGID);



!NOERR!insert into LANGUAGES (LANGID, SHORTNAME, name) values (3, 'ENG','English');
