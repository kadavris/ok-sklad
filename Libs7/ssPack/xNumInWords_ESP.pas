unit xnuminwords_esp;

interface
function numinwords_esp(numero : int64) : string;

implementation

const
  un = 'un';
  uno = 'uno'; dos = 'dos'; tres = 'tres'; cuatro = 'cuatro'; cinco = 'cinco';
  seis = 'seis'; siete = 'siete'; ocho = 'ocho'; nueve = 'nueve';
  diez = 'diez'; once = 'once'; doce = 'doce'; trece = 'trece';
  catorce = 'catorce'; quince = 'quince';

  {lista de palabras compuestas}
  dieci = 'dieci';  veint = 'veint';  treinta = 'treinta';
  cuarenta = 'cuarenta'; cincuenta = 'cincuenta'; sesenta = 'sesenta';
  setenta = 'setenta'; ochenta = 'ochenta'; noventa = 'noventa';
  tos = 'tos';
  cien = 'cien'; cientos = 'cientos';
  quinientos = 'quinientos'; sete = 'sete'; nove = 'nove';
  mil = 'mil';
  millon = 'millon';
  millones = 'millones';

  rs_lang = 'lang';

var
  sonmiles : boolean; {variable que permite saber si se habla de miles en una cantidad}

//==============================================================================================
function espacio(numero: int64) : char; {delvuelve un espacio si es mayor a cero}
begin
  espacio := #0;
  if numero > 0 then espacio := ' ';
end;

//==============================================================================================
function y(numero: int64) : string; //funcion que devuelve una y si es mayor a cero el n_mero
begin
  y := '';
  if numero > 0 then y := ' y ';
end;

//==============================================================================================
function numinwords_esp(numero: int64) : string;
begin
  result := '';

  case numero of
    0 : exit;
    1..15 :
    case numero of
      1 : if sonmiles then result := un else result := uno;
      2 : result := dos;
      3 : result := tres;
      4 : result := cuatro;
      5 : result := cinco;
      6 : result := seis;
      7 : result := siete;
      8 : result := ocho;
      9 : result := nueve;
     10 : result := diez;
     11 : result := once;
     12 : result := doce;
     13 : result := trece;
     14 : result := catorce;
     15 : result := quince;
    end; // 1..15
    16..19 : result := dieci + numinwords_esp(numero mod 10);
    20     : result := veint + 'e';
    21..29 : result := veint + 'i' + numinwords_esp(numero mod 10);
    30..39 : result := treinta + y(numero mod 10) + numinwords_esp(numero mod 10);
    40..49 : result := cuarenta + y(numero mod 10) + numinwords_esp(numero mod 10);
    50..59 : result := cincuenta + y(numero mod 10) + numinwords_esp(numero mod 10);
    60..69 : result := sesenta + y(numero mod 10) + numinwords_esp(numero mod 10);
    70..79 : result := setenta + y(numero mod 10) + numinwords_esp(numero mod 10);
    80..89 : result := ochenta + y(numero mod 10) + numinwords_esp(numero mod 10);
    90..99 : result := noventa + y(numero mod 10) + numinwords_esp(numero mod 10);
    100    : result := cien;
    101..199   : result := cien + 'to ' + numinwords_esp(numero mod 100);
    1000..1999 : result := mil + espacio(numero mod 1000) + numinwords_esp(numero mod 1000);

  else // case numero
    if (numero >= 200) and (numero <= 999) then
      case numero div 100 of
        2 : result := dos + cientos + espacio(numero mod 100) + numinwords_esp(numero mod 100);
        3 : result := tres + cientos + espacio(numero mod 100) + numinwords_esp(numero mod 100);
        4 : result := cuatro + cientos + espacio(numero mod 100) + numinwords_esp(numero mod 100);
        5 : result := quinientos + espacio(numero mod 100) + numinwords_esp(numero mod 100);
        6 : result := seis + cientos + espacio(numero mod 100) + numinwords_esp(numero mod 100);
        7 : result := sete + cientos + espacio(numero mod 100) + numinwords_esp(numero mod 100);
        8 : result := ocho + cientos + espacio(numero mod 100) + numinwords_esp(numero mod 100);
        9 : result := nove + cientos + espacio(numero mod 100) + numinwords_esp(numero mod 100);
      end;

    if (numero > 999) and (numero < 1000000) then begin
      sonmiles := true;
      result := numinwords_esp(numero div 1000) + espacio(numero mod 1000) + mil +
                 espacio(numero mod 1000) + numinwords_esp(numero mod 1000);
    end;

    if (numero >= 1000000) and (numero < 2000000) then
      result := un + ' ' + millon + espacio(numero mod 1000) + numinwords_esp(numero mod 1000);

    if (numero >= 2000000) then
      result := numinwords_esp(numero div 1000000) + espacio(numero mod 1000) + millones +
                 espacio(numero mod 1000000)+ numinwords_esp(numero mod 1000000);

  end; //case numero
  sonmiles := false;
end;

end.

