alter table materials
  add LabelDescr VARCHAR(255),
  add TypeId integer,
  add DateAdded timestamp,
  add DateModified timestamp,
  add cf1 integer,
  add cf2 integer,
  add cf3 integer,
  add cf4 integer,
  add cf5 integer;
















create table blobs (
    id         integer not null,
    ownerid    integer,
    ownertype  integer,
    data       blob sub_type 0 segment size 1024
);

alter table blobs add constraint pk_blobs primary key (id);

create generator gen_blobs_id;
set generator gen_blobs_id to 0;

create trigger blobs_bi0 for blobs
active before insert position 0
as
begin
  if (new.id is null) then
    new.id=gen_id(gen_blobs_id,1)^
end;







create table customtree (
    id         integer not null,
    treeid     integer not null,
    parentid   integer,
    pos        integer,
    ownertype  integer not null,
    name       varchar(64) not null,
    data       integer
);

alter table customtree add constraint pk_customtree primary key (id);
create index idx_customtree on customtree (treeid,ownertype,name);

grant select on customtree to "public";
grant select on customtree to sysdba;
grant select on customtree to users;


create generator gen_customtree_id;
set generator gen_customtree_id to 0;

create trigger customtree_bi0 for customtree
active before insert position 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_customtree_id, 1)^
end;

create generator gen_customtree_treeid;
set generator gen_customtree_treeid to 0;

create procedure sp_ct_newctreeid returns (treeid integer)
as begin
    treeid = gen_id(gen_customtree_treeid, 1)^
end;




create table CTInt (
    CTNodeID  integer not null,
    cid       integer,
    data      integer,
    OwnerID   integer not null
);

alter table CTInt
  add constraint fk_CTInt_1
  foreign key (CTNodeID)
  references customtree(id)
  on delete cascade
  on update cascade;
create index idx_CTInt on CTInt (OwnerID);

grant select on CTInt to "public";
grant select on CTInt to sysdba;
grant select on CTInt to users;




create table CTNumeric (
    CTNodeID  integer not null,
    cid       integer,
    data      numeric(18,5),
    OwnerID   integer not null
);

alter table CTNumeric
  add constraint fk_CTNumeric_1
  foreign key (CTNodeID)
  references customtree(id)
  on delete cascade
  on update cascade;
create index idx_CTNumeric on CTNumeric (OwnerID);

grant select on CTNumeric to "public";
grant select on CTNumeric to sysdba;
grant select on CTNumeric to users;




create table CTDouble (
    CTNodeID  integer not null,
    cid       integer,
    data      double precision,
    OwnerID   integer not null
);

alter table CTDouble
  add constraint fk_CTDouble_1
  foreign key (CTNodeID)
  references customtree(id)
  on delete cascade
  on update cascade;
create index idx_CTDouble on CTDouble (OwnerID);

grant select on CTDouble to "public";
grant select on CTDouble to sysdba;
grant select on CTDouble to users;




create table CTText (
    CTNodeID  integer not null,
    cid       integer,
    data      varchar(1024),
    OwnerID   integer not null
);

alter table CTText
  add constraint fk_CTText_1
  foreign key (CTNodeID)
  references customtree(id)
  on delete cascade
  on update cascade;
create index idx_CTText on CTText (OwnerID);

grant select on CTText to "public";
grant select on CTText to sysdba;
grant select on CTText to users;











create procedure sp_ct_get_node_data (
    in_CTNodeID integer,
    in_OwnerID integer
) returns (
	fType  integer,
	fcid   integer,
    fint   integer,
    fnum   numeric(18,5),
    fdbl   double precision,
    ftxt   varchar(1024))
as
begin
  fType = 1^
  for select cid,data from CTInt where CTNodeID = :in_CTNodeID and OwnerID = :in_OwnerID
      into fcid,fint do suspend^

  fType = 2^
  for select cid,data from CTNumeric where CTNodeID = :in_CTNodeID and OwnerID = :in_OwnerID
      into fcid,fnum do suspend^

  fType = 3^
  for select cid,data from CTDouble where CTNodeID = :in_CTNodeID and OwnerID = :in_OwnerID
      into fcid,fdbl do suspend^

  fType = 4^
  for select cid,data from CTText where CTNodeID = :in_CTNodeID and OwnerID = :in_OwnerID
      into fcid,ftxt do suspend^

end;

grant execute on procedure sp_ct_get_node_data to "public";
grant execute on procedure sp_ct_get_node_data to sysdba;
grant execute on procedure sp_ct_get_node_data to users;




create procedure sp_ct_get_tree_data (
    in_TreeID integer,
    in_OwnerID integer
) returns (
	fType   integer,
	fNodeID integer,
	fcid    integer,
    fint    integer,
    fnum    numeric(18,5),
    fdbl    double precision,
    ftxt    varchar(1024))
as
begin
  for select id from CustomTree where treeid=:in_TreeID into :fNodeID
  do for select fType, fcid, fint, fnum, fdbl, ftxt
         from sp_ct_get_node_data(:fNodeID, :in_OwnerID)
         into :fType, :fcid, :fint, :fnum, :fdbl, :ftxt
         do suspend^
end;

