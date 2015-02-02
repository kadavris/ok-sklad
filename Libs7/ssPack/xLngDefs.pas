unit xLngDefs;

interface

uses
  Controls, SysUtils;

{
  Именительный   Номинатив    Кто? Что?
  Родительный    Генитив      Кого? Чего?
  Дательный      Датив        Кому? Чему?
  Винительный    Аккузатив    Кого? Что?
  Творительный   Аблатив      Кем? Чем? (объединяет инструментатив, локатив и аблатив)
  Предложный     Препозитив   О ком? О чём? (И т.п.)

  1 год        2-й/5-й год               ед число     какой-то           padezhSNone
               2 года   5 лет            мн число     какие-то           padezhPNone

  в 1-й год    во 2-й/5-й год            ед число     на такой-то        padezhSAge
               в 2 года в 5 лет          мн число     во столько         padezhPAge

  в 1-ом году  во 2-ом/5-ом году         ед число     в таком-то         padezhSAt
  в 1-х/2-х/5-х годах                    мн число     в таких-то         padezhPAt

  к 1-му году  ко 2-му/5-му году         ед число     к такому-то        padezhSToward
               к 2-м годам  к 5-и годам  мн число     к стольки-то       padezhPToward

  до 1 года    до 2-го/5-го года         ед число     до/после/около     padezhSNear
               до 2-х лет   до 5 лет     мн число     такого-то/стольких-то  padezhPNear

  через 1 год 5 лет                      нет числа    через столько-то   padezhWithin

  отрицание?
}

type
  // склонения. см выше
  Tpadezh = (
    // русские падежи. просто и удобно. ж)
    padezhIE = 1, // Именительный   ед число
    padezhIM = 2, // Именительный   мн число
    padezhRE = 3, // Родительный    ед число
    padezhRM = 4, // Родительный    мн число
    padezhDE = 5, // Дательный      ед число
    padezhDM = 6, // Дательный      мн число
    padezhVE = 7, // Винительный    ед число
    padezhVM = 8, // Винительный    мн число
    padezhTE = 9, // Творительный   ед число
    padezhTM = 10,// Творительный   мн число
    padezhPE = 11,// Предложный     ед число
    padezhPM = 12 // Предложный     мн число
  );

  Tgender = (genderNone, genderMale, genderFemale);

  //--------------------------------------------------------------------------
  {TLangSection = class
    private
      FKeys: TStrings;
      FVals: TWideStrings;
      function getVal(const Index: String): WideString;

    public
      constructor Create; overload;
      destructor  Destroy;

      procedure Add(Key: String; Val: WideString);

      property Val: array[const Index: String]: WideString read getVal;
  end;

  TLangFile = class
    private
      FSections: TObjectList; //
      FUTF: Boolean; // file in UTF?
      FFileName: String;
      FLangShortName, FLangName: String;

      function getActive: Boolean;

    public
      constructor Create; overload;
      constructor Create(AFileName: String); overload;
      destructor Destroy;

      function Load(const AFileName: String): Boolean;

      property Active: Boolean read getActive;
      property FileName: String read FFileName;
      property LangShortName: String read FLangShortName;
      property LangName: String read FLangShortName
  end; // TLangFile

  //--------------------------------------------------------------------------
  TLangManager = class
    private
      F

    public
      constructor Create; overload;
      constructor Create(AFolderName: String); overload;
      destructor Destroy;

      function GetRS(ASection, AKey: String): AnsiString;
      function RS(ASection, AKey: String; spaces: Integer = 0): AnsiString;
  end; // TLangManager
  }
  
  //--------------------------------------------------------------------------
  TCountryInfo = record
    cid: Integer; // numeric county index
    code2, code3: String; //ISO 3166 3&2 letter codes
    Name: String; // country full name
    LangID: Integer; // default language for interface, etc.
    AR, defAR: Integer; // Effective/default accounting rules ID
    FlagIndex: Integer; // Index of flag picture in TCountryRules ImageList
  end;

  TCountryRules = class
    private
      FItems: array of TCountryInfo;
      //FFormatSettings: TFormatSettings;
      FFlags: TImageList;
      FCurrent: Integer;
      FDefaultIndex: Integer; // index of default record (U.S.A.)
      FDummy: TCountryInfo; // used in Result to prevent exceptions on 'index out of bounds' and just missing records

      procedure AddItem(dllH: THandle; Aindex: Integer; Acode2, Acode3, AName: String; ALangID, AdefAR: Integer);

      function getCount: Integer;
      function getCurrent: TCountryInfo;
      function getItems(const Idx: Integer): TCountryInfo;
      function getItemsByCID(const cid: Integer): TCountryInfo;
      function getItemsByCode(const Idx: String): TCountryInfo;

      function getCID: Integer;
      function getCode2: String;
      function getCode3: String;
      function getCountryName: String;
      function getLangID: Integer;
      function getAR: Integer;
      procedure setAR(const Value: Integer);
      function getdefAR: Integer;
      function getFlagIndex: Integer;

    public
      constructor Create(dllPath: String);
      destructor Destroy; override;

      function setCurrent(CID: Integer): Boolean; overload;
      function setCurrent(Code: String): Boolean; overload;

      property byCID[const cid: Integer]: TCountryInfo read getItemsByCID;
      property byCode[const Idx: String]: TCountryInfo read getItemsByCode;
      property Count: Integer read getCount;
      //property Current: TCountryInfo read getCurrent;
      //property fmt: TFormatSettings read FFormatSettings;
      property Images: TImageList read FFlags;
      property Items[const Idx: Integer]: TCountryInfo read getItems; default;

      // mimicks current TCountryInfo record for accesibility
      property cid: Integer read getCID;
      property code2: String read getCode2;
      property code3: String read getCode3;
      property CountryName: String read getCountryName;
      property Current: TCountryInfo read getCurrent;
      property LangID: Integer read getLangID;
      property AR: Integer read getAR write setAR;
      property defAR: Integer read getdefAR;
      property FlagIndex: Integer read getFlagIndex;
  end; // TCountryRules
  //--------------------------------------------------------------------------

