Pacote desenvolvido para tratar e organizar a Base de dados do Cadastro
Nacional da Pessoa Jurídica (CNPJ)
================

<!-- README.md is generated from README.Rmd. Please edit that file -->

# O Projeto

O pacote `qsacnpj` é uma das ferramentas utilizadas no projeto de
“Transparência das Contas Públicas”, desenvolvido e executado pelo
Observatório Social do Brasil - Município de Santo Antônio de Jesus -
Estado da Bahia.

Atualmente, o projeto é composto das seguintes ferramentas:

Pacotes desenvolvidos em Linguagem R para realizar Web Scraping e
tratamento de dados:

-   [`tcmbapessoal`](https://github.com/georgevbsantiago/tcmbapessoal)
-   [`tcmbadespesas`](https://github.com/georgevbsantiago/tcmbadespesas)
-   [`qsacnpj`](https://github.com/georgevbsantiago/qsacnpj)

Paineis desenvolvidos em Power BI para produzir diversas visualização
dos dados:

-   [`Painel de Monitoramento das Despesas dos Municípios do Estado da Bahia`](http://bit.ly/2GkegzY)
-   [`Painel de Monitoramento da Folha de Pessoal dos Municípios do Estado da Bahia`](http://bit.ly/2USh8fH)

## Sobre a proposta e o objetivo do pacote

O objetivo do pacote é tornar os dados do Cadastro Nacional da Pessoa
Jurídica (CNPJ) mais acessível, num padrão legível por máquina, para que
a Sociedade possa utilizá-los em diversas iniciativas, atividades,
projetos etc. Isso se faz necessário porque a Receita Federal publicou a
base num formato do tipo [fixed width - arquivo de largura
fixa](https://readr.tidyverse.org/reference/read_fwf.html), o que requer
o prévio tratamento dos dados (com elevado grau de dificuldade técnica e
esfoço computacional adicional) antes do seu consumo imediato em
sofwares de análise de dados.

Por congregar diversas informações sobre as Pessoas Jurídicas
constituídas no Brasil, a base de dados do CNPJ é uma das fontes
governamentais de informação pública mais relevantes do país.

Ao ter acesso aos dados tratados, o Observatório Social do Brasil -
Município de Santo Antônio de Jesus poderá utilizá-los para aprimor dois
outros projetos na área de “Transparência das Contas Públicas”:

-   [Painel de Monitoramento da Folha de Pessoal dos Municípios do
    Estado da Bahia](https://goo.gl/4zHpZp)

-   [Painel de Monitoramento das Despesas dos Municípios do Estado da
    Bahia](https://goo.gl/HpMJZo)

Os dois painéis têm como objetivo tornar os dados do Tribunais de Contas
dos Municípios do Estado da Bahia mais acessíveis e possibilitar outras
visualizações dos dados para fornecer informações de alto interesse
social.

# Comunidade e Colaboração

O Observatório Social do Brasil, aqui representado pelo Observatório
Social do Município de Santo Antônio de Jesus - Ba, gostaria de
agradecer o apoio da Comunidade [‘Dados Abertos .BR’ no
Telegram](https://t.me/dadosabertos), pela incessante busca de tornar os
dados governamentais públicos e de alto interesse social abertos à
Sociedade. A resiliência dos membros que provocaram à Receita Federal
sobre a obrigação de abertura dos dados, conforme determina a
Constituição Federal de 1988 c/c a Lei de Acesso à Informação e c/c o
Decreto Federal n.° 8.777/2016, foi um fator fundamental para essa
conquista.

Gostaríamos de agradecer também à comunidade da Linguagem de Programação
R que foi utilizada para o desenvolvimento do presente pacote, em
especial à comunidade [TidyVerse](https://www.tidyverse.org/), ao
[Curso-R](https://www.curso-r.com/) pela colaboração ativa e material
disponibilizado, à comunidade [R Brasil no
Telegram](https://t.me/rbrasiloficial), e todos aqueles de
disponibilizam ebook sobre a linguagem R [link](https://bookdown.org/),
posts e desenvolvem pacotes e soluções de infraestrutura para a
linguagem. Sem o esforço, colaboração, cooperativismo e abnegação de
todos, esse trabalho não seria possível.

Ademais, quaisquer sugestões, reclamações ou críticas podem ser
realizadas no área `issues` do GitHub.

# Preparando e Executando o pacote `qsacnpj`

## Preparativos

1 - Baixe os arquivos (.zip) da base de dados do CNPJ no [site da
Receita
Federal](https://receita.economia.gov.br/orientacao/tributaria/cadastros/cadastro-nacional-de-pessoas-juridicas-cnpj/dados-publicos-cnpj).

2 - Salve o arquivo ‘.zip’ no diretório que será utilizado para o
processamento dos dados.

3 - Descompacte os arquivos no diretório. Talvez os arquivos tenhom
nomes semelhantes a ‘K3241.K03200DV.D91111.L00001’. *OBS: Os arquivos
descompactados tem mais de 99Gb. Verifique se há espaço suficiente no
seu HD*

4 - IMPORTANTE: Crie uma pasta específica para armazenar somente os
arquivos.

5 - Instale e execute o pacote. Abaixo, seguem algumas sugestões:

## Executando o pacote

``` r
# Para garantir a instalação e execução do pacote `qsacnpj` sem maiores dificuldades,
# é só seguir os 7 passos a seguir:

# 1 - Instale o interpretador da linguagem R, disponível no
# site do CRAN: https://cran.r-project.org/.
# OBS1: A título de exemplo, utilizamos a versão 4.0.3 do R
# para tratar os dados publicados em novembro de 2020;
# OBS2: Verifique a distribuição apropriada para o seu
# sistema operacional (Windows, Linux, macOS)


# 2 - Instale o RStudio Desktop, ambiente de desenvolvimento integrado (IDE)
# para a linguagem R, disponível no site https://rstudio.com/products/rstudio/download/; 

# 3 - No console do RStudio Desktop, instale o pacote `remotes`
# para poder baixar o pacote `qsacnpj` no repositório do GitHub;

install.packages("remotes")

remotes::install_github("georgevbsantiago/qsacnpj")

# 4 - Em seguida, aparecerá o seguinte aviso e opções de escolhas (abaixo).
# Nessa etapa, em geral, a opção "2" instalará os pacotes que o respectivo desenvolvedor 
# considera como estável e adequado para o ambiente de produção.
# Já a opção "1" instalará os pacotes em desenvolvimento armazenados no repositório
# do GitHub. Por serem pacotes em desenvolvimento, podem ter (ou não) algum tipo de instabilidade
# ou inconsistência, mas, em contrapartida, tendem a ter um desempenho melhor durante a execução.

    # Downloading GitHub repo georgevbsantiago/qsacnpj@master
    # These packages have more recent versions available.
    # It is recommended to update all of them.
    # Which would you like to update?
    # 1: All                                           
    # 2: CRAN packages only

# 5 - Após selecionar uma das opções acima, o pacote será instalado.
# Então, no console do RStudio, carregamos o pacote na memória.

library(qsacnpj)

# 6 - Em seguida, criamos e selecionamos a pasta de trabalho (Work Directory). 
# Neste diretório, devem ser armazenados apenas os arquivos
# que foram baixados e descompactados do site da Receita Federal.
# A título de exemplo, indicamos o diretório "D:/qsa_cnpj". 
# Caso prefira, pode utilizar outro disco, a exemplo do disco "D:", em vez de "C:"

dir.create(file.path("C:", "qsa_cnpj"))

setwd(file.path("C:", "qsa_cnpj"))

# 7 - Por fim, executamos o pacote. Para tanto, elaboramos 4 sugestões de execução do pacote abaixo.
# (OBS: No argumento "path_arquivos_txt", indique o diretório
# no qual estão armazenados apenas os arquivos que foram
# baixados e descompactados do site da Receita Federal. 
# IMPORTANTE: O diretório deve conter APENAS os arquivos
# descompactados da Receita Federal que serão tratados!!!
# Já no início da execução, será criada um diretório
# `bd_cnpj_tratados` com os arquivos tratados.
# O tempo total da execução é de 4 a 5 horas, para tratamento completo da base de dados;

# Sugestão 1: Tratar toda a base do CNPJ, 100.000 linha a cada interação,
# armazenando os dados no SQLite
qsacnpj::gerar_bd_cnpj(path_arquivos_txt = "C:/qsa_cnpj",
                       localizar_cnpj = "NAO",
                       n_lines = 100000,
                       armazenar = "sqlite")


# Sugestão 2: Tratar toda a base do CNPJ, 100.000 linha a cada interação,
# armazenando os dados no CSV (OBS: O delimitador do CSV é o simbolo: "#').
qsacnpj::gerar_bd_cnpj(path_arquivos_txt = "C:/qsa_cnpj",
                       localizar_cnpj = "NAO",
                       n_lines = 100000,
                       armazenar = "csv")


# Sugestão 3: Localziar um conjunto de CNPJ, interando a base a cada 100.000 linha,
# armazenando os dados localizados no SQLite
# (OBS1: O delimitador do CSV é o simbolo: "#');
# (OBS2: Exemplo com número de CNPJ, entre aspas (""), do Banco do Brasil, Banco do Nordeste,
# Banco da Amazônia e Caixa Econômica)
qsacnpj::gerar_bd_cnpj(path_arquivos_txt = "C:/qsa_cnpj",
                       localizar_cnpj = c("00000000000191", "07237373000120",
                                          "00360305000104", "04902979000144"),
                       n_lines = 100000,
                       armazenar = "sqlite")


# Sugestão 4: Localziar um conjunto de CNPJ, interando a base a cada 100.000 linha,
# armazenando os dados localizados no CSV
# (OBS1: O delimitador do CSV é o simbolo: "#');
# (OBS2: Exemplo com número de CNPJ, entre aspas (""), do Banco do Brasil, Banco do Nordeste,
# Banco da Amazônia e Caixa Econômica)
qsacnpj::gerar_bd_cnpj(path_arquivos_txt = "C:/qsa_cnpj",
                       localizar_cnpj = c("00000000000191", "07237373000120",
                                          "00360305000104", "04902979000144"),
                       n_lines = 100000,
                       armazenar = "csv")
```

Resultado esperado: No teste realizado sem aplicar o filtro
‘localizar\_cnpj’, o código executou com sucesso o tratamento e
organização de todos os dados no tempo de 4 horas, usando um notebook
com processador i7 5ª Geração, 16Gb DDR3 e disco HDD.

Ao final do processamento, o usuário visualizará, no diretório
escolhido, o arquivo SQLite com 03 tabelas (`cnpj_dados_cadastrais_pj`,
`cnpj_dados_socios_pj` e `cnpj_dados_cnae_secundario_pj`), ou, caso opte
pelo CSV, 03 arquivos CSV `cnpj_dados_cadastrais_pj.csv`,
`cnpj_dados_socios_pj.csv` e `cnpj_dados_cnae_secundario_pj.csv`, dentre
outras tabelas que forem adicionadas com as atualizações do pacote.

Informações técnicas complementares podem ser obtidas na documentação do
pacote ao digitar `?qsacnpj`

## Base de dados Complementares

Adicionamos, no pacote, um conjunto de [Tabelas complementares
disponíveis no site da Receita
Federal](https://receita.economia.gov.br/orientacao/tributaria/cadastros/cadastro-nacional-de-pessoas-juridicas-cnpj/dados-publicos-cnpj)
para enriquecer e detalhar a Bases de Dados do CNPJ.

-   [Tabela com CNPJ dos Entes
    Federativos](https://receita.economia.gov.br/orientacao/tributaria/cadastros/cadastro-nacional-de-pessoas-juridicas-cnpj/dados-publicos-cnpj/lista-dos-cnpj-entes-federativos)
    foi incluída dentro do pacote, podendo ser acessada pela variável
    `qsacnpj::tab_cnpj_entes_publicos_br`.

-   [Tabela de Qualificação do Responsável no Quadro Societário da
    Pessoa
    Jurídica](http://receita.economia.gov.br/orientacao/tributaria/cadastros/cadastro-nacional-de-pessoas-juridicas-cnpj/DominiosQualificaodoresponsvel.csv)
    foi incluída dentro do pacote, podendo ser acessada pela variável
    `qsacnpj::tab_qualificacao_responsavel_socio`.

-   [Tabela de Motivo Situação Cadastral da Pessoa
    Jurídica](http://receita.economia.gov.br/orientacao/tributaria/cadastros/cadastro-nacional-de-pessoas-juridicas-cnpj/DominiosMotivoSituaoCadastral.csv)
    foi incluída dentro do pacote, podendo ser acessada pela variável
    `qsacnpj::tab_situacao_cadastral`.

Adicionamos, no pacote, um conjunto de [Tabelas complementares
disponíveis no site do
IBGE](https://concla.ibge.gov.br/classificacoes.html) para enriquecer e
detalhar a Bases de Dados do CNPJ

-   [Tabela de Classificação da Natureza Jurídica
    2018](https://concla.ibge.gov.br/estrutura/natjur-estrutura/natureza-juridica-2018)
    foi incluída dentro do pacote, podendo ser acessada pela variável
    `qsacnpj::tab_natureza_juridica`.

-   [Tabela de Classificação Nacional de Atividades Econômicas (CNAE) -
    Subclasses
    2.3](https://concla.ibge.gov.br/classificacoes/por-tema/atividades-economicas)
    foi incluída dentro do pacote, podendo ser acessada pela variável
    `qsacnpj::tab_cnae`.

# Base de Dados do CNPJ tratada

A base de dados do CNPJ já tratada está disponível nos links abaixo, nos
formatos **SQLite** e **CSV**:

Para acessar os dados usando o SQLite, siga os 3 passos seguintes:

1 - Baixe os arquivos ‘.zip’. *OBS: O arquivo no formato ‘.zip’ tem
cerca de 5Gb*;

2 - Descompacte o arquivo. *OBS: Após ser descompactado, o arquivo
ficará com 14Gb. Verifique se há espaço no disco*;

3 - Instale o programa `DB Browser for SQLite` ( [neste
link](https://sqlitebrowser.org/) ). Trata-se de uma programa que
permite visualizar os dados do SQLite e fazer consultas SQL;

4 - Ao abrir o arquivo `dados_qsa_cnpj.db` com o
`DB Browser for SQLite`, o tempo de carregamento do banco de dados no
programa pode demorar de 3 a 7 minutos a depender das configurações do
computador, caso o usuário opte pela opção de “Nevegar pela tabela”. Se
optar por realizar consultas SQL, a base estará pronta para uso
imediato.

------------------------------------------------------------------------

-   Base de dados liberada pela RFB no dia **23/11/2020** e Processada
    com a versão 0.2.2 do pacote:

    [Base de Dados do CNPJ - SQLite](https://bit.ly/3cRruVw)

    [Base de Dados do CNPJ - CSV](https://bit.ly/3jC3KGj) (*OBS:
    Delimitador do CSV: ‘\#’*)

    Informações sobre a Base de Dados:

    -   Número de CNPJ: **46.535.803**

------------------------------------------------------------------------

-   Base de dados liberada pela RFB no dia **05/09/2020** e Processada
    com a versão 0.2.1 do pacote:

    [Base de Dados do CNPJ - SQLite](https://bit.ly/2SGyN7g)

    [Base de Dados do CNPJ - CSV](https://bit.ly/2GTGHHM) (*OBS:
    Delimitador do CSV: ‘\#’*)

    Informações sobre a Base de Dados:

    -   Número de CNPJ: **45.153.764**

------------------------------------------------------------------------

-   Base de dados liberada pela RFB no dia **04/07/2020** e Processada
    com a versão 0.1.9 do pacote:

    [Base de Dados do CNPJ - SQLite](https://bit.ly/3hZOPnh)

    [Base de Dados do CNPJ - CSV](https://bit.ly/2XjlVa3) (*OBS:
    Delimitador do CSV: ‘\#’*)

    Informações sobre a Base de Dados:

    -   Número de CNPJ: **44.467.068**

------------------------------------------------------------------------

-   Base de dados liberada pela RFB no dia **28/04/2020** e Processada
    com a versão 0.1.9 do pacote:

    [Base de Dados do CNPJ - SQLite](https://bit.ly/2LM3N2d)

    [Base de Dados do CNPJ - CSV](https://bit.ly/2LOo1Z5) (*OBS:
    Delimitador do CSV: ‘\#’*)

    Informações sobre a Base de Dados:

    -   Número de CNPJ: **43.887.581**

------------------------------------------------------------------------

-   Base de dados liberada pela RFB no dia **28/02/2020** e Processada
    com a versão 0.1.8 do pacote:

    [Base de Dados do CNPJ - SQLite](http://bit.ly/32H7oq8)

    [Base de Dados do CNPJ - CSV](http://bit.ly/2TavMgB) (*OBS:
    Delimitador do CSV: ‘\#’*)

    Informações sobre a Base de Dados:

    -   Número de CNPJ: **43.101.755**

------------------------------------------------------------------------

-   Base de dados liberada pela RFB no dia **23/11/2019** e Processada
    com a versão 0.1.7 do pacote:

    [Base de Dados do CNPJ - SQLite](http://bit.ly/34DaBag)

    [Base de Dados do CNPJ - CSV](http://bit.ly/2Drclrj) (*OBS:
    Delimitador do CSV: ‘\#’*)

    Informações sobre a Base de Dados:

    -   Número de CNPJ: **42.484.599**

------------------------------------------------------------------------

-   Base de dados liberada pela RFB no dia **07/08/2019** e Processada
    com a versão 0.1.6 do pacote:

    [Base de Dados do CNPJ - SQLite](http://bit.ly/2z9e3Ly)

    [Base de Dados do CNPJ - CSV](http://bit.ly/2TIyVCP) (*OBS:
    Delimitador do CSV: ‘\#’*)

    Informações sobre a Base de Dados:

    -   Número de CNPJ: **41.513.197**

------------------------------------------------------------------------

-   Base de dados liberada pela RFB no dia **15/05/2019** e Processada
    com a versão 0.1.5 do pacote:

    [Base de Dados do CNPJ - SQLite](http://bit.ly/2GeAVML)

    [Base de Dados do CNPJ - CSV](http://bit.ly/2XfNwGL) (*OBS:
    Delimitador do CSV: ‘\#’*)

    Informações sobre a Base de Dados:

    -   Número de CNPJ: **40.754.938**

## Modelo Lógico do Banco de Dados

Para melhor visualização das tabelas do Banco de Dados, disponibilizamos
esse [imagem (link) do Modelo
Lógico](https://raw.githubusercontent.com/georgevbsantiago/qsacnpj/master/img/esquema_cnpj.png)
. *(OBS: O modelo lógico foi desenhado sem rigor técnico. A sua
disponibilização é só para efeito de visualização das tabelas que
compõem a Base de Dados)*

[<img src="https://raw.githubusercontent.com/georgevbsantiago/qsacnpj/master/img/esquema_cnpj.png" title="Modelo Lógico" width="200"/>](https://raw.githubusercontent.com/georgevbsantiago/qsacnpj/master/img/esquema_cnpj.png)

# Futuras Implementações, Atualizações e BUGs

### Futuras Implementações ou Melhorias

-   Implementar função para criar tabela contendo o CNPJ dos entes
    públicos;

-   Incluir a base de dados do [“Mapa das Organizações da Sociedade
    Civil”](http://dados.gov.br/dataset/mapaosc), disponibilizado no
    [Portal de Dados Abertos](http://dados.gov.br/dataset/mapaosc)

-   Implementar uma função para verificar se os CNPJ na variável
    ‘localizar\_cnpj’ são válidos;

-   Criar uma função para verificar a adequação da base de dados;

-   Incluir rotina para baixar a Base de dados do CNPJ e as Tabelas
    complementares disponibilizadas pela Receita Federal

-   Criar índice no SQLite para todas as tabelas;

# Atualizações

### qsacnpj - versão: 0.2.2

**1 - BUGs Corrigidos:**

1.1 - Corrige o erro na Tabela da Receita Federal
(tab\_qualificacao\_responsavel\_socio), na qual os números
identificadores de 1 a 9, deveriam constar com 0 na frente. Ex: 01, 02,
03, 04 … (\#20)

### qsacnpj - versão: 0.2.1

**1 - BUGs Corrigidos:**

1.1 - Retirado espaços duplos e quebra de linhas nos valores das Base de
dados Complementares (\#18)

### qsacnpj - versão: 0.1.9

**1 - BUGs Corrigidos:**

1.1 - Aprimorada a regra da Expressão Regular (regex) que faz a
substituição dos caracteres iniciais `000***` por `***` no CPF dos
sócios. A regex anterior, usada junto com a função `gsub`, estava
substitundindo indevidamente números do CNPJ/PJ sócio com `0000001` por
`***1`, afetendo cerca de mil de registro.

**2 - MELHORIAS:**

2.1 - Aprimorada o tratamento das strings usando as funções do pacote
`stringr`.

### qsacnpj - versão: 0.1.8

**1 - MELHORIAS:**

1.1 - Atualizamos a [Tabela de Qualificação do Responsável no Quadro
Societário da Pessoa
Jurídica](http://receita.economia.gov.br/orientacao/tributaria/cadastros/cadastro-nacional-de-pessoas-juridicas-cnpj/tabela-de-qualificacao-do-socio-representante.ods)
de acordo com o arquivo mais recente disponibilizado pela Receita
Federal `qsacnpj::tab_qualificacao_responsavel_socio`.

### qsacnpj - versão: 0.1.7

**1 - MELHORIAS:**

1.1 - Adicionamos, no pacote, uma [Tabela com o código dos Municípios do
SIAFI](http://www.tesourotransparente.gov.br/ckan/dataset/lista-de-municipios-do-siafi),
foi incluída dentro do pacote, podendo ser acessada pela variável
`tab_codigo_municipios_siafi`. Essa tabela é extremamente relevante,
pois será possível, agora, realizar a correspondência entre os códigos
dos municípios contidos na base de dados do CNPJ (que são os códigos
atribuídos pelo SIAFI - OBS: Sistema Integrado de Administração
Financeira do Governo Federal) com o código dos Municípios do IBGE. Ou
seja, essa base de dados disponibilizada pelo Tesouro Nacional é uma
tabela de correspondência entre os códigos dos municípios da base do
CNPJ (os mesmos usados no SIAFI) e os códigos da tabela do IBGE.

**2 - BUGs Corrigidos:**

2.1 - A coluna `tipo_de_registro` não estava sendo incluída na tabela
`cnpj_dados_cnae_secundario_pj`.

### qsacnpj - versão: 0.1.6

**1 - MELHORIAS:**

1.1 - Incluída rotina para tratamento de dados. Substituição do “Ç” por
“C” na coluna `descricao_tipo_logradouro` da tabela
`cnpj_dados_cadastrais_pj`, com o objetivo de evitar problemas de
encoding ao importar os dados para Sistemas de Gerenciamento de Banco de
Dados ou por Ferramentas de Análise de Dados.

1.2 - Reformulado o código para conexão com os SGBDs. Agora, é possível
conectar o script com SQLite, MS SQL Server, Oracle e MySQL. Os
desenvolvedores conseguirão também implementar a conexão com outros
SGBDs.

### qsacnpj - versão: 0.1.5

Foram realizados ajustes no código, visto que a Receita Federal, a
partir do mês de maio de 2019, passou a liberar a base do CNPJ por meio
de 20 arquivos, e não mais num arquivo único.

### qsacnpj - versão: 0.1.4

**1 - BUGs Corrigidos:**

1.1 - Implementado uma rotina de tratamento adequado para construção da
tabela referente aos CNAEs secundários.

**2 - MELHORIAS:**

2.1 - Adicionamos, no pacote, um conjunto de [Tabelas complementares
disponíveis no site do
IBGE](https://concla.ibge.gov.br/classificacoes.html) para enriquecer e
detalhar a Bases de Dados do CNPJ.

-   [Tabela de Classificação da Natureza Jurídica
    2018](https://concla.ibge.gov.br/estrutura/natjur-estrutura/natureza-juridica-2018)
    foi incluída dentro do pacote, podendo ser acessada pela variável
    `qsacnpj::tab_natureza_juridica`.

-   [Tabela de Classificação Nacional de Atividades Econômicas (CNAE) -
    Subclasses
    2.3](https://concla.ibge.gov.br/classificacoes/por-tema/atividades-economicas)
    foi incluída dentro do pacote, podendo ser acessada pela variável
    `qsacnpj::tab_cnae`.

2.2 - Tratamento de dados

-   Os dados das colunas que representam datas foram tratados para o
    padrão internacional (ano-mes-dia). Ex: Antes: 20180505 / Depois:
    2018-05-05 . As datas com valores inválidos (Ex: 00000000), ficaram
    como NULL (vazio) na tabela;

-   Os dados das colunas que representam a capital social foram
    transformadas para o padrão de valores monetários internacional:
    Antes: 00000001272800 / Depois: 12728.00

### qsacnpj - versão: 0.1.3

**1 - BUGs Corrigidos:**

1.1 - Corrigido o problema das linhas NULL. Estava relacionado ao
encoding, devido a letras com “Ç”, a exemplo da palavra “PRAÇA”. Como
tivemos que implementar o argumento
`locale = readr::locale(encoding = "ISO-8859-1")` na função, houve uma
perda substancial no desempenho do processamento, fazendo que com a
criação da base de dados demore mais de 3h.

**2 - MELHORIAS:**

2.1 - Rotina para tratar o número dos CPFs dos sócios retirando os 03
zeros iniciais. Antes: `000***718468**` / Depois: `***718468**`

2.2 - Adicionamos, no pacote, um conjunto de [Tabelas complementares
disponíveis no site da Receita
Federal](https://receita.economia.gov.br/orientacao/tributaria/cadastros/cadastro-nacional-de-pessoas-juridicas-cnpj/dados-publicos-cnpj)
para enriquecer e detalhar a Bases de Dados do CNPJ.

-   [Tabela com CNPJ dos Entes
    Federativos](https://receita.economia.gov.br/orientacao/tributaria/cadastros/cadastro-nacional-de-pessoas-juridicas-cnpj/dados-publicos-cnpj/lista-dos-cnpj-entes-federativos)
    foi incluída dentro do pacote, podendo ser acessada pela variável
    `qsacnpj::tab_cnpj_entes_publicos_br`.

-   [Tabela de Qualificação do Responsável no Quadro Societário da
    Pessoa
    Jurídica](https://receita.economia.gov.br/orientacao/tributaria/cadastros/cadastro-nacional-de-pessoas-juridicas-cnpj/DominiosQualificaodoresponsvel.csv)
    foi incluída dentro do pacote, podendo ser acessada pela variável
    `qsacnpj::tab_qualificacao_responsavel_socio`.

-   [Tabela de Motivo Situação Cadastral da Pessoa
    Jurídica](https://receita.economia.gov.br/orientacao/tributaria/cadastros/cadastro-nacional-de-pessoas-juridicas-cnpj/DominiosMotivoSituaoCadastral.csv)
    foi incluída dentro do pacote, podendo ser acessada pela variável
    `qsacnpj::tab_situacao_cadastral`.

2.3 - Com a implementação das novas tabelas, o código foi reestruturado.
Agora, o tratamento e organização dos dados da base do CNPJ é executado
com a função `qsacnpj::gerar_bd_cnpj`

### qsacnpj - versão: 0.1.2

-   Adicionado rotina para substituir “;” por “\#”, em virtude da base
    de dados usar o “;” no corpo de diversos dados.

### BUGs e Warnings

Caso identifique um BUG, favor abrir uma `issues` no Github.

# Outras alternativas em R ou Python

Por fim, deixo a sugestão de outras alternativas que foram criados com o
mesmo propósito:

-   Script em Python: [socios-brasil -
    Turicas](https://github.com/turicas/socios-brasil)

-   Pacote em R: [rfbCNPJ - Julio
    Trecenti](https://www.curso-r.com/blog/2018-05-13-rfbcnpj/)
