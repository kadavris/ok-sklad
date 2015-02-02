//UDEBUG code already inserted. Please do not remove this line.
unit xIBUtils;

interface

uses Windows, dialogs, xIBConst;

{
type
  ISC_STATUS     = Longint;
  PISC_STATUS    = ^ISC_STATUS;
  PPISC_STATUS   = ^PISC_STATUS;
  ISC_STATUS_VEC = array[0..19] of ISC_STATUS;
  PISC_STATUS_VEC= ^ISC_STATUS_VEC;

  ISC_DB_HANDLE  = Int64;
  PISC_DB_HANDLE = ^ISC_DB_HANDLE;
  ISC_TR_HANDLE  = Int64;
  PISC_TR_HANDLE = ^ISC_TR_HANDLE;

  ISC_USHORT     = Word;
  ISC_SVC_HANDLE     = Int64;
  PISC_SVC_HANDLE    = ^ISC_SVC_HANDLE;
  }

procedure InitFBDLL(const AFBVersion: Integer);

{function CreateDB(const AFileName: string; AKillConnect: boolean): ISC_DB_HANDLE;
function CreateDBex(const AFileName, ASQL: string; var FErr: string): boolean;

function ExecSQL(const AFileName, ASQL: string): integer;
function ExecScript(const AFileName, ASQL: string; adb_handle: ISC_DB_HANDLE): integer;
function ExecScriptEx(const AFileName, ASQL: string; adb_handle: ISC_DB_HANDLE; var Err: string; ADialect: Integer): integer;
}

function IBDBBackup(const AHost, ADBFile, ABakFile, AUser, APass: String; var AError: String): ISC_STATUS;
function IBDBRestore(const AHost, ADBFile, ABakFile, AUser, APass: String; var AError: String; Options: Word = 0): ISC_STATUS;
function IBDBRepair(const AHost, ADBFile, AUser, APass: String; var AError: String; Options: Word = 0): ISC_STATUS;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  udebug,
  SysUtils, xStrUtils, StrUtils, ssSrvConst;