const
  lidENG = 0;
  lidRUS = 1;
  lidUKR = 2;
  lidESP = 3; // Espanol
  //lidFRA = 4; // Francais
  lidMax = 3; // maximum possible value for error checking purpose

  DefLangID = lidENG;

  LangNames: array[0..lidMax] of String = (
  	'ENG', 'RUS', 'UKR', 'ESP'//, 'FRA'
  );

  // maps local langID into database language ID
  LangIDtoDBid: array[0..lidMax] of Integer = (
    3, 1, 2, 4//, 5
  );

  //---------------------------------------------------------------
  // Accountirng rules IDs.
  accRul_Default = -1;
  accRul_Generic = 0;
  accRul_US = 1;
  accRul_RU = 2;
  accRul_UA = 3;
  accRul_ES = 4;

  accRul_Max = 4; // maximum possible value for error checking purpose

  //--------------------------------------------------------------
  // CountryIDs:
  cidUS = 0;
  cidRU = 1;
  cidUA = 2;
  cidES = 3;

  cidAD = 4;
  cidAE = 5;
  cidAF = 6;
  cidAG = 7;
  cidAI = 8;
  cidAL = 9;
  cidAM = 10;
  cidAN = 11;
  cidAO = 12;
  cidAQ = 13;
  cidAR = 14;
  cidAS = 15;
  cidAT = 16;
  cidAU = 17;
  cidAW = 18;
  cidAX = 19;
  cidAZ = 20;
  cidBA = 21;
  cidBB = 22;
  cidBD = 23;
  cidBE = 24;
  cidBF = 25;
  cidBG = 26;
  cidBH = 27;
  cidBI = 28;
  cidBJ = 29;
  cidBM = 30;
  cidBN = 31;
  cidBO = 32;
  cidBR = 33;
  cidBS = 34;
  cidBT = 35;
  cidBV = 36;
  cidBW = 37;
  cidBY = 38;
  cidBZ = 39;
  cidCA = 40;
  cidCC = 41;
  cidCD = 42;
  cidCF = 43;
  cidCG = 44;
  cidCH = 45;
  cidCI = 46;
  cidCK = 47;
  cidCL = 48;
  cidCM = 49;
  cidCN = 50;
  cidCO = 51;
  cidCR = 52;
  cidCS = 53;
  cidCU = 54;
  cidCV = 55;
  cidCX = 56;
  cidCY = 57;
  cidCZ = 58;
  cidDE = 59;
  cidDJ = 60;
  cidDK = 61;
  cidDM = 62;
  cidDO = 63;
  cidDZ = 64;
  cidEC = 65;
  cidEE = 66;
  cidEG = 67;
  cidEH = 68;
  cidER = 69;
  cidET = 70;
  cidFI = 71;
  cidFJ = 72;
  cidFK = 73;
  cidFM = 74;
  cidFO = 75;
  cidFR = 76;
  cidGA = 77;
  cidGB = 78;
  cidGD = 79;
  cidGE = 80;
  cidGF = 81;
  cidGH = 82;
  cidGI = 83;
  cidGL = 84;
  cidGM = 85;
  cidGN = 86;
  cidGP = 87;
  cidGQ = 88;
  cidGR = 89;
  cidGS = 90;
  cidGT = 91;
  cidGU = 92;
  cidGW = 93;
  cidGY = 94;
  cidHK = 95;
  cidHM = 96;
  cidHN = 97;
  cidHR = 98;
  cidHT = 99;
  cidHU = 100;
  cidID = 101;
  cidIE = 102;
  cidIL = 103;
  cidIN = 104;
  cidIO = 105;
  cidIQ = 106;
  cidIR = 107;
  cidIS = 108;
  cidIT = 109;
  cidJM = 110;
  cidJO = 111;
  cidJP = 112;
  cidKE = 113;
  cidKG = 114;
  cidKH = 115;
  cidKI = 116;
  cidKM = 117;
  cidKN = 118;
  cidKP = 119;
  cidKR = 120;
  cidKW = 121;
  cidKY = 122;
  cidKZ = 123;
  cidLA = 124;
  cidLB = 125;
  cidLC = 126;
  cidLI = 127;
  cidLK = 128;
  cidLR = 129;
  cidLS = 130;
  cidLT = 131;
  cidLU = 132;
  cidLV = 133;
  cidLY = 134;
  cidMA = 135;
  cidMC = 136;
  cidMD = 137;
  cidME = 138;
  cidMG = 139;
  cidMH = 140;
  cidMK = 141;
  cidML = 142;
  cidMM = 143;
  cidMN = 144;
  cidMO = 145;
  cidMP = 146;
  cidMQ = 147;
  cidMR = 148;
  cidMS = 149;
  cidMT = 150;
  cidMU = 151;
  cidMV = 152;
  cidMW = 153;
  cidMX = 154;
  cidMY = 155;
  cidMZ = 156;
  cidNA = 157;
  cidNC = 158;
  cidNE = 159;
  cidNF = 160;
  cidNG = 161;
  cidNI = 162;
  cidNL = 163;
  cidNO = 164;
  cidNP = 165;
  cidNR = 166;
  cidNU = 167;
  cidNZ = 168;
  cidOM = 169;
  cidPA = 170;
  cidPE = 171;
  cidPF = 172;
  cidPG = 173;
  cidPH = 174;
  cidPK = 175;
  cidPL = 176;
  cidPM = 177;
  cidPN = 178;
  cidPR = 179;
  cidPS = 180;
  cidPT = 181;
  cidPW = 182;
  cidPY = 183;
  cidQA = 184;
  cidRE = 185;
  cidRO = 186;
  cidRS = 187;
  cidRW = 188;
  cidSA = 189;
  cidSB = 190;
  cidSC = 191;
  cidSD = 192;
  cidSE = 193;
  cidSG = 194;
  cidSH = 195;
  cidSI = 196;
  cidSJ = 197;
  cidSK = 198;
  cidSL = 199;
  cidSM = 200;
  cidSN = 201;
  cidSO = 202;
  cidSR = 203;
  cidST = 204;
  cidSU = 205;
  cidSV = 206;
  cidSY = 207;
  cidSZ = 208;
  cidTC = 209;
  cidTD = 210;
  cidTF = 211;
  cidTG = 212;
  cidTH = 213;
  cidTJ = 214;
  cidTK = 215;
  cidTL = 216;
  cidTM = 217;
  cidTN = 218;
  cidTO = 219;
  cidTR = 220;
  cidTT = 221;
  cidTV = 222;
  cidTW = 223;
  cidTZ = 224;
  cidUG = 225;
  cidUM = 226;
  cidUY = 227;
  cidUZ = 228;
  cidVA = 229;
  cidVC = 230;
  cidVE = 231;
  cidVG = 232;
  cidVI = 233;
  cidVN = 234;
  cidVU = 235;
  cidWF = 236;
  cidWS = 237;
  cidYE = 238;
  cidYT = 239;
  cidZA = 240;
  cidZM = 241;
  cidZW = 242;

  cidMax = 242; // maximum possible value for error checking purpose

  // see also function CountryIDToAccountingRulesID
