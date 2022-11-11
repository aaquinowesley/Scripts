forfiles /P c:\temp\ /c "cmd /c rename @path @fname_backup.@ext"

C:\Users\fpjr>forfiles /?

FORFILES [/P pathname] [/M searchmask] [/S]
         [/C command] [/D [+ | -] {dd/MM/yyyy | dd}]

Descrição:
    Seleciona um arquivo (ou conjunto de arquivos) e executa um
    comando nesse arquivo. Isso é útil para trabalhos em lotes.

Lista de parâmetros:
    /P    pathname      Indica o caminho para se iniciar a pesquisa.
                        A pasta padrão é o diretório de trabalho
                        atual (.).

    /M    searchmask    Pesquisa arquivos de acordo com uma máscara de pesquis

                        A máscara de pesquisa padrão é '*' .

    /S                  Instrui forfiles a incluir
                        subpastas. Semelhante a "DIR /S".

    /C    comando       Indica o comando a ser executado para cada arquivo.
                        Cadeias de caracteres de comando devem vir entre
                        aspas duplas.

                        O comando padrão é "cmd /c echo @file".

                        As seguintes variáveis podem ser usadas na
                        cadeia de caracteres de comandos:
                        @file    - retorna o nome do arquivo.
                        @fname   - retorna o nome de arquivo sem
                                   a extensão.
                        @ext     - retorna apenas a extensão do
                                   arquivo.
                        @path    - retorna o caminho completo do arquivo.
                        @relpath - retorna o caminho relativo do
                                   arquivo.
                        @isdir   - retorna "TRUE" se um tipo de arquivo for
                                   um diretório e "FALSE" para arquivos.
                        @fsize   - retorna o tamanho do arquivo em
                                   bytes.
                        @fdate   - retorna a data da última modificação do
                                   arquivo.
                        @ftime   - retorna a hora da última modificação do
                                   arquivo.

                        Para incluir caracteres especiais na linha
                        de comando , use o código hexadecimal do caractere
                        no formato 0xHH (por ex., 0x09 para tabulação).
                        Comandos CMD.exe internos devem ser precedidos de
                        "cmd /c".

    /D    data          Seleciona arquivos com uma data de última modificação
                        posterior ou igual a (+) ou anterior ou igual
                        (-), à data especificada usando o
                        formato "dd/MM/yyyy"; ou seleciona arquivos com uma
                        data de última modificação posterior ou igual (+)
                        à data atual mais "dd" dias ou anterior ou
                        igual (-) à data atual menos "dd" dias. Um
                        número de dias "dd" válido pode ser qualquer número
                        no intervalo de 0 - 32768.
                        "+" é o sinal padrão se não for especificado.

    /?                  Exibe esta mensagem de ajuda.

Exemplos:
    FORFILES /?
    FORFILES
    FORFILES /P C:\WINDOWS /S /M DNS*.*
    FORFILES /S /M *.txt /C "cmd /c type @file | more"
    FORFILES /P C:\ /S /M *.bat
    FORFILES /D -30 /M *.exe
             /C "cmd /c echo @path 0x09 was changed 30 days ago"
    FORFILES /D 01/01/2001
             /C "cmd /c echo @fname is new since Jan 1st 2001"
    FORFILES /D +24/7/2013 /C "cmd /c echo @fname is new today"
    FORFILES /M *.exe /D +1
    FORFILES /S /M *.doc /C "cmd /c echo @fsize"
    FORFILES /M *.txt /C "cmd /c if @isdir==FALSE notepad.exe @file"