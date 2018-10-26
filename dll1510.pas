unit DLL1510;

interface

uses
  Classes;

type TMarcacao = record
    nsr: LongWord;
    cont: LongWord;
    pis: string[12];
    dia: byte;
    mes: byte;
    ano: word;
    hora: byte;
    minuto: byte;
end;

type TControle = record
    total: Word;
    atual: Word;
    start: boolean;
    erro: Shortint;
    porta: Word;
    s_tipo: byte;
    modelo: byte;
    endereco: string[15];
    backup: ShortString;
    baudrate: integer;
end;

type TDados = record
    adcOUSubst: ShortString;
    pin: ShortString;
    pis: ShortString;
    identificador: ShortString;
    cei: ShortString;
    razaoSocial: ShortString;
    localPrestServ: ShortString;
    tipoId: ShortString;
    nome: ShortString;
    id_bio: ShortString;
    numCartao: ShortString;
    senha: ShortString;
    mestre: ShortString;
    verifica: ShortString;
end;

function recebeMarcacoes(
  var marcacao: array of TMarcacao;
  var controle: Tcontrole;
  evento: integer
): boolean;
stdcall; external 'authotelcom.dll';

function recebeMarcacoesTCP(
  var marcacao: array of TMarcacao;
  var controle: Tcontrole;
  evento: integer
): boolean;
stdcall; external 'authotelcom.dll';

function leTrabalhadorTCP(var dados: TDados; var controle: Tcontrole): boolean;
stdcall; external 'authotelcom.dll';

procedure fecharComunicacao; stdcall; external 'authotelcom.dll';

type
  TDLL1510 = class
  private
  public
  end;

implementation

end.
