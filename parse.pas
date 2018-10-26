unit Parse;

{$mode objfpc}{$H+}

interface
  uses
    Classes, SysUtils, dll1510;
  { parse de registro de marcação }
  function marcacao(m: TMarcacao; offset: integer): string;
  { validação de endereço IP }
  function validIPAddress(IP4: string): Boolean;

implementation

  { Formata os dados recebidos da DLL }
  function marcacao(
    m: TMarcacao;
    offset: integer
  ) : string;
  var pk, idx, datetime: string;
  begin
    { dados de controle de finalização tem .nsr <= 0 }
    if (m.nsr <= 0) then begin
       marcacao := '';
       Exit();
    end;
    { índice no escopo dos dados recebidos }
    if offset < 1 then
      FmtStr(idx, '%.2d', [m.cont])
    else
      FmtStr(idx, '%.2d', [m.cont - offset + 1]);

    { o NSR é um tipo de chave primária única }
    FmtStr(pk, '%.9d', [m.nsr]); // por padrão o NSR tem 9 dígitos

    { datetime ISO8601 YYYY-MM-DDThh:mmTZD (ex 1997-07-16T19:20+01:00) fuso -3 }
    FmtStr(datetime, '%.4d-%.2d-%.2dT%.2d:%.2d:00-03:00',
                     [m.ano, m.mes, m.dia, m.hora, m.minuto ]);

    marcacao := idx + ',' + pk + ',' + datetime + ',' + m.pis; // return
  end;

  function validIPAddress(IP4: string): Boolean; // Coding by Dave Sonsalla
  var
    Octet : String;
    Dots, i : Integer;
  begin
    IP4 := IP4 + '.'; //ponto extra. pra ativar a checagem de octeto
    Dots := 0;
    Octet := '0';
    validIPAddress := False;
    for i := 1 to length(IP4) do begin
      if IP4[i] in ['0'..'9','.'] then begin
        if IP4[i] = '.' then begin
          inc(Dots);
          if (length(Octet) = 1) or (StrToInt(Octet) > 255) then Exit;
          Octet := '0'; // Zera pra verificar o próximo octeto
        end // Fim de IP4[i] é um ponto
        else // Caso IP4[i] não seja um ponto concatena no octeto
        Octet += IP4[i];
      end
      else Exit; // IP4[i] não é um caractere válido
    end;
    { The only way that Dots will equal 4 is if we passed all the tests }
    validIPAddress := (Dots = 4)
  end;

end.

