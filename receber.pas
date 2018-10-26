unit Receber;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, dll1510, Erro, parse;
  { Métodos: }
  procedure marcacoes(controle: TControle; offset: integer = 0; silent: Boolean = False);

implementation

  { Este método recebe a leitura de marcações do ponto usando a DLL }
  procedure marcacoes(
    controle: TControle; // endereço IP alvo da comunicação
    offset: integer = 0; // na documentação: essa variável é o offset da query
    silent: Boolean = False
  );
  var
    n: integer;
    lista: array [0..9] of Tmarcacao;
    marcacao: string;
  begin
    for n := 0 to 9 do begin
      lista[n].nsr := 0; // zera todos os índices
    end;
    while recebeMarcacoesTCP(lista, controle, offset) do begin
      // garante que não reinicie a comunicação
      if controle.start then controle.start := false;
      if controle.erro <> 0 then writeln('Erro:', controle.erro);

      // redefine todas as posições do array
      for n := 0 to 8 do begin
        marcacao := parse.marcacao(lista[n], offset);
        if marcacao <> '' then writeln(marcacao);
      end;

      // zera todos os índices
      for n := 0 to 9 do begin
        lista[n].nsr := 0;
      end;

      // while recebeMarcacoesTCP... end
    end;
    writeln(); // escreve uma quebra de linha
    // procedure TPointLineReader end
  end;

end.

