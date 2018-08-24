unit Ajuda;

{$mode objfpc}{$H+}

interface
  uses Classes, SysUtils;
  procedure escrever(ExeFileName: string = 'PointLineReader.exe');

implementation
  { Método para imprimir informações de ajuda sobre uso do programa }
  procedure escrever(ExeFileName: string = 'PointLineReader.exe');
  begin
    { help code execution }
    writeln;
    writeln('Software para recuperar dados AFDT de relogios de ponto.');
    writeln;
    writeln('Uso: ', ExeFileName, ' -i <IP>|--ip=<IP> [-u <NSR>|--ultimo=<NSR>]');
    writeln;
    writeln('Exemplo:');
    writeln('  ', ExeFileName, ' -i 192.168.0.12 -u 50');
    writeln('  ', ExeFileName, ' --ip=192.168.0.12 --ultimo=50');
    writeln('Argumentos:');
    writeln('  -h       | --help         -  Escreve este documento de ajuda');
    writeln('  -m <N>   | --modelo=<N>   -  Define modelo como N (veja lista).');
    writeln('  -i <IP>  | --ip=<IP>      -  Endereco IP do relogio de ponto');
    writeln('  -u <NSR> | --ultimo=<NSR> -  Ultimo indice NSR recebido');
    writeln('  -v       | --verbose      -  Bandeira para ser descritivo');
    writeln('  -s       | --silent       -  Falhar silenciosamente');
    writeln;
    writeln('Modelos de relógio de ponto disponíveis:');
    writeln('  1 – POINTLine 1510 Card');
    writeln('  2 – POINTLine 1510 BIOProx');
    writeln('  3 – POINTLine 1510 Duo Card');
    writeln('  4 – POINTLine 1510 Duo Card Bio');
    writeln;
    writeln('Este programa necessita das DLLs:');
    writeln('  authotelcom.dll - comunicacao com relogios de ponto da RW Tech');
    writeln('  SFM_SDK.dll - API de comunicacao com modulos SFM da Suprema Inc');
    writeln;
    writeln('Este programa em arquitetura 32 bits roda apenas em Windows.');
  end;

end.