{
const
  isc_tpb_version1          =  1;
  isc_tpb_version3          =  3;
  isc_tpb_consistency       =  1;
  isc_tpb_concurrency       =  2;
  isc_tpb_shared            =  3;
  isc_tpb_protected         =  4;
  isc_tpb_exclusive         =  5;
  isc_tpb_wait              =  6;
  isc_tpb_nowait            =  7;
  isc_tpb_read              =  8;
  isc_tpb_write             =  9;
  isc_tpb_lock_read         = 10;
  isc_tpb_lock_write        = 11;
  isc_tpb_verb_time         = 12;
  isc_tpb_commit_time       = 13;
  isc_tpb_ignore_limbo      = 14;
  isc_tpb_read_committed    = 15;
  isc_tpb_autocommit        = 16;
  isc_tpb_rec_version       = 17;
  isc_tpb_no_rec_version    = 18;
  isc_tpb_restart_requests  = 19;
  isc_tpb_no_auto_undo      = 20;
  isc_tpb_last_tpb_constant = isc_tpb_no_auto_undo;
  isc_dpb_lc_ctype          = 48;

  // services mgr service types
  isc_action_svc_backup        =  1;
  isc_action_svc_restore       =  2;
  isc_action_svc_repair        =  3;
  isc_action_svc_add_user      =  4;
  isc_action_svc_delete_user   =  5;
  isc_action_svc_modify_user   =  6;
  isc_action_svc_display_user  =  7;
  isc_action_svc_properties    =  8;
  isc_action_svc_add_license   =  9;
  isc_action_svc_remove_license= 10;
  isc_action_svc_db_stats      = 11;
  isc_action_svc_get_ib_log    = 12;
  isc_action_svc_get_fb_log    = 12;

  // spb data types for params passing
  isc_spb_version1          = 1;
  isc_spb_current_version   = 2;
  isc_spb_version           = isc_spb_current_version;
  isc_spb_user_name         = 28;
  isc_spb_sys_user_name     = 19;
  isc_spb_sys_user_name_enc = 31;
  isc_spb_password          = 29;
  isc_spb_password_enc      = 30;
  isc_spb_command_line      = 105;
  isc_spb_dbname            = 106;
  isc_spb_verbose           = 107;
  isc_spb_options           = 108;
  isc_spb_address_path      = 109;
  isc_spb_process_id        = 110;
  isc_spb_trusted_auth      = 111;
  isc_spb_process_name      = 112;
  isc_spb_bkp_file          = 5;

  isc_info_svc_svr_db_info      = 50;
  isc_info_svc_get_license      = 51;
  isc_info_svc_get_license_mask = 52;
  isc_info_svc_get_config       = 53;
  isc_info_svc_version          = 54;
  isc_info_svc_server_version   = 55;
  isc_info_svc_implementation   = 56;
  isc_info_svc_capabilities     = 57;
  isc_info_svc_user_dbpath      = 58;
  isc_info_svc_get_env          = 59;
  isc_info_svc_get_env_lock     = 60;
  isc_info_svc_get_env_msg      = 61;
  isc_info_svc_line             = 62;
  isc_info_svc_to_eof           = 63;
  isc_info_svc_timeout          = 64;
  isc_info_svc_get_licensed_users = 65;
  isc_info_svc_limbo_trans        = 66;
  isc_info_svc_running            = 67;
  isc_info_svc_get_users          = 68;
}
var
  GDS32DLL: Integer;
  FBVersion: integer; // used firebird version

  isc_service_attach: function(
      status_vector : PISC_STATUS_VEC;
      service_length: ISC_USHORT;
      service: PChar;
      svc_handle: PISC_SVC_HANDLE;
      spb_length: ISC_USHORT;
      spb: PChar
  ): ISC_STATUS; stdcall;

  //------------------------------------
  isc_service_start: function(
      status_vector : PISC_STATUS_VEC;
      svc_handle: PISC_SVC_HANDLE;
      resv_handle: Pointer;
      spb_length: ISC_USHORT;
      spb: PChar
  ): ISC_STATUS; stdcall;

  //------------------------------------
  isc_service_query: function(
      status_vector : PISC_STATUS_VEC;
      svc_handle: PISC_SVC_HANDLE;
      resv_handle: Pointer;
      send_spb_length: ISC_USHORT;
      send_spb: PChar;
      recv_spb_length: ISC_USHORT;
      recv_spb: PChar;
      resp_buf_length: ISC_USHORT;
      resp_buf: PChar
  ): ISC_STATUS; stdcall;

  //------------------------------------
  isc_service_detach: function(
      status_vector : PISC_STATUS_VEC;
      svc_handle: PISC_SVC_HANDLE
  ): ISC_STATUS; stdcall;

  //------------------------------------
  //------------------------------------
  //------------------------------------
  isc_dsql_execute_immediate: function (
      status_vector: PISC_STATUS;
	  db_handle    : PISC_DB_HANDLE;
	  tran_handle  : PISC_TR_HANDLE;
	  length       : Word;
	  statement    : PChar;
	  dialect      : Word;
      xsqlda       : Pointer
  ): ISC_STATUS; stdcall;

  //------------------------------------
  isc_start_transaction: function (
      status_vector  : PISC_STATUS;
      tran_handle    : PISC_TR_HANDLE;
      db_handle_count: SmallInt;
      db_handle      : PISC_DB_HANDLE;
      tpb_length     : Word;
      tpb_address    : PChar
  ): ISC_STATUS; stdcall;

  //------------------------------------
  isc_attach_database: function (
      status_vector     : PISC_STATUS;
      db_name_length    : SmallInt;
      db_name           : PChar;
      db_handle         : PISC_DB_HANDLE;
	  parm_buffer_length: SmallInt;
      parm_buffer       : PChar
  ): ISC_STATUS; stdcall;

  //------------------------------------
  isc_detach_database: function (status_vector: PISC_STATUS; db_handle: PISC_DB_HANDLE): ISC_STATUS; stdcall;

  isc_commit_transaction: function (status_vector: PISC_STATUS; tran_handle: PISC_TR_HANDLE): ISC_STATUS; stdcall;

  isc_rollback_transaction: function (status_vector: PISC_STATUS; tran_handle: PISC_TR_HANDLE): ISC_STATUS; stdcall;

  //------------------------------------
  {
  isc_start_multiple: function (
      status_vector: PISC_STATUS;
      tran_handle       : PISC_TR_HANDLE;
      db_handle_count   : SmallInt;
      teb_vector_address: PISC_TEB
  ): ISC_STATUS; stdcall;
  }

  //------------------------------------
  isc_print_sqlerror: procedure (sqlcode: SmallInt; status_vector: PISC_STATUS); stdcall;

  isc_sql_interprete: procedure (sqlcode: SmallInt; buffer: PChar; buffer_length: SmallInt); stdcall;

  isc_interprete    : function (buffer: PChar; status_vector: PPISC_STATUS): ISC_STATUS; stdcall;

  isc_print_status  : function  (status_vector: PISC_STATUS): ISC_STATUS; stdcall;

  fb_interpret      : function (buffer: PChar; bufSize: Integer; status_vector: PPISC_STATUS): ISC_STATUS; stdcall;
  //------------------------------------
  {$IFDEF UDEBUG}
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
  {$ENDIF}

