unit EspNumLtr;

interface

  function numeral(numero : longint) : string;

implementation
const
  UN = 'UN';
  UNO = UN + 'O'; DOS = 'DOS'; TRES = 'TRES'; CUATRO = 'CUATRO'; CINCO = 'CINCO';
  SEIS = 'SEIS'; SIETE = 'SIETE'; OCHO = 'OCHO'; NUEVE = 'NUEVE';
  DIEZ = 'DIEZ'; ONCE = 'ONCE'; DOCE = 'DOCE'; TRECE = 'TRECE';
  CATORCE = 'CATORCE'; QUINCE = 'QUINCE';

  {Lista de palabras compuestas}
  DIECI = 'DIECI';  VEINT = 'VEINT';  TREINTA = 'TREINTA';
  CUARENTA = 'CUARENTA'; CINCUENTA = 'CINCUENTA'; SESENTA = 'SESENTA';
  SETENTA = 'SETENTA'; OCHENTA = 'OCHENTA'; NOVENTA = 'NOVENTA';
  TOS = 'TOS';
  CIEN = 'CIEN'; CIENTOS = CIEN + TOS;
  QUINIENTOS = 'QUINIEN' + TOS; SETE = 'SETE'; NOVE = 'NOVE';
  MIL = 'MIL';
  MILLON = 'MILLON';
  MILLONES = MILLON + 'ES';

var
  SonMiles : boolean;
  {Variable que permite saber si se habla de miles en una cantidad}

function ESPACIO(numero : longint) : char;
{Delvuelve un espacio si es mayor a cero}
begin
  ESPACIO := #0;
  if numero > 0 then ESPACIO := ' ';
end;

function Y(numero : longint) : string;
{Funcion que devuelve una y si es mayor a cero el n£mero}
begin
  Y := '';
  if numero > 0 then Y := ' Y ';
end;


function numeral(numero : longint) : string;
begin
  {inicicializa variables}
  numeral := '';
  case numero of
    0 : exit;
    1..15 :
    case numero of
      1 : if SonMiles then numeral := UN else numeral := UNO;
      2 : numeral := DOS;
      3 : numeral := TRES;
      4 : numeral := CUATRO;
      5 : numeral := CINCO;
      6 : numeral := SEIS;
      7 : numeral := SIETE;
      8 : numeral := OCHO;
      9 : numeral := NUEVE;
     10 : numeral := DIEZ;
     11 : numeral := ONCE;
     12 : numeral := DOCE;
     13 : numeral := TRECE;
     14 : numeral := CATORCE;
     15 : numeral := QUINCE;
    end;
    16..19 : numeral := DIECI + numeral(numero mod 10);
    20 : numeral := VEINT + 'E';
    21..29 : numeral := VEINT + 'I' + numeral(numero mod 10);
    30..39 : numeral := TREINTA + Y(numero mod 10) + numeral(numero mod 10);
    40..49 : numeral := CUARENTA + Y(numero mod 10) + numeral(numero mod 10);
    50..59 : numeral := CINCUENTA + Y(numero mod 10) + numeral(numero mod 10);
    60..69 : numeral := SESENTA + Y(numero mod 10) + numeral(numero mod 10);
    70..79 : numeral := SETENTA + Y(numero mod 10) + numeral(numero mod 10);
    80..89 : numeral := OCHENTA + Y(numero mod 10) + numeral(numero mod 10);
    90..99 : numeral := NOVENTA + Y(numero mod 10) + numeral(numero mod 10);
    100 : numeral := CIEN;
    101..199 : numeral := CIEN + 'TO ' + numeral(numero mod 100);
    1000..1999 : numeral := MIL + ESPACIO(numero mod 1000) + numeral(numero mod 1000);

  else
    if (numero >= 200) and (numero <= 999) then
      case numero div 100 of
        2 : numeral := DOS + CIENTOS + ESPACIO(numero mod 100) + numeral(numero mod 100);
        3 : numeral := TRES + CIENTOS + ESPACIO(numero mod 100) + numeral(numero mod 100);
        4 : numeral := CUATRO + CIENTOS + ESPACIO(numero mod 100) + numeral(numero mod 100);
        5 : numeral := QUINIENTOS + ESPACIO(numero mod 100) + numeral(numero mod 100);
        6 : numeral := SEIS + CIENTOS + ESPACIO(numero mod 100) + numeral(numero mod 100);
        7 : numeral := SETE + CIENTOS + ESPACIO(numero mod 100) + numeral(numero mod 100);
        8 : numeral := OCHO + CIENTOS + ESPACIO(numero mod 100) + numeral(numero mod 100);
        9 : numeral := NOVE + CIENTOS + ESPACIO(numero mod 100) + numeral(numero mod 100);
      end;
    if (numero > 999) and (numero < 1000000) then begin
      SonMiles := true;
      numeral := numeral(numero div 1000) + ESPACIO(numero mod 1000) + MIL +
                 ESPACIO(numero mod 1000) + numeral(numero mod 1000);
    end;
    if (numero >= 1000000) and (numero < 2000000) then
      numeral := UN + ' ' + MILLON + ESPACIO(numero mod 1000) + numeral(numero mod 1000);
    if (numero >= 2000000) then
      numeral := numeral(numero div 1000000) + ESPACIO(numero mod 1000) + MILLONES +
                 ESPACIO(numero mod 1000000)+ numeral(numero mod 1000000);
  end;
  SonMiles := false;
end;

begin
  SonMiles := false;
end.


