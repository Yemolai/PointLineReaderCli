# PointLineReaderCLI

Software para comunicação e recuperação de dados de marcação de ponto em padrão AFDT de relógio de ponto RwTech.
Esta ferramenta roda apenas em sistema Windows em modo 32 bit, em linha de comando, comunicando-se via TCP com
relógio de ponto em dado endereço IP. Toda informação recebida é escrita no `stdout` e pode ser redirecionada
com pipes ou lida para processamento e uso.

Este programa foi desenvolvido em Object Pascal utilizando a IDE Open Source gratuita Lazarus e depende das
seguintes bibliotecas para funcionar:

 * SFM_SDK.dll (SDK em C de SFM da Suprema Inc - http://sfm.supremainc.com/documents/API_Specification/)
 * authotelcom.dll (interface de uso da SDK de SFM criada em Delphi 5 pela Rw Tech)
 
Note que estas bibliotecas não estão incluídas neste repositório pois são de propriedade intelectual de outras
empresas as quais não tenho afiliação ou autorização para republicação. Se você usa o sistema da Rw Tech você
deve ter estas bibliotecas disponíveis para uso.

Este software é uma ferramenta de uso rápido da comunicação com relógios Rw Tech através do uso da biblioteca
`authtelcom.dll` para integração com outros sistemas.

No momento esta ferramenta apenas suporta a recuperação de registros em AFDT de marcação de ponto dos
trabalhadores, mas tem potencial para mais. Infelizmente a documentação que tenho disponível não foi suficiente
para descrever especificamente os procedimentos corretos para recuperar outras informações do relógio de ponto.

Contribuições são bem-vindas, novas funcionalidades, otimizações e refatoração são desejáveis.

Esta ferramenta é gratuita e de código aberto como diz sua licença.
