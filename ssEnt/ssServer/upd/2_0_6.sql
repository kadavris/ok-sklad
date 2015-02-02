update rdb$fields set RDB$FIELD_TYPE=16 where RDB$FIELD_TYPE=27 and RDB$FIELD_SCALE=-8 and rdb$field_precision=15;







create procedure sp_ct_data_del(
  treeid integer,
  nodeid integer,
  ownerid integer,
  ownertype integer,
  cid integer
)
as
  declare variable v_n_sql varchar(256)^
  declare variable v_d_sql varchar(256)^
  declare variable v_d_filt varchar(256)^
  declare variable v_nid integer^
begin

  v_n_sql = 'select id from customtree where'^

  if (treeid = -1)
    then v_n_sql = :v_n_sql || ' true'^
    else v_n_sql = :v_n_sql || ' treeid = ' || cast(:treeid as varchar(10))^

  if (nodeid <> -1)
    then v_n_sql = :v_n_sql || ' and id = ' || cast(:nodeid as varchar(10))^
  
  if (ownertype <> -1)
    then v_n_sql = :v_n_sql || ' and ownertype = ' || cast(:ownertype as varchar(10))^
  
  for execute statement :v_n_sql into :v_nid do begin
    v_d_filt = 'where ctnodeid = ' || cast(:v_nid as varchar(10))^

    if (ownerid = -1)
      then v_d_filt = :v_d_filt || ' and ownerid = ' || cast(:ownerid as varchar(10))^
  
    if (cid <> -1)
      then v_d_filt = :v_d_filt || ' and cid = ' || cast(:cid as varchar(10))^
  
    execute statement 'delete from ctint ' || :v_d_filt^
    execute statement 'delete from ctnumeric ' || :v_d_filt^
    execute statement 'delete from ctdouble ' || :v_d_filt^
    execute statement 'delete from cttext ' || :v_d_filt^
  end
end;
