program PointLineReader;

{$mode objfpc}{$H+}

{* imports goes below *}
uses
  Classes, SysUtils, CustApp, dll1510, Configurar, Receber, Parse, Erro, Ajuda;

const
  DEFAULT_ARGS = 'vshi:m:u:';
  DEFAULT_ARGS_ARRAY: array [1..6] of string = (
  'verbose', 'silent', 'help', 'ip:', 'modelo:', 'ultimo:'
  );

type
  { TPointLineReader }
  TPointLineReader = class(TCustomApplication)

  protected // dados protegidos:
    procedure DoRun; override; // método principal

  public // dados publicos:
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure WriteHelp; virtual;
  end;

 { TPointLineReader }
 procedure TPointLineReader.WriteHelp;
 begin
   Ajuda.escrever(ExtractFileName(ExeName));
 end;

 { Este procedure é a execução principal }
  procedure TPointLineReader.DoRun;
  var
    MissingArgs, IP, ExeFileName: String;
    modelo, ultimo: integer;
    controle: TControle;
    silent: Boolean;
  begin
    silent := False;
    ExeFileName := ExtractFileName(ExeName);
    // verifica parametros validos
    MissingArgs := CheckOptions(DEFAULT_ARGS, DEFAULT_ARGS_ARRAY);
    if not(MissingArgs = '') then begin
      MissingArgs := '# ' + IntToStr(PARAM_INVALIDOS) + ' ' + MissingArgs;
      MissingArgs += ' - ' + Erro.code(PARAM_INVALIDOS);
      ShowException(Exception.Create(MissingArgs));
      Terminate(); { and } Exit();
    end;

    // Escreve texto de ajuda e sai
    if HasOption('h', 'help') then begin
      WriteHelp; { and } Terminate(); { and } Exit();
    end;

    // verifica antes de tudo de precisa ficar calado
    if (HasOption('s', 'silent')) then silent := True;

    // verifica se tem IP
    if not(HasOption('i', 'ip')) then begin
      if not(silent) then writeln(Erro.code(PARAM_REQUER_I));
      WriteHelp(); { and } Terminate(); { and } Exit();
    end
    else begin
        IP := GetOptionValue('i', 'ip');
        if not(Parse.validIPAddress(IP)) then begin
          if not(silent) then write(Erro.code(PARAM_INVALIDO_I));
          Terminate(); { and } Exit();
        end;
    end;

    // verifica se tem modelo
    if not(HasOption('m', 'modelo')) then begin
      if not(silent) then write(Erro.code(PARAM_REQUER_M));
      Terminate(); { and } Exit();
    end
    else begin
      modelo := StrToIntDef(GetOptionValue('m', 'modelo'), 0);
      if (modelo < 1.00) or (modelo > 4.00) then begin
        if not(silent) then write(Erro.code(PARAM_INVALIDO_M));
        Terminate(); { and } Exit();
      end;
    end;

    controle.endereco := IP;
    configurar.DLL(modelo, controle);
    ultimo := 0;
    if HasOption('u', 'ultimo') then begin
      ultimo := StrToIntDef(GetOptionValue('u', 'ultimo'), 0);
    end;
    Receber.marcacoes(controle, ultimo);
    fecharComunicacao;
    Terminate;
  end;

constructor TPointLineReader.Create(TheOwner: TComponent);
begin inherited Create(TheOwner); StopOnException := True; end;

destructor TPointLineReader.Destroy;
begin inherited Destroy; end;

var
  Application: TPointLineReader;
begin
  Application := TPointLineReader.Create(nil);
  Application.Title := 'PointLine Reader';
  Application.Run();
  Application.Free();
end.

