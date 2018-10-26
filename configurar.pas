unit Configurar;

{$mode objfpc}{$H+}

interface
uses Classes, SysUtils, dll1510;

  procedure DLL(modelo: integer; var controle: TControle; address: string = '');

implementation
  { Configura os dados da variável controle da DLL }
  procedure DLL(modelo: integer; var controle: TControle; address: string = '');
  begin
    // Inicialização do objeto de controle da comunicação da DLL
    controle.start := true; // indica início da comunicação

    controle.modelo := 2; {
    1 – POINTLine 1510 Card;
    2 – POINTLine 1510 BIOProx;
    3 – POINTLine 1510 Duo Card;
    4 – POINTLine 1510 Duo Card Bio.}

    controle.porta := 1001; // porta padrão
    controle.s_tipo := 2; // na documentação: 2 - para indicar comunicação TCP
    controle.baudrate := 9600; // taxa padrão

    if address <> '' then controle.endereco := address; // IP alvo
  end;

end.

