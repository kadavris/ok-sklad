SET TERM ^ ;

CREATE OR ALTER PROCEDURE Z_WMT_WBL_REL_CHECK 
returns (
    posid integer,
    wmtpos integer,
    wmtsrc integer,
    wbd_matid integer,
    wmt_matid integer,
    wbid integer,
    wbname varchar(20),
    ondate timestamp,
    wbtype integer,
    wmt_type integer,
    wbd_amount numeric(15,8),
    wmt_amount numeric(15,8),
    wbd_matname varchar(255),
    wmt_matname varchar(255))
as
begin
  for select wbl.ondate, wbl.num,  wmt.posid,wmt.sourceid, wbd.posid, wbd.matid,wmt.matid,
             wbl.wbillid, wbl.wtype, wmt.turntype, wbd.amount, wmt.amount, md.name, mt.name from waybilldet wbd
    join waybilllist wbl on wbl.wbillid=wbd.wbillid
    join wmatturn wmt on (((wmt.sourceid=wbd.posid) or (wmt.posid=wbd.posid)) and (wbd.matid<>wmt.matid))
    left join materials md on md.matid=wbd.matid
    left join materials mt on mt.matid=wmt.matid
    into :ondate, :wbname, :wmtpos, :wmtsrc, :posid, :wbd_matid, :wmt_matid, :wbid, :wbtype, :wmt_type,
         :wbd_amount, :wmt_amount, :wbd_matname, :wmt_matname
  do begin
     suspend;
  end
end^

SET TERM ; ^

GRANT SELECT ON WAYBILLDET TO PROCEDURE Z_WMT_WBL_REL_CHECK;

GRANT SELECT ON WAYBILLLIST TO PROCEDURE Z_WMT_WBL_REL_CHECK;

GRANT SELECT ON WMATTURN TO PROCEDURE Z_WMT_WBL_REL_CHECK;

GRANT SELECT ON MATERIALS TO PROCEDURE Z_WMT_WBL_REL_CHECK;

GRANT EXECUTE ON PROCEDURE Z_WMT_WBL_REL_CHECK TO SYSDBA;