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

  - [`tcmbapessoal`](https://github.com/georgevbsantiago/tcmbapessoal)
  - [`tcmbadespesas`](https://github.com/georgevbsantiago/tcmbadespesas)
  - [`qsacnpj`](https://github.com/georgevbsantiago/qsacnpj)

Paineis desenvolvidos em Power BI para produzir diversas visualização
dos dados:

  - [`Painel de Monitoramento das Despesas dos Municípios do Estado da
    Bahia`](https://goo.gl/rQhwsg)
  - [`Painel de Monitoramento da Folha de Pessoal dos Municípios do
    Estado da Bahia`](https://goo.gl/4zHpZp)

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

  - [Painel de Monitoramento da Folha de Pessoal dos Municípios do
    Estado da Bahia](https://goo.gl/4zHpZp)

  - [Painel de Monitoramento das Despesas dos Municípios do Estado da
    Bahia](https://goo.gl/HpMJZo)

Os dois painéis têm como objetivo tornar os dados do Tribunais de Contas
dos Municípios do Estado da Bahia mais acessíveis e possibilitar outras
visualizações dos dados para fornecer informações de alto interesse
social.

# Comunidade e Colaboração

O Observatório Social do Brasil, aqui representado pelo Observatório
Social do Município de Santo Antônio de Jesus - Ba, gostaria de
agradecer ao apoio da Comunidade R para o desenvolvimento do presente
pacote, em especial à comunidade
[TidyVerse](https://www.tidyverse.org/), ao
[Curso-R](https://www.curso-r.com/) pela colaboração ativa e material
disponibilizado, à comunidade R Brasil (no Telegram), e todos aqueles de
disponibilizam ebook sobre a linguagem R [link](https://bookdown.org/),
posts e desenvolvem pacotes e soluções de infraestrutura para a
linguagem R. Sem o esforço, colaboração, cooperativismo e abnegação de
todos, esse trabalho não seria possível.

Ademais, quaisquer sugestões, reclamações ou críticas podem ser
realizadas no área `issues` do GitHub.

# Preparando e Executando o pacote `qsacnpj`

## Preparativos

1 - Baixe o arquivo da base de dados do CNPJ no [site da Receita
Federal](http://receita.economia.gov.br/orientacao/tributaria/cadastros/cadastro-nacional-de-pessoas-juridicas-cnpj/dados-publicos-cnpj)
ou diretamente neste
[link](http://200.152.38.155/CNPJ/DADOS_ABERTOS_CNPJ.zip) . *OBS: O link
direto do arquivo pode estar quebrado devido a atualização da base de
dados.*

2 - Salve o nome do arquivo ‘.zip’ no diretório que será utilziado para
o processamento dos dados. *OBS: O arquivo compactado tem cerca de
5.3Gb*.

3 - Descompacte o arquivo no diretório. Talvez o arquivo tenho um nome
semelhante a ‘F.K032001K.D81106A’. *OBS: O arquivo descompactado tem
cerca de 85Gb. Verifique se há espaço suficiente no seu HD*

4 - Renomei o arquivo para um nome mais amigável, acrescentando a
extensão ‘.txt’ no final. Ex: ‘rf\_qsa\_cnpj.txt’

5 - Instale e execute o pacote. Abaixo, seguem algumas sugestões:

## Executando o pacote

``` r

# Instalar o pacote:
devtools::install_github("georgevbsantiago/qsacnpj")

library(qsacnpj)

# Selecionar a pasta de trabalho (Work Directory) que será armazenado os dados do CNPJ
setwd("/diretorio/")

# Sugestão 1: Tratar toda a base do CNPJ, 100.000 linha a cada interação,
# armazenando os dados no SQLite
qsacnpj::gerar_bd_cnpj(path_arquivo_txt = "rf_qsa_cnpj.txt",
                       localizar_cnpj = "NAO",
                       n_lines = 100000,
                       armazenar = "sqlite")


# Sugestão 2: Tratar toda a base do CNPJ, 100.000 linha a cada interação,
# armazenando os dados no CSV (OBS: O delimitador do CSV é o simbolo: "#').
qsacnpj::gerar_bd_cnpj(path_arquivo_txt = "rf_qsa_cnpj.txt",
                       localizar_cnpj = "NAO",
                       n_lines = 100000,
                       armazenar = "csv")


# Sugestão 3: Localziar um conjunto de CNPJ, interando a base a cada 100.000 linha,
# armazenando os dados localizados no SQLite
# (OBS1: O delimitador do CSV é o simbolo: "#');
# (OBS2: Exemplo com número de CNPJ, entre aspas (""), do Banco do Brasil, Banco do Nordeste,
# Banco da Amazônia e Caixa Econômica)
qsacnpj::gerar_bd_cnpj(path_arquivo_txt = "rf_qsa_cnpj.txt",
                       localizar_cnpj = c("00000000000191", "07237373000120",
                                          "00360305000104", "04902979000144"),
                       n_lines = 100000,
                       armazenar = "sqlite")


# Sugestão 4: Localziar um conjunto de CNPJ, interando a base a cada 100.000 linha,
# armazenando os dados localizados no CSV
# (OBS1: O delimitador do CSV é o simbolo: "#');
# (OBS2: Exemplo com número de CNPJ, entre aspas (""), do Banco do Brasil, Banco do Nordeste,
# Banco da Amazônia e Caixa Econômica)
qsacnpj::gerar_bd_cnpj(path_arquivo_txt = "rf_qsa_cnpj.txt",
                       localizar_cnpj = c("00000000000191", "07237373000120",
                                          "00360305000104", "04902979000144"),
                       n_lines = 100000,
                       armazenar = "csv")
```

Resultado esperado: No teste realizado sem aplicar o filtro
‘localizar\_cnpj’, o código executou com sucesso o tratamento e
organização de todos os dados no tempo de 3 hora e 30 minutos, gerando
um arquivo SQLite de +/- 24Gb, usando um notebook com processador i7 5ª
Geração, 16Gb DDR3 e disco HDD.

Ao final do processamento, o usuário visualizará, no diretório
escolhido, o arquivo SQLite com 03 tabelas (`cnpj_dados_cadastrais_pj`,
`cnpj_dados_socios_pj` e `cnpj_dados_cnae_secundario_pj`), ou, caso opte
pelo CSV, 03 arquivos CSV `cnpj_dados_cadastrais_pj.csv`,
`cnpj_dados_socios_pj.csv` e `cnpj_dados_cnae_secundario_pj.csv`.

Informações técnicas complementares podem ser obtidas na documentação do
pacote ao digitar `?qsacnpj`

## Base de dados Complementares

Adicionamos, no pacote, um conjunto de [Tabelas complementares
disponíveis no site da Receita
Federal](http://receita.economia.gov.br/interface/lista-de-servicos/cadastros/cnpj)
para enriquecer e detalhar a Bases de Dados do CNPJ.

  - [Tabela com CNPJ dos Entes
    Federativos](http://receita.economia.gov.br/interface/lista-de-servicos/cadastros/cnpj/lista-dos-cnpj-entes-federativos),
    foi incluída dentro do pacote, podendo ser acessada pela variável
    `qsacnpj::tab_cnpj_entes_publicos_br`.

  - [Tabela de Qualificação do Responsável no Quadro Societário da
    Pessoa
    Jurídica](http://receita.economia.gov.br/orientacao/tributaria/cadastros/cadastro-nacional-de-pessoas-juridicas-cnpj/DominiosQualificaodoresponsvel.csv),
    foi incluída dentro do pacote, podendo ser acessada pela variável
    `qsacnpj::tab_qualificacao_responsavel_socio`.

  - [Tabela de Motivo Situação Cadastral da Pessoa
    Jurídica](http://receita.economia.gov.br/orientacao/tributaria/cadastros/cadastro-nacional-de-pessoas-juridicas-cnpj/DominiosMotivoSituaoCadastral.csv),
    foi incluída dentro do pacote, podendo ser acessada pela variável
    `qsacnpj::tab_situacao_cadastral`.

Adicionamos, no pacote, um conjunto de [Tabelas complementares
disponíveis no site do
IBGE](https://concla.ibge.gov.br/classificacoes.html) para enriquecer e
detalhar a Bases de Dados do CNPJ

  - [Tabela de Classificação da Natureza
    Jurídica 2018](https://concla.ibge.gov.br/estrutura/natjur-estrutura/natureza-juridica-2018),
    foi incluída dentro do pacote, podendo ser acessada pela variável
    `tab_natureza_juridica`.

  - [Tabela de Classificação Nacional de Atividades Econômicas (CNAE) -
    Subclasses 2.3](https://concla.ibge.gov.br/classificacoes/por-tema/atividades-economicas),
    foi incluída dentro do pacote, podendo ser acessada pela variável
    `tab_cnae`.

# Base de Dados do CNPJ tratada

A base de dados do CNPJ já tratada está disponível nos links abaixo.
Contudo, é bom destacar que essa base de dados foi criada com a primeira
versão do pacote, logo, pode haver algumas inconsistência.

O arquivo disponível foi criado com o SQLite. Para acessar os dados,
siga 3 passos:

1 - Baixe o arquivo ‘.zip’. *OBS: O arquivo no formato ‘.zip’ tem cerca
de 5Gb*;

2 - Descompacte o arquivo. *OBS: Após ser descompactado, o arquivo
ficará com 14Gb. Verifique se há espaço no disco*;

3 - Instale o programa `DB Browser for SQLite` ( [neste
link](https://sqlitebrowser.org/) ). Trata-se de uma programa que
permite visualizar os dados do SQLite e fazer consultas SQL;

4 - Ao abrir o arquivo `dados_qsa_cnpj.db` com o `DB Browser for
SQLite`, o tempo de carregamento do banco de dados no programa pode
demorar de 3 a 7 minutos a depender das configurações do computador,
caso o usuário opte pela opção de “Nevegar pela tabela”. Se optar por
realizar consultas SQL, a base estará pronta para uso imediato.

  - Base de dados liberada pela RFB no dia 15/03/2019 e Processada com a
    versão 0.1.4 do pacote:
    
    [Base de Dados do CNPJ - SQLite](http://bit.ly/2GeAVML)
    
    [Base de Dados do CNPJ - CSV](http://bit.ly/2XfNwGL) (*OBS:
    Delimitador do CSV: ‘\#’*)

## Modelo Lógico do Banco de Dados

Para melhor visualização das tabelas do Banco de Dados, disponibilizamos
esse [imagem (link) do Modelo
Lógico](https://raw.githubusercontent.com/georgevbsantiago/qsacnpj/master/img/esquema_cnpj.png)
. *(OBS: O modelo lógico foi desenhado sem rigor técnico. A sua
disponibilização é só para efeito de visualização das tabelas que
compõem a Base de Dados)*

# Futuras Implementações, Atualizações e BUGs

### Futuras Implementações ou Melhorias

  - Implementar uma função para verificar se os CNPJ na variável
    ‘localizar\_cnpj’ são válidos;

  - Criar uma função para verificar a adequação da base de dados;

  - Verificar se há ganho de desempenho ao trocar a função do pacote
    `stringr` por uma equivalente da base R (ex: trimws() ) ou usando
    argumentos das funções `readr::write_delim` ou `DBI:dbWriteTable`
    para suprimir os espaços em branco na esquerda e na direita das
    strings;

  - Verificar se há ganho de desempenho ao filtrar o data frame com uma
    coluna numérica, em vez de uma coluna character;

  - Verificar se há ganho de desempenho pré-definindo o tipo das colunas
    durante o tratamento dos dados;

  - Incluir rotina para baixar a Base de dados do CNPJ e as Tabelas
    complementares disponibilizadas pela Receita Federal

  - Criar índice no SQLite para todas as tabelas;

  - Melhorar o desempenho do código, difinindo novas estratégias para
    correção do encoding, ao utilizar a função `read_chunked_lines`, que
    está dentro da função `obter_dados_qsa`. A solução atual onerou a
    execução em mas 2 horas.

### Atualizações

#### qsacnpj - versão: 0.1.4

**1 - BUGs Corrigidos:**

1.1 - Implementado uma rotina de tratamento adequado para construção da
tabela referente aos CNAEs secundários.

**2 - MELHORIAS:**

2.1 - Adicionamos, no pacote, um conjunto de [Tabelas complementares
disponíveis no site do
IBGE](https://concla.ibge.gov.br/classificacoes.html) para enriquecer e
detalhar a Bases de Dados do CNPJ.

  - [Tabela de Classificação da Natureza
    Jurídica 2018](https://concla.ibge.gov.br/estrutura/natjur-estrutura/natureza-juridica-2018),
    foi incluída dentro do pacote, podendo ser acessada pela variável
    `tab_natureza_juridica`.

  - [Tabela de Classificação Nacional de Atividades Econômicas (CNAE) -
    Subclasses 2.3](https://concla.ibge.gov.br/classificacoes/por-tema/atividades-economicas),
    foi incluída dentro do pacote, podendo ser acessada pela variável
    `tab_cnae`.

2.2 - Tratamento de dados

  - Os dados das colunas que representam datas foram tratados para o
    padrão internacional (ano-mes-dia). Ex: Antes: 20180505 / Depois:
    2018-05-05 . As datas com valores inválidos (Ex: 00000000), ficaram
    como NULL (vazio) na tabela;

  - Os dados das colunas que representam a capital social foram
    transformadas para o padrão de valores monetários internacional:
    Antes: 00000001272800 / Depois: 12728.00

#### qsacnpj - versão: 0.1.3

**1 - BUGs Corrigidos:**

1.1 - Corrigido o problema das linhas NULL. Estava relacionado ao
encoding, devido a letras com “Ç”, a exemplo da palavra “PRAÇA”. Como
tivemos que implementar o argumento `locale = readr::locale(encoding =
"ISO-8859-1")` na função, houve uma perda substancial do desempenho da
função, fazendo que com a criação da base de dados demore mais de 2h.

**2 - MELHORIAS:**

2.1 - Rotina para tratar o número dos CPFs dos sócios retirando os 03
zeros iniciais. Antes: `000***718468**` , Agora: `***718468**`

2.2 - Adicionamos, no pacote, um conjunto de [Tabelas complementares
disponíveis no site da Receita
Federal](http://receita.economia.gov.br/interface/lista-de-servicos/cadastros/cnpj)
para enriquecer e detalhar a Bases de Dados do CNPJ.

  - [Tabela com CNPJ dos Entes
    Federativos](http://receita.economia.gov.br/interface/lista-de-servicos/cadastros/cnpj/lista-dos-cnpj-entes-federativos),
    foi incluída dentro do pacote, podendo ser acessada pela variável
    `tab_cnpj_entes_publicos_br`.

  - [Tabela de Qualificação do Responsável no Quadro Societário da
    Pessoa
    Jurídica](http://receita.economia.gov.br/orientacao/tributaria/cadastros/cadastro-nacional-de-pessoas-juridicas-cnpj/DominiosQualificaodoresponsvel.csv),
    foi incluída dentro do pacote, podendo ser acessada pela variável
    `tab_qualificacao_responsavel_socio`.

  - [Tabela de Motivo Situação Cadastral da Pessoa
    Jurídica](http://receita.economia.gov.br/orientacao/tributaria/cadastros/cadastro-nacional-de-pessoas-juridicas-cnpj/DominiosMotivoSituaoCadastral.csv),
    foi incluída dentro do pacote, podendo ser acessada pela variável
    `tab_situacao_cadastral`.

2.3 - Com a implementação das novas tabelas, o código foi reestruturado.
Agora, o tratamento e organização dos dados da base do CNPJ é executado
com a função `gerar_bd_cnpj`

#### qsacnpj - versão: 0.1.2

  - Adicionado rotina para substituir “;” por “\#”, em virtude da base
    de dados usar o “;” no corpo de diversos dados.

### BUGs e Warnings

Caso identifique um BUG, favor abrir uma `issues` no Github.

Como essa é a primeira versão do pacote, podem existir problemas ainda
não identificados.

# Outras alternativas em R ou Python

Por fim, deixo a sugestão de outras alternativas que foram criados com o
mesmo propósito:

  - Pacote em R: [rfbCNPJ - Julio
    Trecenti](https://www.curso-r.com/blog/2018-05-13-rfbcnpj/)

  - Script em Python: [socios-brasil -
    Turicas](https://github.com/turicas/socios-brasil/blob/master/qualificacao-socio.csv)