//==============================================================================================
function GetIBError(Vector: PISC_STATUS): string;
  var
    Buff: array [0..1024] of Char;
begin
  if 0 = Vector^
    then Result := 'No error. Pity.'
    else begin
      Result := 'ISC_STATUS: ' + debugMemDump(Vector, SizeOf(ISC_STATUS) * ISC_STATUS_LENGTH, Sizeof(ISC_STATUS)) + '; ';
    end;

  try
    while ((FBVersion = 1) and (isc_interprete(@Buff, @Vector) > 0))
          or ((FBVersion = 2) and (fb_interpret(@Buff, 1024, @Vector) > 0))
    do Result := Result + String(Buff) + #13#10;

  except
    on e: Exception do
      Result := Result + #13#10 + 'And aditional unfortunate and morbid, to say, error getting error message description. This Error of errors declared as: ' + e.Message;
  end;
end;

(*
//==============================================================================================
function ExecScriptEx(const AFileName, ASQL: string; adb_handle: ISC_DB_HANDLE; var Err: string; ADialect: Integer): integer;
  var
    DPB: string;
    res: ISC_STATUS;
    sql_text: string;
    i: integer;
    //Buff: array[0..1024] of Char;
    pvector: PISC_STATUS;
    ignoreres: Boolean;
    status_vector: ISC_STATUS_VEC;
    tr_handle: ISC_TR_HANDLE;
begin
  Err := '';
  Result := 0;
  tr_handle := 0;

  if adb_handle = 0 then begin
    DPB := Char(1) + Char(28) + Char(6) + 'sysdba' + Char(29) + Char(9) + 'masterkey' + Char(isc_dpb_lc_ctype) + Char(7) + 'WIN1251';

    res := isc_attach_database(@status_vector, 0, PChar(AFileName), @adb_handle, Length(DPB), PChar(DPB));

    if res <> 0 then begin
      //isc_print_status(@status_vector);
      Err := GetIBError(@status_vector);
      Result := -1;
      Exit;
    end;
  end;

  try
    res := isc_start_transaction(@status_vector, @tr_handle, 1, @adb_handle, 0, nil);

    if res <> 0 then begin
      //isc_print_status(@status_vector);
      Err := GetIBError(@status_vector);
      Result := -2;
      Exit;
    end;

    for i := 1 to WordCount(ASQL, [';']) do begin
      ignoreres := False;
      sql_text := trim(ReplaceStr(ExtractWord(i, ASQL, [';']), '^', ';'));

      if sql_text = '' then Continue;

      if AnsiStartsText('!NOERR!', sql_text) then begin // there may be recoverable errors, so ignoring them
        ignoreres := True;
        sql_text := AnsiMidStr(sql_text, 8, 999999);
      end;

      res := isc_dsql_execute_immediate(@status_vector, @adb_handle, @tr_handle, 0, PChar(sql_text), ADialect, nil);

      if res <> 0 then begin
        //isc_print_status(@status_vector);
        if ignoreRes then Err := Err + '!!!!!! ERROR IGNORED:';

        Err := Err + sql_text + #13#10 + GetIBError(@status_vector) + #13#10#13#10;

        if not ignoreres then begin
          isc_rollback_transaction(@status_vector, @tr_handle);
          Result := -3;

          Exit;
        end;
      end;
    end;

    res := isc_commit_transaction(@status_vector, @tr_handle);
    if res <> 0 then begin
      //isc_print_status(@status_vector);
      Err := GetIBError(@status_vector);
      Result := -4;

      Exit;
    end;

  finally
    res := isc_detach_database(@status_vector, @adb_handle);
  end;
end;

//==============================================================================================
function ExecScript(const AFileName, ASQL: string; adb_handle: ISC_DB_HANDLE): integer;
  var
    DPB: string;
    res: ISC_STATUS;
    sql_text: string;
    i: integer;
    status_vector: ISC_STATUS_VEC;
    tr_handle: ISC_TR_HANDLE;
begin
  Result := 0;
  tr_handle := 0;

  if adb_handle = 0 then begin
    DPB := Char(1) + Char(28) + Char(6) + 'sysdba' + Char(29) + Char(9) + 'masterkey' + Char(isc_dpb_lc_ctype) + Char(7) + 'WIN1251';

    res := isc_attach_database(@status_vector, 0, PChar(AFileName), @adb_handle, Length(DPB), PChar(DPB));

    if res <> 0 then begin
      isc_print_status(@status_vector);
      Result := -1; Exit;
    end;
  end;

  try
    res := isc_start_transaction(@status_vector, @tr_handle, 1, @adb_handle, 0, nil);

    if res <> 0 then begin
      isc_print_status(@status_vector);
      Result := -2; 

      Exit;
    end;

    for i := 1 to WordCount(ASQL, [';']) do begin
      sql_text := trim(ReplaceStr(ExtractWord(i, ASQL, [';']), '^', ';'));

      if sql_text = '' then Continue;

      res := isc_dsql_execute_immediate(@status_vector, @adb_handle, @tr_handle, 0, PChar(sql_text), 3, nil);

      if res <> 0 then begin
        isc_print_status(@status_vector);
        isc_rollback_transaction(@status_vector, @tr_handle);
        Result := -3;

        Exit;
      end;
    end;

    res := isc_commit_transaction(@status_vector, @tr_handle);

    if res <> 0 then begin
      isc_print_status(@status_vector);
      Result := -4;

      Exit;
    end;

  finally
    res := isc_detach_database(@status_vector, @adb_handle);
  end;
end;

//==============================================================================================
function ExecSQL(const AFileName, ASQL: string): integer;
  var
    DPB: string;
    res: ISC_STATUS;
    db_handle: ISC_DB_HANDLE;
    tr_handle: ISC_TR_HANDLE;
    status_vector: ISC_STATUS_VEC;
begin
  Result := 0;
  db_handle := 0;
  tr_handle := 0;

  DPB := Char(1) + Char(28) + Char(6) + 'sysdba' + Char(29) + Char(9) + 'masterkey';
  res := isc_attach_database(@status_vector, 0, PChar(AFileName), @db_handle, Length(DPB), PChar(DPB));

  if res <> 0 then begin
    Result := -1;
    Exit;
  end;

  try
    res := isc_start_transaction(@status_vector, @tr_handle, 1, @db_handle, 0, nil);

    if res <> 0 then begin
      Result := -2;
      Exit;
    end;

    res := isc_dsql_execute_immediate(@status_vector, @db_handle, @tr_handle, 0, PChar(ASQL), 3, nil);

    if res <> 0 then begin
      isc_rollback_transaction(@status_vector, @tr_handle);
      Result := -3;
      Exit;
    end
    else isc_commit_transaction(@status_vector, @tr_handle);

  finally
    res := isc_detach_database(@status_vector, @db_handle);
  end;
end;

//==============================================================================================
function CreateDB(const AFileName: string; AKillConnect: boolean): ISC_DB_HANDLE;
  var
    err_code: Longint;
    sql_text: string;
    db_handle: ISC_DB_HANDLE;
    tr_handle: ISC_TR_HANDLE;
    status_vector: ISC_STATUS_VEC;
begin
  db_handle := 0;
  tr_handle := 0;
  Result := db_handle;

  if not Assigned(isc_dsql_execute_immediate) then Exit;

  sql_text := 'create database ''' + AFileName + ''' page_size 4096 user ''sysdba'' password ''masterkey'' default character set WIN1251';
  err_code := isc_dsql_execute_immediate(@status_vector, @db_handle, @tr_handle, 0, PChar(sql_text), 3, nil);

  Result := db_handle;

  if AKillConnect then begin
    isc_detach_database(@status_vector, @db_handle);
    Result := 0;
  end;
end;

//==============================================================================================
function CreateDBex(const AFileName, ASQL: string; var FErr: string): boolean;
  var
    db_handle: ISC_DB_HANDLE;
begin
  db_handle := CreateDB(AFileName, False);
  Result := (db_handle <> 0) and (ExecScriptEx(AFileName, ASQL, db_handle, FErr, 3) = 0);
end;
*)

//==============================================================================================
procedure InitFBDLL(const AFBVersion: Integer);
begin
  FBVersion := AFBVersion;

  try
    case FBVersion of
      1: GDS32DLL := LoadLibrary('GDS32.DLL');

      2: GDS32DLL := LoadLibrary('fbclient.DLL');

      21: begin
            GDS32DLL := LoadLibrary('fbclient21.DLL');
            if GDS32DLL = 0 then GDS32DLL := LoadLibrary('fbclient.DLL');
          end;
    end;

    if GDS32DLL <> 0 then begin
      isc_dsql_execute_immediate := GetProcAddress(GDS32DLL, 'isc_dsql_execute_immediate');
      isc_start_transaction := GetProcAddress(GDS32DLL, 'isc_start_transaction');
      isc_attach_database := GetProcAddress(GDS32DLL, 'isc_attach_database');
      isc_detach_database := GetProcAddress(GDS32DLL, 'isc_detach_database');
      isc_commit_transaction := GetProcAddress(GDS32DLL, 'isc_commit_transaction');
      isc_rollback_transaction := GetProcAddress(GDS32DLL, 'isc_rollback_transaction');
      isc_print_sqlerror := GetProcAddress(GDS32DLL, 'isc_print_sqlerror');
      isc_sql_interprete := GetProcAddress(GDS32DLL, 'isc_sql_interprete');
      isc_print_status := GetProcAddress(GDS32DLL, 'isc_print_status');
      isc_service_attach := GetProcAddress(GDS32DLL, 'isc_service_attach');
      isc_service_start := GetProcAddress(GDS32DLL, 'isc_service_start');
      isc_service_detach := GetProcAddress(GDS32DLL, 'isc_service_detach');
      isc_service_query := GetProcAddress(GDS32DLL, 'isc_service_query');

      case FBVersion of
        1: isc_interprete := GetProcAddress(GDS32DLL, 'isc_interprete'); // deprecated in FB v2
        2: fb_interpret := GetProcAddress(GDS32DLL, 'fb_interpret');
      end;
    end;

  except
    on e: exception do begin
      logEvent('error ' + e.Message + ' at xIBUtils/initDLL');
      e.Create('error at xIBUtils/initDLL');
    end;
  end;
end;

//==============================================================================================
function IBServiceRun(const AHost, AUser, APass, thd: String; status_vector: PISC_STATUS_VEC): ISC_STATUS;
  var
    spb, s: String;
    shandle: ISC_SVC_HANDLE;
    sendbuf: Char;
    recvbuf: array[0..1024] of char;
    res: ISC_STATUS;
    sv: ISC_STATUS_VEC;
begin
  if debugLeveL > 9 then LogEvent('* IBServiceRun thd: ' + debugStrDump(PChar(thd), length(thd)) );

  spb := Char(isc_spb_version) + Char(isc_spb_current_version)
         + Char(isc_spb_user_name) + Char(length(AUser)) + AUser
         + Char(isc_spb_password) + Char(length(APass)) + APass;

  if AHost <> ''
    then s := AHost + ':'
    else s := '';
  s := s + 'service_mgr';

  shandle := 0;
  Result := isc_service_attach(status_vector, length(s), PChar(s), @shandle, length(spb), PChar(spb));

  if Result > 0 then begin
    logEvent('! IBServiceRun: attach failed to ' + s);
    Exit;
  end;

  Result := isc_service_start(status_vector, @shandle, nil, length(thd), PChar(thd));

  if Result = 0 then begin // now waitnig for service to be done working
    try
      repeat // on error we'll skip directly to detach service
        sleep(200);

        sendbuf := Char(isc_info_svc_running);
        Result := isc_service_query(status_vector, @shandle, nil, 0, nil, 1, @sendbuf, 1024, @recvbuf);

        if (Result > 0) or (recvbuf[0] <> Char(isc_info_svc_running)) then Break; // Error

      until PInteger(PChar(@recvbuf) + 1)^ = 0; // wait while service is running (the 32bit integer status begins from recvbuf+1). Yes. C notation is more good looking ;)

    except
      logEvent('! IBServiceRun: service loop failed');
    end;
  end
  else logEvent('! IBServiceRun: service start failed');

  try
    res := isc_service_detach(@sv, @shandle);
    if res > 0 then begin
      logEvent('! IBServiceRun: service detach failed');

      if Result = 0 then status_vector^ := sv;
    end;

  except
    logEvent('! IBServiceRun: service detach exception');
    res := 0;
  end;

  if Result = 0 then Result := res; // to not hide service_run error
end;

//==============================================================================================
function addLength(ALen: ISC_USHORT): String;
begin
  Result := Char(ALen and $FF) + Char(ALen shr 8);
end;

//==============================================================================================
function addStrParam(ACode: Integer; AValue: String; ALen: ISC_USHORT = 0): String;
begin
  if ALen = 0 then ALen := length(AValue);
  Result := Char(ACode) + addLength(ALen) + AValue;
end;

//==============================================================================================
function addIntParam(ACode, AValue: Integer): String;
begin
  Result := Char(ACode) + Char(AValue and $FF) + Char((AValue shr 8) and $FF) + Char((AValue shr 16) and $FF) + Char((AValue shr 24) and $FF);
end;

//==============================================================================================
function IBDBBackup(const AHost, ADBFile, ABakFile, AUser, APass: String; var AError: String): ISC_STATUS;
  var
    thd: String;
    status_vector: ISC_STATUS_VEC;
begin
  if debugLeveL > 9 then LogEvent('* IBDBBackup: Host: ' + AHost + ', DBFile: ' + ADBFile + ', ABakFile: ' + ABakFile + ', AUser: ' + AUser + ', APass: ' + APass);

  thd := Char(isc_action_svc_backup) + addStrParam(isc_spb_dbname, trim(ADBFile)) + addStrParam(isc_spb_bkp_file, trim(ABakFile));
  //thd := thd + Char(isc_spb_verbose);

  Result := IBServiceRun(AHost, AUser, APass, thd, @status_vector);

  if Result = 0
    then AError := ''
    else AError := GetIBError(PISC_STATUS(@status_vector));
end;

//==============================================================================================
function IBDBRestore(const AHost, ADBFile, ABakFile, AUser, APass: String; var AError: String; Options: Word = 0): ISC_STATUS;
  var
    thd: String;
    status_vector: ISC_STATUS_VEC;
begin
  if debugLeveL > 9 then LogEvent('* IBDBRestore: Host: ' + AHost + ', DBFile: ' + ADBFile + ', ABakFile: ' + ABakFile + ', AUser: ' + AUser + ', APass: ' + APass + ', Opptions: ' + IntToStr(Options));

  if Options = 0 then begin // filling default
    Options := Options or isc_spb_res_replace or isc_spb_res_create;
  end;

  thd := Char(isc_action_svc_restore) + AddIntParam(isc_spb_options, Options)
         + ADDStrParam(isc_spb_bkp_file, trim(ABakFile)) + AddStrParam(isc_spb_dbname, trim(ADBFile));
  //thd := thd + Char(isc_spb_verbose);

  Result := IBServiceRun(AHost, AUser, APass, thd, @status_vector);

  if Result = 0
    then AError := ''
    else AError := GetIBError(PISC_STATUS(@status_vector));
end;

//==============================================================================================
function IBDBRepair(const AHost, ADBFile, AUser, APass: String; var AError: String; Options: Word = 0): ISC_STATUS;
  var
    thd: String;
    status_vector: ISC_STATUS_VEC;
begin
  if Options = 0 then begin // filling default
    Options := Options or isc_spb_rpr_full;
    {
    isc_spb_rpr_validate_db
    isc_spb_rpr_sweep_db
    isc_spb_rpr_mend_db
    isc_spb_rpr_list_limbo_trans
    isc_spb_rpr_check_db
    isc_spb_rpr_ignore_checksum
    isc_spb_rpr_kill_shadows
    isc_spb_rpr_full
    }
  end;

  thd := Char(isc_action_svc_repair) + AddIntParam(isc_spb_options, Options) + AddStrParam(isc_spb_dbname, trim(ADBFile));
  //thd := thd + Char(isc_spb_verbose);
  
  Result := IBServiceRun(AHost, AUser, APass, thd, @status_vector);

  if Result = 0
    then AError := ''
    else AError := GetIBError(PISC_STATUS(@status_vector));
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('xIBUtils', @Debugging, DEBUG_group_ID);
  {$ENDIF}

  GDS32DLL := 0;

//==============================================================================================
finalization
  if GDS32DLL <> 0 then FreeLibrary(GDS32DLL);

end.



