create table bundles (
  bundleid integer
    constraint fk_bundles_bid_ref_mats_matid references materials(matid)
    on delete cascade on update cascade,
  itemType integer,
  itemid integer,
  quantity double precision,
  pos integer default 0
);







update viewlng set name='Bundles' where id=53 and langid=3;


update functions set classname='TfmBundles' where funid=40;


update usertreeview set visible=1, gtype=170, funid=NULL, pid=0, showintree=0, isgroup=1, showexpanded=1, num=3 where id=53;
update usertreeview set num=5 where id=48;
update usertreeview set num=6 where id=54;
update usertreeview set num=7 where id=58;
update usertreeview set num=8 where id=104;


update tables set tabid=24 where funid=40;







insert into tables (tabid, tablename, keyname) values (52, 'Materials', 'matid');


INSERT INTO USERTREEVIEW (ID, FUNID, TREEID, PID, NUM, IMAGEINDEX, ISGROUP, SHOWINTREE, GTYPE, SHOWEXPANDED, VISIBLE, DISABLEDINDEX)
                  VALUES (114,40,    0,      53,  1,   124,        0,       0,          170,   0,            1,       142);

insert into viewlng (id, langid, name) values (114, 1, 'Коплектация');
insert into viewlng (id, langid, name) values (114, 2, 'Комплектацiя');
insert into viewlng (id, langid, name) values (114, 3, 'Bundling');


INSERT INTO USERTREEVIEW (ID, FUNID, TREEID, PID, NUM, IMAGEINDEX, ISGROUP, SHOWINTREE, GTYPE, SHOWEXPANDED, VISIBLE, DISABLEDINDEX)
                  VALUES (115,40,    0,      53,  2,   124,        0,       0,          171,   0,            1,       142);

insert into viewlng (id, langid, name) values (115, 1, 'Разукомплектация');
insert into viewlng (id, langid, name) values (115, 2, 'Разукомплектацiя');
insert into viewlng (id, langid, name) values (115, 3, 'Un-Bundling');







insert into functions (funid, classname, tabid, logging) values (70, 'TfmProduction', 0, 0);


INSERT INTO USERTREEVIEW (ID, FUNID, TREEID, PID, NUM, IMAGEINDEX, ISGROUP, SHOWINTREE, GTYPE, SHOWEXPANDED, VISIBLE, DISABLEDINDEX)
                  VALUES (116,70,    0,      0,   4,   124,        0,       0,          180,   0,            0,       142);

insert into viewlng (id, langid, name) values (116, 1, 'Производство');
insert into viewlng (id, langid, name) values (116, 2, 'Производство');
insert into viewlng (id, langid, name) values (116, 3, 'Production');









CREATE PROCEDURE SP_WMAT_GET_FOR_BUNDLING (
    matids varchar(1024),
    wid integer,
    ondate timestamp)
returns (
    matid integer,
    posid integer,
    remain numeric(15,8),
    rsv numeric(15,8),
    matname varchar(255),
    msrname varchar(10),
    model varchar(255),
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
    serial varchar(256),
    invnumb varchar(256),
    posdate timestamp)
as
declare variable v_tmp_remain double precision^
declare variable v_tmp_rsv double precision^
declare variable v_tmp_ordered double precision^
declare variable v_tmp_avgprice double precision^
declare variable v_sum double precision^
declare variable v_sql varchar(2048)^
begin
  matid = null^
  rsv = null^
  remain = null^
  ordered = null^
  orsv = null^
  matname = null^
  msrname = null^
  model = null^
  avgprice = null^

  V_SQL = 'select m.num, m.matid, m.name, m.artikul, ms.shortname, mg.name, m.barcode,
    c.name, m.producer, cast(m.minreserv as numeric(15,8)), m.serials
   from materials m
     join measures ms on ms.mid=m.mid
     join matgroup mg on m.grpid=mg.grpid
     left outer join countries c on m.cid=c.cid
   where m.archived=0 and m.matid in (' || matids || ')'^

  V_SQL = V_SQL||' order by m.num'^

  for execute statement V_SQL
    into :num, :matid, :matname, :model, :msrname, :grpname, :barcode, :country, :producer, :minreserv, :isserial
  do begin
    remain = 0^
    ordered = 0^
    orsv = 0^
    avgprice = 0^
    rsv = 0^
    v_sum = 0^

    for select pr.posid, pr.remain, pr.rsv, pr.avgprice, pr.ordered, pr.ondate, s.serialno, s.invnumb
      from posremains pr
      left join serials s on s.posid=pr.posid
      where matid=:matid and wid=:wid
            and ondate=(select max(ondate) from posremains where posid=pr.posid and ondate<=:ondate and wid=:wid)
      into :posid, :v_tmp_remain, :V_TMP_RSV, :V_TMP_AVGPRICE, :v_tmp_ordered, :posdate, :serial, :invnumb
    do begin
      if (v_tmp_remain is not null) then begin
        remain = remain + v_tmp_remain^
        v_sum = v_sum + v_tmp_remain * v_tmp_avgprice^
      end

      ordered = ordered + v_tmp_ordered^

      if (v_tmp_ordered > 0)
        then orsv = orsv + v_tmp_rsv^
        else rsv = rsv + v_tmp_rsv^

      if (remain <> 0) then avgprice = v_sum / remain^
    end

    if (remain > 0) then suspend^
  end
end;

GRANT SELECT ON POSREMAINS TO PROCEDURE SP_WMAT_GET_FOR_BUNDLING;

GRANT EXECUTE ON PROCEDURE SP_WMAT_GET_FOR_BUNDLING TO SYSDBA;
