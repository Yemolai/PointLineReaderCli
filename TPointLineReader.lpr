program PointLineReader;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };

type

  { TPointLineReader }

  TPointLineReader = class(TCustomApplication)
  protected
    procedure DoRun; override;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure WriteHelp; virtual;
  end;

{ TPointLineReader }

procedure TPointLineReader.DoRun;
var
  ErrorMsg: String;
begin
  // quick check parameters
  ErrorMsg:=CheckOptions('h', 'help');
  if ErrorMsg<>'' then begin
    ShowException(Exception.Create(ErrorMsg));
    Terminate;
    Exit;
  end;

  // parse parameters
  if HasOption('h', 'help') then begin
    WriteHelp;
    Terminate;
    Exit;
  end;

  { add your program here }
  writeln('Testando, 1, 2...');
  // stop program loop
  Terminate;
end;

constructor TPointLineReader.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  StopOnException:=True;
end;

destructor TPointLineReader.Destroy;
begin
  inherited Destroy;
end;

procedure TPointLineReader.WriteHelp;
begin
  { add your help code here }
  writeln('Usage: ', ExeName, ' -h');
end;

var
  Application: TPointLineReader;
begin
  Application:=TPointLineReader.Create(nil);
  Application.Title:='PointLine Reader';
  Application.Run;
  Application.Free;
end.

