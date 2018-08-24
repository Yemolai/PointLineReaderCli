unit Erro;

{$mode objfpc}{$H+}{$codepage utf8}

interface

uses
  Classes, SysUtils;
  const
    PARAM_REQUER_M = 1;
    PARAM_INVALIDO_M = 2;
    PARAM_REQUER_I = 3;
    PARAM_INVALIDO_I = 4;
    PARAM_INVALIDO_U = 5;
    PARAM_INVALIDOS = 6;

  function DLL(
    codigo: integer;
    silent: Boolean = False
  ) : UTF8String;
  function code(
    codigo: integer;
    silent: Boolean = False
  ) : UTF8String;

implementation

  function DLL(codigo: integer; silent: Boolean = False) : UTF8String;
  var
    msg: UTF8String;
  begin
    result := '';
    if silent then Exit();
    case codigo of
         -1: msg := 'Não foi possível estabelecer comunicação com o relógio.';
         0: Exit();
         1: msg := 'BCC recebido não confere com BCC calculado.';
         2: msg := 'Hora desejada (enviada pelo PC) não constitui uma hora válida.';
         3: msg := 'Parâmetro e/ou Tamanho e/ou Flag/Error não suportados.';
         4: msg := 'O Comando enviado não é suportado ou é desconhecido.';
         5: msg := 'Erro não especificado.';
         8: msg := 'Não foi encontrado um funcionário com o PIS solicitado.';
         10: msg:= 'Identificador (cpf/cnpj/pis) inconsistente.';
         11: msg:= 'Identificador (cpf/cnpj/pis) recusado.';
         12: msg:= 'Código recusado.';
         13: msg:= 'Espaço insuficiente.';
         96: msg:= 'O Frame recebido contém erro.';
    end;
    if msg <> '' then result := msg else result := 'Desconhecido';
  end;

  function code(codigo: integer; silent: Boolean = False) : UTF8String;
  var
    msg: UTF8String;
  begin
    result := '';
    if silent then Exit();
    case codigo of
         PARAM_REQUER_M: msg   :=
         'Falta parametro modelo -m ou --modelo=';
         PARAM_INVALIDO_M: msg :=
         'Modelo invalido';
         PARAM_REQUER_I: msg   :=
         'Falta parametro IP -i ou --ip=';
         PARAM_INVALIDO_I: msg :=
         'IP invalido';
         PARAM_INVALIDO_U: msg :=
         'Parametro "ultimo" invalido';
         PARAM_INVALIDOS: msg  :=
         'Parametros incorretos detectados, leia a ajuda usando -h ou --help."';
    end;
    result := msg + '\r\n';
  end;

end.

