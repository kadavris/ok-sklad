{$IFNDEF PKG}
{$IFNDEF REPEDITOR}
{$I ok_sklad.inc}
{$ENDIF}
{$ENDIF}
unit ssBaseConst;

interface

uses
    Messages, Graphics;

const
  WM_REFRESH          = WM_USER + 1;
  WM_CHANGEBSTATE     = WM_USER + 2;
  WM_SETPARENTCAPTION = WM_USER + 3;
  WM_SETTREEITEM      = WM_USER + 4;
  WM_ADDTREEITEM      = WM_USER + 5;
  WM_REFRESHBIN       = WM_USER + 6;
  WM_RESTOREFROMBIN   = WM_USER + 7;
  WM_RESETSTYLE       = WM_USER + 8;
  WM_SETNEWCAPTION    = WM_USER + 9;
  WM_REFRESHNODE      = WM_USER + 10;
  WM_LOCATEID         = WM_USER + 11;
  WM_SETFINDPARAMS    = WM_USER + 12;
  WM_SETCAPTIONEX     = WM_USER + 13;
  WM_SELECTITEM       = WM_USER + 14;
  WM_DELETE           = WM_USER + 15;
  WM_CALLBACK         = WM_USER + 16;
  WM_LAYOUTCHANGED    = WM_USER + 17;
  WM_RECORDCHANGED    = WM_USER + 18;
  WM_SETFINDSTR       = WM_USER + 19;
  WM_REALIGNPANELS    = WM_USER + 20;
  WM_REFRESHTREEITEM  = WM_USER + 21;
  WM_SEARCHFAILED     = WM_USER + 22;
  WM_OK_EXECLOCATE    = WM_USER + 23;
  WM_OK_SHOWMODAL     = WM_USER + 24;
  WM_DC_REFRESH       = WM_USER + 25;
  WM_ITEMMOVED        = WM_USER + 26;
  WM_TREESELECT       = WM_USER + 27;

  DefaultColor        = clBlue;
  WarningColor        = clRed;

  MainRegKey  = 'Software\Operator\Sklad'; // copy of prConst.prRegKey
  
//================================================================
var

   GridOddLinesColor  : TColor = $00F7F7F7;
   okRepColor1        : TColor = $00E8E8FF;
   okRepColor2        : TColor = $00FEE8E7;
   okSearchFailedColor: TColor = $006365FF;
   PLGrpColor         : TColor = $00F7F7F7;
   GridHighlightColor : TColor = clNavy;
   GridHideSelColor   : TColor = $00A3A3A3;

//------- Colors ----------
   {clokMainBk         : TColor = $00DEE7EF;
   clokGridHeader     : TColor = $00DEE7EF;
   clokFilter         : TColor = $00EFF7F7;
   clokFooter         : TColor = $00EFF7F7;
   clokDlgBk          : TColor = $00EFF7F7;
   }

   clokMainBk         : TColor = clBtnFace;
   clokGridHeader     : TColor = clBtnFace;
   clokFilter         : TColor = clBtnFace;
   clokFooter         : TColor = clBtnFace;
   clokDlgBk          : TColor = clBtnFace;

   CL_OK_WMAT_HIGHLIGHT_NEEDED : TColor = $00F0E1FF;
   CL_OK_AO_NOT_PAID  : TColor = $00F0E1FF;
   CL_OK_OO_NOT_PAID  : TColor = $00F0E1FF;
   CL_OK_OI_NOT_PAID  : TColor = $00F0E1FF;
   CL_OK_SINGLE_MODE  : TColor = $00BEF6F5;

   //-------------------------
   MatDisplayDigits   : Integer = -4;
   PriceDisplayDigits : Integer = -6;
   PriceRoundFrac     : Integer = 6;
   PriceRoundInt      : Integer = 0;

   WarningChar        : Char = '!';

   NextCtrlOnEnter    : Boolean = True;

//==============================================================================================
implementation

{$IFDEF UDEBUG}
uses
  Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
{$ENDIF}

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('ssBaseConst', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