grant execute on procedure sp_ct_get_tree_data to "public";
grant execute on procedure sp_ct_get_tree_data to sysdba;
grant execute on procedure sp_ct_get_tree_data to users;






create procedure sp_ct_set_node_data (
    in_CTNodeID integer,
    in_OwnerID  integer,
    in_cid      integer,
    fType  integer,
    fint   integer,
    fnum   numeric(18,5),
    fdbl   double precision,
    ftxt   varchar(1024)
)
as
begin
  if (not in_cid is null) then begin
    if (fType = 1) then update CTInt set data=:fint where cid=:in_cid and CTNodeID=:in_CTNodeID and OwnerID=:in_OwnerID^
    else if (fType = 2) then update CTNumeric set data=:fnum where cid=:in_cid and CTNodeID=:in_CTNodeID and OwnerID=:in_OwnerID^
    else if (fType = 3) then update CTDouble set data=:fdbl where cid=:in_cid and CTNodeID=:in_CTNodeID and OwnerID=:in_OwnerID^
    else if (fType = 4) then update CTText set data=:ftxt where cid=:in_cid and CTNodeID=:in_CTNodeID and OwnerID=:in_OwnerID^
  end
  else begin
    if (fType = 1) then insert into CTInt (cid, data, CTNodeID, OwnerID) values (:in_cid, :fint, :in_CTNodeID, :in_OwnerID)^
    else if (fType = 2) then insert into CTNumeric (cid, data, CTNodeID, OwnerID) values (:in_cid, :fnum, :in_CTNodeID, :in_OwnerID)^
    else if (fType = 3) then insert into CTDouble (cid, data, CTNodeID, OwnerID) values (:in_cid, :fdbl, :in_CTNodeID, :in_OwnerID)^
    else if (fType = 4) then insert into CTText (cid, data, CTNodeID, OwnerID) values (:in_cid, :ftxt, :in_CTNodeID, :in_OwnerID)^
  end
end;



grant execute on procedure sp_ct_set_node_data to "public";
grant execute on procedure sp_ct_set_node_data to sysdba;
grant execute on procedure sp_ct_set_node_data to users;












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
END;











ALTER PROCEDURE SP_GET_ALL_MAT_PRICES (
    matid integer,
    currid integer)
returns (
    prices varchar(1500),
    dis float)
as
declare variable v_extra numeric(15,8)^
declare variable v_extratype integer^
declare variable v_ptypeid integer^
declare variable v_onvalue numeric(15,8)^
declare variable v_pptypeid integer^
declare variable v_price numeric(15,8)^
declare variable v_currid integer^
declare variable v_currname varchar(24)^
begin
  prices = ''^

  select FIRST 1 mr.avgprice
    from matremains mr
      where mr.matid = :matid order by ondate desc
      into v_price^

  for select ptypeid, onvalue, pptypeid, extratype from pricetypes WHERE DELETED = 0
      into :v_ptypeid, :V_onvalue, :V_PPTYPEID, :V_EXTRATYPE
  do begin
    for select extra, currid, currname
          from sp_get_mat_extra(:matid, :v_ptypeid, now(), :v_price, :currid, 1)
          into :v_extra, :v_currid, :v_currname
    do begin
      prices = prices || cast(v_ptypeid as varchar(10))||'^'
               ||cast(v_extra as varchar(24))||'^'||v_currname||'^'^
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
    prices varchar(255),
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
  v_sql = 'select m.matid, m.name, m.artikul, m.mid, m.notes, m.grpid, m.wid, '||
          'm.num, cast(m.minreserv as numeric(15,8)), m.cid, m.demandcat, '||
          'cast(m.weight as numeric(15,8)), cast(m.msize as numeric(15,8)), m.producer, '||
          'm.barcode, 1 as mtype, ms.shortname, c.name as cname, m.archived, '||
          'm.cf1,m.cf2,m.cf3,m.cf4,m.cf5'||
          ' from materials m join measures ms on m.mid=ms.mid'||
          ' left outer join countries c on c.cid=m.cid where m.deleted=0'^
  if (getarchived = 0) then v_sql = v_sql||' and m.archived=0'^
  if (grp <> '') then v_sql = v_sql||' and m.grpid in ('||grp||')'^

  v_sql = v_sql||' order by m.num'^

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
          where mr.matid=:matid
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

      for select first 1 pr.posid, pr.remain, pr.rsv, pr.avgprice, pr.ordered
        from posremains pr
        where matid=:matid and wid=:wid 
        order by ondate desc
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









alter table languages
  add flags integer;






create table webshops (
    id           integer not null,
    name         varchar(128) not null,

    docprefix    varchar(16),
    docsuffix    varchar(16),

    xmlurl       varchar(256),
    xmllogin     varchar(64),
    xmlpass      varchar(64),
    xmlseckey    varchar(64),

    deploytype   integer default 0,
    deployurl    varchar(256),
    deploylogin  varchar(64),
    deploypass   varchar(64),

    description  varchar(1024)
);

create generator gen_webshops_id;
set generator gen_webshops_id to 0;

create trigger webshops_bi0 for webshops
active before insert position 0
as
begin
  if (new.id is null) then
    new.id=gen_id(gen_webshops_id,1)^
end;

alter table webshops add constraint pk_webshops primary key (id);

