CREATE PROCEDURE Z_FIX_MATPRICES
as
declare variable c integer^
declare variable V_PTYPEID    INTEGER^
declare variable V_MATID      INTEGER^
declare variable V_ONVALUE    NUMERIC(15,8)^
declare variable V_CURRID     INTEGER^
declare variable V_EXTRATYPE  INTEGER^
declare variable V_DIS        INTEGER^
declare variable V_WITHNDS    INTEGER^
declare variable V_PPTYPEID   INTEGER^
begin
  for select distinct matid, ptypeid, onvalue, currid, extratype, dis, withnds, pptypeid from matprices
    into :v_matid, :v_ptypeid, :v_onvalue, :v_currid, :v_extratype, :v_dis, :v_withnds, :v_pptypeid
  do begin
    for select count(*) from matprices where matid=:v_matid and ptypeid=:v_ptypeid
        into :c
    do begin
      if (c>1) then begin
        delete from matprices where matid=:v_matid and ptypeid=:v_ptypeid^
        insert into matprices (matid, ptypeid, onvalue, currid, extratype, dis, withnds, pptypeid)
               values (:v_matid, :v_ptypeid, :v_onvalue, :v_currid, :v_extratype, :v_dis, :v_withnds, :v_pptypeid)^
      end
    end
  end
end;

GRANT SELECT ON MATPRICES TO PROCEDURE Z_FIX_MATPRICES;

GRANT EXECUTE ON PROCEDURE Z_FIX_MATPRICES TO SYSDBA;