//---------------------------------------------------------------------------------------------
var
  // Language settings
  LangID     : Integer = -1; // current interface lang ID
  ReplangID  : Integer = -1; // current reports lang ID
  LangName   : string;  // current lang name
  RepLangName: string;  // current reports lang name
  RepDir     : string;  // reports path for current lang
  CountryRules: TCountryRules;

//---------------------------------------------------
function LangIDbyName(lnam: String): Integer;
function CountryIDbyShortName(lnam: String): Integer;
function CountryIDToAccountingRulesID(cid: Integer): Integer;

//==============================================================================================
//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  Windows, ImgList, Graphics;

//==============================================================================================
constructor TCountryRules.Create(dllPath: String);
  var
    DllH: THandle;
begin
  FFlags := TImageList.Create(nil);
  FCurrent := -1;
  with FDummy do begin
    cid := -1;
    code2 := '--';
    code3 := '---';
    Name := '-';
    LangID := -1;
    AR := accRul_Default;
    defAR := accRul_Default;
    FlagIndex := -1;
  end;

  //getLocaleFormatSettings(GetUserDefaultLCID, FFormatSettings);

  dllH := loadLibrary(PChar(dllPath));
  FFlags.resInstLoad(dllH, rtBitmap, '__', clNone); // generic flag '__.bmp' idx: 0

  // pre-sorted by country name
  AddItem(dllH, cidAF, 'AF', 'AFG', 'Afghanistan',   lidENG, accRul_Generic);
  AddItem(dllH, cidAX, 'AX', 'ALA', 'Aland Islands', lidENG, accRul_Generic);
  AddItem(dllH, cidAL, 'AL', 'ALB', 'Albania',       lidENG, accRul_Generic);
  AddItem(dllH, cidDZ, 'DZ', 'DZA', 'Algeria',       lidENG, accRul_Generic);
  AddItem(dllH, cidAS, 'AS', 'ASM', 'American Samoa',lidENG, accRul_Generic);
  AddItem(dllH, cidAD, 'AD', 'AND', 'Andorra',       lidENG, accRul_Generic);
  AddItem(dllH, cidAO, 'AO', 'AGO', 'Angola',        lidENG, accRul_Generic);
  AddItem(dllH, cidAI, 'AI', 'AIA', 'Anguilla',      lidENG, accRul_Generic);
  AddItem(dllH, cidAQ, 'AQ', 'ATA', 'Antarctica',    lidENG, accRul_Generic);
  AddItem(dllH, cidAG, 'AG', 'ATG', 'Antigua and Barbuda', lidENG, accRul_Generic);
  AddItem(dllH, cidAR, 'AR', 'ARG', 'Argentina',     lidENG, accRul_Generic);
  AddItem(dllH, cidAM, 'AM', 'ARM', 'Armenia',       lidENG, accRul_Generic);
  AddItem(dllH, cidAW, 'AW', 'ABW', 'Aruba',         lidENG, accRul_Generic);
  AddItem(dllH, cidAU, 'AU', 'AUS', 'Australia',     lidENG, accRul_Generic);
  AddItem(dllH, cidAT, 'AT', 'AUT', 'Austria',       lidENG, accRul_Generic);
  AddItem(dllH, cidAZ, 'AZ', 'AZE', 'Azerbaijan',    lidENG, accRul_Generic);
  AddItem(dllH, cidBS, 'BS', 'BHS', 'Bahamas',       lidENG, accRul_Generic);
  AddItem(dllH, cidBH, 'BH', 'BHR', 'Bahrain',       lidENG, accRul_Generic);
  AddItem(dllH, cidBD, 'BD', 'BGD', 'Bangladesh',    lidENG, accRul_Generic);
  AddItem(dllH, cidBB, 'BB', 'BRB', 'Barbados',      lidENG, accRul_Generic);
  AddItem(dllH, cidBY, 'BY', 'BLR', 'Belarus',       lidENG, accRul_Generic);
  AddItem(dllH, cidBE, 'BE', 'BEL', 'Belgium',       lidENG, accRul_Generic);
  AddItem(dllH, cidBZ, 'BZ', 'BLZ', 'Belize',        lidENG, accRul_Generic);
  AddItem(dllH, cidBJ, 'BJ', 'BEN', 'Benin',         lidENG, accRul_Generic);
  AddItem(dllH, cidBM, 'BM', 'BMU', 'Bermuda',       lidENG, accRul_Generic);
  AddItem(dllH, cidBT, 'BT', 'BTN', 'Bhutan',        lidENG, accRul_Generic);
  AddItem(dllH, cidBO, 'BO', 'BOL', 'Bolivia',       lidENG, accRul_Generic);
  AddItem(dllH, cidBA, 'BA', 'BIH', 'Bosnia and Herzegovina', lidENG, accRul_Generic);
  AddItem(dllH, cidBW, 'BW', 'BWA', 'Botswana',      lidENG, accRul_Generic);
  AddItem(dllH, cidBV, 'BV', 'BVT', 'Bouvet Island', lidENG, accRul_Generic);
  AddItem(dllH, cidBR, 'BR', 'BRA', 'Brazil',        lidESP, accRul_Generic); // ESP?
  AddItem(dllH, cidIO, 'IO', 'IOT', 'British Indian Ocean terr', lidENG, accRul_Generic);
  AddItem(dllH, cidBN, 'BN', 'BRN', 'Brunei Darussalam', lidENG, accRul_Generic);
  AddItem(dllH, cidBG, 'BG', 'BGR', 'Bulgaria',      lidENG, accRul_Generic);
  AddItem(dllH, cidBF, 'BF', 'BFA', 'Burkina Faso',  lidENG, accRul_Generic);
  AddItem(dllH, cidBI, 'BI', 'BDI', 'Burundi',       lidENG, accRul_Generic);
  AddItem(dllH, cidKH, 'KH', 'KHM', 'Cambodia',      lidENG, accRul_Generic);
  AddItem(dllH, cidCM, 'CM', 'CMR', 'Cameroon',      lidENG, accRul_Generic);
  AddItem(dllH, cidCA, 'CA', 'CAN', 'Canada',        lidENG, accRul_Generic);
  AddItem(dllH, cidCV, 'CV', 'CPV', 'Cape Verde',    lidENG, accRul_Generic);
  AddItem(dllH, cidKY, 'KY', 'CYM', 'Cayman Islands',lidENG, accRul_Generic);
  AddItem(dllH, cidCF, 'CF', 'CAF', 'Central African Republic', lidENG, accRul_Generic);
  AddItem(dllH, cidTD, 'TD', 'TCD', 'Chad',          lidENG, accRul_Generic);
  AddItem(dllH, cidCL, 'CL', 'CHL', 'Chile',         lidENG, accRul_Generic);
  AddItem(dllH, cidCN, 'CN', 'CHN', 'China',         lidENG, accRul_Generic);
  AddItem(dllH, cidCX, 'CX', 'CXR', 'Christmas Island', lidENG, accRul_Generic);
  AddItem(dllH, cidCC, 'CC', 'CCK', 'Cocos (Keeling) Islands', lidENG, accRul_Generic);
  AddItem(dllH, cidCO, 'CO', 'COL', 'Colombia',      lidENG, accRul_Generic);
  AddItem(dllH, cidKM, 'KM', 'COM', 'Comoros',       lidENG, accRul_Generic);
  AddItem(dllH, cidCG, 'CG', 'COG', 'Congo',         lidENG, accRul_Generic);
  AddItem(dllH, cidCD, 'CD', 'COD', 'Congo, the Democratic Rep', lidENG, accRul_Generic);
  AddItem(dllH, cidCK, 'CK', 'COK', 'Cook Islands',  lidENG, accRul_Generic);
  AddItem(dllH, cidCR, 'CR', 'CRI', 'Costa Rica',    lidENG, accRul_Generic);
  AddItem(dllH, cidCI, 'CI', 'CIV', 'Cote d''''Ivoire', lidENG, accRul_Generic);
  AddItem(dllH, cidHR, 'HR', 'HRV', 'Croatia',       lidENG, accRul_Generic);
  AddItem(dllH, cidCU, 'CU', 'CUB', 'Cuba',          lidENG, accRul_Generic);
  AddItem(dllH, cidCY, 'CY', 'CYP', 'Cyprus',        lidENG, accRul_Generic);
  AddItem(dllH, cidCZ, 'CZ', 'CZE', 'Czech Republic',lidENG, accRul_Generic);
  AddItem(dllH, cidDK, 'DK', 'DNK', 'Denmark',       lidENG, accRul_Generic);
  AddItem(dllH, cidDJ, 'DJ', 'DJI', 'Djibouti',      lidENG, accRul_Generic);
  AddItem(dllH, cidDM, 'DM', 'DMA', 'Dominica',      lidENG, accRul_Generic);
  AddItem(dllH, cidDO, 'DO', 'DOM', 'Dominican Republic', lidENG, accRul_Generic);
  AddItem(dllH, cidEC, 'EC', 'ECU', 'Ecuador',       lidENG, accRul_Generic);
  AddItem(dllH, cidEG, 'EG', 'EGY', 'Egypt',         lidENG, accRul_Generic);
  AddItem(dllH, cidSV, 'SV', 'SLV', 'El Salvador',   lidENG, accRul_Generic);
  AddItem(dllH, cidGQ, 'GQ', 'GNQ', 'Equatorial Guinea', lidENG, accRul_Generic);
  AddItem(dllH, cidER, 'ER', 'ERI', 'Eritrea',       lidENG, accRul_Generic);
  AddItem(dllH, cidEE, 'EE', 'EST', 'Estonia',       lidENG, accRul_Generic);
  AddItem(dllH, cidET, 'ET', 'ETH', 'Ethiopia',      lidENG, accRul_Generic);
  AddItem(dllH, cidFK, 'FK', 'FLK', 'Falkland (Malvinas)', lidENG, accRul_Generic);
  AddItem(dllH, cidFO, 'FO', 'FRO', 'Faroe Islands', lidENG, accRul_Generic);
  AddItem(dllH, cidFJ, 'FJ', 'FJI', 'Fiji',          lidENG, accRul_Generic);
  AddItem(dllH, cidFI, 'FI', 'FIN', 'Finland',       lidENG, accRul_Generic);
  AddItem(dllH, cidFR, 'FR', 'FRA', 'France',        lidENG, accRul_Generic);
  AddItem(dllH, cidGF, 'GF', 'GUF', 'French Guiana', lidENG, accRul_Generic);
  AddItem(dllH, cidPF, 'PF', 'PYF', 'French Polynesia', lidENG, accRul_Generic);
  AddItem(dllH, cidTF, 'TF', 'ATF', 'French Southern Terr', lidENG, accRul_Generic);
  AddItem(dllH, cidGA, 'GA', 'GAB', 'Gabon',         lidENG, accRul_Generic);
  AddItem(dllH, cidGM, 'GM', 'GMB', 'Gambia',        lidENG, accRul_Generic);
  AddItem(dllH, cidGE, 'GE', 'GEO', 'Georgia',       lidENG, accRul_Generic);
  AddItem(dllH, cidDE, 'DE', 'DEU', 'Germany',       lidENG, accRul_Generic);
  AddItem(dllH, cidGH, 'GH', 'GHA', 'Ghana',         lidENG, accRul_Generic);
  AddItem(dllH, cidGI, 'GI', 'GIB', 'Gibraltar',     lidENG, accRul_Generic);
  AddItem(dllH, cidGR, 'GR', 'GRC', 'Greece',        lidENG, accRul_Generic);
  AddItem(dllH, cidGL, 'GL', 'GRL', 'Greenland',     lidENG, accRul_Generic);
  AddItem(dllH, cidGD, 'GD', 'GRD', 'Grenada',       lidENG, accRul_Generic);
  AddItem(dllH, cidGP, 'GP', 'GLP', 'Guadeloupe',    lidENG, accRul_Generic);
  AddItem(dllH, cidGU, 'GU', 'GUM', 'Guam',          lidENG, accRul_Generic);
  AddItem(dllH, cidGT, 'GT', 'GTM', 'Guatemala',     lidENG, accRul_Generic);
  AddItem(dllH, cidGN, 'GN', 'GIN', 'Guinea',        lidENG, accRul_Generic);
  AddItem(dllH, cidGW, 'GW', 'GNB', 'Guinea-Bissau', lidENG, accRul_Generic);
  AddItem(dllH, cidGY, 'GY', 'GUY', 'Guyana',        lidENG, accRul_Generic);
  AddItem(dllH, cidHT, 'HT', 'HTI', 'Haiti',         lidENG, accRul_Generic);
  AddItem(dllH, cidHM, 'HM', 'HMD', 'Heard and McDonald', lidENG, accRul_Generic);
  AddItem(dllH, cidHN, 'HN', 'HND', 'Honduras',      lidENG, accRul_Generic);
  AddItem(dllH, cidHK, 'HK', 'HKG', 'Hong Kong',     lidENG, accRul_Generic);
  AddItem(dllH, cidHU, 'HU', 'HUN', 'Hungary',       lidENG, accRul_Generic);
  AddItem(dllH, cidIS, 'IS', 'ISL', 'Iceland',       lidENG, accRul_Generic);
  AddItem(dllH, cidIN, 'IN', 'IND', 'India',         lidENG, accRul_Generic);
  AddItem(dllH, cidID, 'ID', 'IDN', 'Indonesia',     lidENG, accRul_Generic);
  AddItem(dllH, cidIR, 'IR', 'IRN', 'Iran',          lidENG, accRul_Generic);
  AddItem(dllH, cidIQ, 'IQ', 'IRQ', 'Iraq',          lidENG, accRul_Generic);
  AddItem(dllH, cidIE, 'IE', 'IRL', 'Ireland',       lidENG, accRul_Generic);
  AddItem(dllH, cidIL, 'IL', 'ISR', 'Israel',        lidENG, accRul_Generic);
  AddItem(dllH, cidIT, 'IT', 'ITA', 'Italy',         lidENG, accRul_Generic);
  AddItem(dllH, cidJM, 'JM', 'JAM', 'Jamaica',       lidENG, accRul_Generic);
  AddItem(dllH, cidJP, 'JP', 'JPN', 'Japan',         lidENG, accRul_Generic);
  AddItem(dllH, cidJO, 'JO', 'JOR', 'Jordan',        lidENG, accRul_Generic);
  AddItem(dllH, cidKZ, 'KZ', 'KAZ', 'Kazakhstan',    lidRUS, accRul_Generic);
  AddItem(dllH, cidKE, 'KE', 'KEN', 'Kenya',         lidENG, accRul_Generic);
  AddItem(dllH, cidKI, 'KI', 'KIR', 'Kiribati',      lidENG, accRul_Generic);
  AddItem(dllH, cidKP, 'KP', 'PRK', 'Korea, Democr People''''s Rep', lidENG, accRul_Generic);
  AddItem(dllH, cidKR, 'KR', 'KOR', 'Korea, Republic of', lidENG, accRul_Generic);
  AddItem(dllH, cidKW, 'KW', 'KWT', 'Kuwait',        lidENG, accRul_Generic);
  AddItem(dllH, cidKG, 'KG', 'KGZ', 'Kyrgyzstan',    lidENG, accRul_Generic);
  AddItem(dllH, cidLA, 'LA', 'LAO', 'Lao People''''s Democr Rep', lidENG, accRul_Generic);
  AddItem(dllH, cidLV, 'LV', 'LVA', 'Latvia',        lidRUS, accRul_Generic);
  AddItem(dllH, cidLB, 'LB', 'LBN', 'Lebanon',       lidENG, accRul_Generic);
  AddItem(dllH, cidLS, 'LS', 'LSO', 'Lesotho',       lidENG, accRul_Generic);
  AddItem(dllH, cidLR, 'LR', 'LBR', 'Liberia',       lidENG, accRul_Generic);
  AddItem(dllH, cidLY, 'LY', 'LBY', 'Libyan Arab Jamahiriya', lidENG, accRul_Generic);
  AddItem(dllH, cidLI, 'LI', 'LIE', 'Liechtenstein', lidENG, accRul_Generic);
  AddItem(dllH, cidLT, 'LT', 'LTU', 'Lithuania',     lidENG, accRul_Generic);
  AddItem(dllH, cidLU, 'LU', 'LUX', 'Luxembourg',    lidENG, accRul_Generic);
  AddItem(dllH, cidMO, 'MO', 'MAC', 'Macao',         lidENG, accRul_Generic);
  AddItem(dllH, cidMK, 'MK', 'MKD', 'Macedonia',     lidENG, accRul_Generic);
  AddItem(dllH, cidMG, 'MG', 'MDG', 'Madagascar',    lidENG, accRul_Generic);
  AddItem(dllH, cidMW, 'MW', 'MWI', 'Malawi',        lidENG, accRul_Generic);
  AddItem(dllH, cidMY, 'MY', 'MYS', 'Malaysia',      lidENG, accRul_Generic);
  AddItem(dllH, cidMV, 'MV', 'MDV', 'Maldives',      lidENG, accRul_Generic);
  AddItem(dllH, cidML, 'ML', 'MLI', 'Mali',          lidENG, accRul_Generic);
  AddItem(dllH, cidMT, 'MT', 'MLT', 'Malta',         lidENG, accRul_Generic);
  AddItem(dllH, cidMH, 'MH', 'MHL', 'Marshall Islands', lidENG, accRul_Generic);
  AddItem(dllH, cidMQ, 'MQ', 'MTQ', 'Martinique',    lidENG, accRul_Generic);
  AddItem(dllH, cidMR, 'MR', 'MRT', 'Mauritania',    lidENG, accRul_Generic);
  AddItem(dllH, cidMU, 'MU', 'MUS', 'Mauritius',     lidENG, accRul_Generic);
  AddItem(dllH, cidYT, 'YT', 'MYT', 'Mayotte',       lidENG, accRul_Generic);
  AddItem(dllH, cidMX, 'MX', 'MEX', 'Mexico',        lidESP, accRul_Generic);
  AddItem(dllH, cidFM, 'FM', 'FSM', 'Micronesia',    lidENG, accRul_Generic);
  AddItem(dllH, cidMD, 'MD', 'MDA', 'Moldova',       lidRUS, accRul_Generic);
  AddItem(dllH, cidMC, 'MC', 'MCO', 'Monaco',        lidENG, accRul_Generic);
  AddItem(dllH, cidMN, 'MN', 'MNG', 'Mongolia',      lidENG, accRul_Generic);
  AddItem(dllH, cidME, 'ME', 'MNE', 'Montenegro',    lidENG, accRul_Generic);
  AddItem(dllH, cidMS, 'MS', 'MSR', 'Montserrat',    lidENG, accRul_Generic);
  AddItem(dllH, cidMA, 'MA', 'MAR', 'Morocco',       lidENG, accRul_Generic);
  AddItem(dllH, cidMZ, 'MZ', 'MOZ', 'Mozambique',    lidENG, accRul_Generic);
  AddItem(dllH, cidMM, 'MM', 'MMR', 'Myanmar',       lidENG, accRul_Generic);
  AddItem(dllH, cidNA, 'NA', 'NAM', 'Namibia',       lidENG, accRul_Generic);
  AddItem(dllH, cidNR, 'NR', 'NRU', 'Nauru',         lidENG, accRul_Generic);
  AddItem(dllH, cidNP, 'NP', 'NPL', 'Nepal',         lidENG, accRul_Generic);
  AddItem(dllH, cidNL, 'NL', 'NLD', 'Netherlands',   lidENG, accRul_Generic);
  AddItem(dllH, cidAN, 'AN', 'ANT', 'Netherlands Antilles', lidENG, accRul_Generic);
  AddItem(dllH, cidNC, 'NC', 'NCL', 'New Caledonia', lidENG, accRul_Generic);
  AddItem(dllH, cidNZ, 'NZ', 'NZL', 'New Zealand',   lidENG, accRul_Generic);
  AddItem(dllH, cidNI, 'NI', 'NIC', 'Nicaragua',     lidENG, accRul_Generic);
  AddItem(dllH, cidNE, 'NE', 'NER', 'Niger',         lidENG, accRul_Generic);
  AddItem(dllH, cidNG, 'NG', 'NGA', 'Nigeria',       lidENG, accRul_Generic);
  AddItem(dllH, cidNU, 'NU', 'NIU', 'Niue',          lidENG, accRul_Generic);
  AddItem(dllH, cidNF, 'NF', 'NFK', 'Norfolk Island',lidENG, accRul_Generic);
  AddItem(dllH, cidMP, 'MP', 'MNP', 'Northern Mariana Islands', lidENG, accRul_Generic);
  AddItem(dllH, cidNO, 'NO', 'NOR', 'Norway',        lidENG, accRul_Generic);
  AddItem(dllH, cidOM, 'OM', 'OMN', 'Oman',          lidENG, accRul_Generic);
  AddItem(dllH, cidPK, 'PK', 'PAK', 'Pakistan',      lidENG, accRul_Generic);
  AddItem(dllH, cidPW, 'PW', 'PLW', 'Palau',         lidENG, accRul_Generic);
  AddItem(dllH, cidPS, 'PS', 'PSE', 'Palestina',     lidENG, accRul_Generic);
  AddItem(dllH, cidPA, 'PA', 'PAN', 'Panama',        lidENG, accRul_Generic);
  AddItem(dllH, cidPG, 'PG', 'PNG', 'Papua New Guinea', lidENG, accRul_Generic);
  AddItem(dllH, cidPY, 'PY', 'PRY', 'Paraguay',      lidENG, accRul_Generic);
  AddItem(dllH, cidPE, 'PE', 'PER', 'Peru',          lidENG, accRul_Generic);
  AddItem(dllH, cidPH, 'PH', 'PHL', 'Philippines',   lidENG, accRul_Generic);
  AddItem(dllH, cidPN, 'PN', 'PCN', 'Pitcairn',      lidENG, accRul_Generic);
  AddItem(dllH, cidPL, 'PL', 'POL', 'Poland',        lidENG, accRul_Generic);
  AddItem(dllH, cidPT, 'PT', 'PRT', 'Portugal',      lidENG, accRul_Generic);
  AddItem(dllH, cidPR, 'PR', 'PRI', 'Puerto Rico',   lidENG, accRul_Generic);
  AddItem(dllH, cidQA, 'QA', 'QAT', 'Qatar',         lidENG, accRul_Generic);
  AddItem(dllH, cidRE, 'RE', 'REU', 'Reunion',       lidENG, accRul_Generic);
  AddItem(dllH, cidRO, 'RO', 'ROU', 'Romania',       lidENG, accRul_Generic);
  AddItem(dllH, cidRU, 'RU', 'RUS', 'Russia',        lidRUS, accRul_RU);
  AddItem(dllH, cidRW, 'RW', 'RWA', 'Rwanda',        lidENG, accRul_Generic);
  AddItem(dllH, cidSH, 'SH', 'SHN', 'Saint Helena',  lidENG, accRul_Generic);
  AddItem(dllH, cidKN, 'KN', 'KNA', 'Saint Kitts and Nevis', lidENG, accRul_Generic);
  AddItem(dllH, cidLC, 'LC', 'LCA', 'Saint Lucia',   lidENG, accRul_Generic);
  AddItem(dllH, cidPM, 'PM', 'SPM', 'Saint Pierre and Miquelon', lidENG, accRul_Generic);
  AddItem(dllH, cidWS, 'WS', 'WSM', 'Samoa',         lidENG, accRul_Generic);
  AddItem(dllH, cidSM, 'SM', 'SMR', 'San Marino',    lidENG, accRul_Generic);
  AddItem(dllH, cidST, 'ST', 'STP', 'Sao Tome and Principe', lidENG, accRul_Generic);
  AddItem(dllH, cidSA, 'SA', 'SAU', 'Saudi Arabia',  lidENG, accRul_Generic);
  AddItem(dllH, cidSN, 'SN', 'SEN', 'Senegal',       lidENG, accRul_Generic);
  AddItem(dllH, cidRS, 'RS', 'SRB', 'Serbia(SRB)',   lidENG, accRul_Generic);
  AddItem(dllH, cidCS, 'CS', 'SCG', 'Serbia(SCG)',   lidENG, accRul_Generic);
  AddItem(dllH, cidSC, 'SC', 'SYC', 'Seychelles',    lidENG, accRul_Generic);
  AddItem(dllH, cidSL, 'SL', 'SLE', 'Sierra Leone',  lidENG, accRul_Generic);
  AddItem(dllH, cidSG, 'SG', 'SGP', 'Singapore',     lidENG, accRul_Generic);
  AddItem(dllH, cidSK, 'SK', 'SVK', 'Slovakia',      lidENG, accRul_Generic);
  AddItem(dllH, cidSI, 'SI', 'SVN', 'Slovenia',      lidENG, accRul_Generic);
  AddItem(dllH, cidSB, 'SB', 'SLB', 'Solomon Islands', lidENG, accRul_Generic);
  AddItem(dllH, cidSO, 'SO', 'SOM', 'Somalia',       lidENG, accRul_Generic);
  AddItem(dllH, cidZA, 'ZA', 'ZAF', 'South Africa',  lidENG, accRul_Generic);
  AddItem(dllH, cidGS, 'GS', 'SGS', 'South Georgia and Sandwich', lidENG, accRul_Generic);
  AddItem(dllH, cidES, 'ES', 'ESP', 'Spain',         lidENG, accRul_ES);
  AddItem(dllH, cidLK, 'LK', 'LKA', 'Sri Lanka',     lidENG, accRul_Generic);
  AddItem(dllH, cidVC, 'VC', 'VCT', 'St Vincent and Grenadines', lidENG, accRul_Generic);
  AddItem(dllH, cidSD, 'SD', 'SDN', 'Sudan',         lidENG, accRul_Generic);
  AddItem(dllH, cidSR, 'SR', 'SUR', 'Suriname',      lidENG, accRul_Generic);
  AddItem(dllH, cidSJ, 'SJ', 'SJM', 'Svalbard and Jan Mayen', lidENG, accRul_Generic);
  AddItem(dllH, cidSZ, 'SZ', 'SWZ', 'Swaziland',     lidENG, accRul_Generic);
  AddItem(dllH, cidSE, 'SE', 'SWE', 'Sweden',        lidENG, accRul_Generic);
  AddItem(dllH, cidCH, 'CH', 'CHE', 'Switzerland',   lidENG, accRul_Generic);
  AddItem(dllH, cidSY, 'SY', 'SYR', 'Syrian Arab Republic', lidENG, accRul_Generic);
  AddItem(dllH, cidTW, 'TW', 'TWN', 'Taiwan',        lidENG, accRul_Generic);
  AddItem(dllH, cidTJ, 'TJ', 'TJK', 'Tajikistan',    lidRUS, accRul_Generic);
  AddItem(dllH, cidTZ, 'TZ', 'TZA', 'Tanzania',      lidENG, accRul_Generic);
  AddItem(dllH, cidTH, 'TH', 'THA', 'Thailand',      lidENG, accRul_Generic);
  AddItem(dllH, cidTL, 'TL', 'TLS', 'Timor-Leste',   lidENG, accRul_Generic);
  AddItem(dllH, cidTG, 'TG', 'TGO', 'Togo',          lidENG, accRul_Generic);
  AddItem(dllH, cidTK, 'TK', 'TKL', 'Tokelau',       lidENG, accRul_Generic);
  AddItem(dllH, cidTO, 'TO', 'TON', 'Tonga',         lidENG, accRul_Generic);
  AddItem(dllH, cidTT, 'TT', 'TTO', 'Trinidad and Tobago', lidENG, accRul_Generic);
  AddItem(dllH, cidTN, 'TN', 'TUN', 'Tunisia',       lidENG, accRul_Generic);
  AddItem(dllH, cidTR, 'TR', 'TUR', 'Turkey',        lidENG, accRul_Generic);
  AddItem(dllH, cidTM, 'TM', 'TKM', 'Turkmenistan',  lidRUS, accRul_Generic);
  AddItem(dllH, cidTC, 'TC', 'TCA', 'Turks and Caicos Isl', lidENG, accRul_Generic);
  AddItem(dllH, cidTV, 'TV', 'TUV', 'Tuvalu',        lidENG, accRul_Generic);
  AddItem(dllH, cidUM, 'UM', 'UMI', 'U.S. Minor Outlying Isl', lidENG, accRul_US);
  AddItem(dllH, cidUS, 'US', 'USA', 'U.S.A.',        lidENG, accRul_US);
  AddItem(dllH, cidUG, 'UG', 'UGA', 'Uganda',        lidENG, accRul_Generic);
  AddItem(dllH, cidUA, 'UA', 'UKR', 'Ukraine',       lidRUS, accRul_UA);
  AddItem(dllH, cidAE, 'AE', 'ARE', 'United Arab Emirates', lidENG, accRul_Generic);
  AddItem(dllH, cidGB, 'GB', 'GBR', 'United Kingdom',lidENG, accRul_Generic);
  AddItem(dllH, cidUY, 'UY', 'URY', 'Uruguay',       lidENG, accRul_Generic);
  AddItem(dllH, cidSU, 'SU', 'SUN', 'USSR',          lidRUS, accRul_Generic);
  AddItem(dllH, cidUZ, 'UZ', 'UZB', 'Uzbekistan',    lidRUS, accRul_Generic);
  AddItem(dllH, cidVU, 'VU', 'VUT', 'Vanuatu',       lidENG, accRul_Generic);
  AddItem(dllH, cidVA, 'VA', 'VAT', 'Vatican',       lidENG, accRul_Generic);
  AddItem(dllH, cidVE, 'VE', 'VEN', 'Venezuela',     lidENG, accRul_Generic);
  AddItem(dllH, cidVN, 'VN', 'VNM', 'Viet Nam',      lidENG, accRul_Generic);
  AddItem(dllH, cidVG, 'VG', 'VGB', 'Virgin Islands, British', lidENG, accRul_Generic);
  AddItem(dllH, cidVI, 'VI', 'VIR', 'Virgin Islands, U.S.', lidENG, accRul_US);
  AddItem(dllH, cidWF, 'WF', 'WLF', 'Wallis and Futuna', lidENG, accRul_Generic);
  AddItem(dllH, cidEH, 'EH', 'ESH', 'Western Sahara',lidENG, accRul_Generic);
  AddItem(dllH, cidYE, 'YE', 'YEM', 'Yemen',         lidENG, accRul_Generic);
  AddItem(dllH, cidZM, 'ZM', 'ZMB', 'Zambia',        lidENG, accRul_Generic);
  AddItem(dllH, cidZW, 'ZW', 'ZWE', 'Zimbabwe',      lidENG, accRul_Generic);

  FreeLibrary(dllH);
end;

//==============================================================================================
destructor TCountryRules.Destroy;
begin
  FFlags.Free;
end;

//==============================================================================================
procedure TCountryRules.AddItem(dllH: THandle; Aindex: Integer; Acode2, Acode3, AName: String; ALangID, AdefAR: Integer);
begin
  setlength(FItems, High(FItems) + 2);

  with FItems[High(FItems)] do begin
    CID := AIndex;
    code2 := Acode2;
    if ACode2 = 'US' then FDefaultIndex := High(FItems);
    code3 := ACode3;
    Name := AName;
    LangID := ALangID;
    AR := AdefAR;
    defAR := ADefAR;

    if FFlags.resInstLoad(dllH, rtBitmap, Acode2, clNone)
      then FlagIndex := FFlags.Count - 1
      else FlagIndex := 0; // '__.bmp'
  end;
end;

//==============================================================================================
function TCountryRules.getCount: Integer;
begin
  Result := High(FItems) + 1;
end;

//==============================================================================================
function TCountryRules.getCurrent: TCountryInfo;
begin
  if FCurrent = -1 then begin
    FDummy.Name := 'TCountryRules.getCurrent: no current item set';
    Result := FDummy;
  end
  else Result := FItems[FCurrent];
end;

//==============================================================================================
function TCountryRules.setCurrent(CID: Integer): Boolean;
  var
    i: integer;
begin
  for i := 0 to High(FItems) do
    if FItems[i].cid = cid then begin
      FCurrent := i;
      Result := True;
      Exit;
    end;

  Result := False;
end;

//==============================================================================================
function TCountryRules.setCurrent(Code: String): Boolean;
  var
    i,l: integer;
begin
  l := length(Code);
  for i := 0 to High(FItems) do
    if ((l = 2) and (FItems[i].Code2 = Code)) or ((l = 3) and (FItems[i].Code3 = Code)) then begin
      FCurrent := i;
      Result := True;
      Exit;
    end;

  Result := False;
end;

//==============================================================================================
function TCountryRules.getItems(const Idx: Integer): TCountryInfo;
begin
  if (Idx < 0) or (Idx > High(FItems)) then begin
    FDummy.Name := 'TCountryRules.getItems: index ' + IntToStr(Idx) + ' out of bounds';
    Result := FDummy;
  end
  else Result := FItems[Idx];
end;

//==============================================================================================
function TCountryRules.getItemsByCID(const cid: Integer): TCountryInfo;
  var
    i: integer;
begin
  for i := 0 to High(FItems) do
    if FItems[i].CID = cid then begin
      Result := FItems[i];
      Exit;
    end;

  FDummy.Name := 'TCountryRules.getItemsByCID: CID ' + IntToStr(cid) + ' not found';
  Result := FDummy;
end;

//==============================================================================================
function TCountryRules.getItemsByCode(const Idx: String): TCountryInfo;
  var
    i,l: integer;
begin
  l := length(Idx);

  for i := 0 to High(FItems) do
    if ((l = 2) and (FItems[i].Code2 = Idx)) or ((l = 3) and (FItems[i].Code3 = Idx)) then begin
      Result := FItems[i];
      Exit;
    end;

  FDummy.Name := 'TCountryRules.getItemsByCode: "' + Idx + '" not found';
  Result := FDummy;
end;

//==============================================================================================
function TCountryRules.getCID: Integer;
begin
  if FCurrent = -1
    then Result := -1
    else Result := FItems[FCurrent].CID;
end;

//==============================================================================================
function TCountryRules.getCode2: String;
begin
  if FCurrent = -1
    then Result := '--'
    else Result := FItems[FCurrent].Code2;
end;

//==============================================================================================
function TCountryRules.getCode3: String;
begin
  if FCurrent = -1
    then Result := '---'
    else Result := FItems[FCurrent].Code3;
end;

//==============================================================================================
function TCountryRules.getCountryName: String;
begin
  if FCurrent = -1
    then Result := '*UNDEF*'
    else Result := FItems[FCurrent].Name;
end;

//==============================================================================================
function TCountryRules.getLangID: Integer;
begin
  if FCurrent = -1
    then Result := -1
    else Result := FItems[FCurrent].LangID;
end;

//==============================================================================================
function TCountryRules.getAR: Integer;
begin
  if FCurrent = -1 // country is not set
    then Result := accRul_Generic
    else if FItems[FCurrent].AR = accRul_Default
         then Result := FItems[FCurrent].defAR
         else Result := FItems[FCurrent].AR;
end;

//==============================================================================================
procedure TCountryRules.setAR(const Value: Integer);
begin
  if FCurrent <> -1 then FItems[FCurrent].AR := Value;
end;

//==============================================================================================
function TCountryRules.getdefAR: Integer;
begin
  if FCurrent = -1
    then Result := accRul_Generic
    else Result := FItems[FCurrent].defAR;
end;

//==============================================================================================
function TCountryRules.getFlagIndex: Integer;
begin
  if FCurrent = -1
    then Result := -1
    else Result := FItems[FCurrent].FlagIndex;
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
//==============================================================================================
function LangIDbyName(lnam: String): Integer;
  var
    i:integer;
begin
  Result := -1;
  lnam := AnsiLowerCase(lnam);

  for i := 0 to High(LangNames) do
    if lnam = AnsiLowerCase(LangNames[i]) then begin
      Result := i;
      Exit;
    end;
end;

//==============================================================================================
function CountryIDbyShortName(lnam: String): Integer;
  var
    i:integer;
begin
  Result := -1;
  lnam := AnsiLowerCase(lnam);

  for i := 0 to CountryRules.Count - 1 do
    if lnam = AnsiLowerCase(CountryRules[i].Code2) then begin
      Result := CountryRules[i].cid;
      Exit;
    end;
end;

//==============================================================================================
function CountryIDToAccountingRulesID(cid: Integer): Integer;
begin
  case cid of
    cidUS: Result := accRul_US;
    cidRU: Result := accRul_RU;
    cidUA: Result := accRul_UA;
    cidES: Result := accRul_ES;
    else Result := accRul_Generic;
  end; // case cid
end;

//==============================================================================================
{
win SDK locale funcs:

int GetLocaleInfo(
    LCID Locale,	// locale identifier
    LCTYPE LCType,	// type of information
    LPTSTR lpLCData,	// address of buffer for information
    int cchData 	// size of buffer
   );

for lcid:
LCID GetSystemDefaultLCID(void)   or  GetUserDefaultLCID

LOCALE_IDIGITS -decimal digits #
LOCALE_ILZERO  -leading zero (1=yes)
}

//==============================================================================================
initialization

end.

