Pacote desenvolvido para tratar e organizar a base de dados do Cadastro
Nacional da Pessoa Jurídica (CNPJ)
================
George Santiago
23 de março de 2019

<!-- README.md is generated from README.Rmd. Please edit that file -->

# O Projeto

O pacote `qsacnpj` é uma das ferramentas utilizadas no projeto de
“Transparência das Contas Públicas”, desenvolvido e executado pelo
Observatório Social do Brasil - Município de Santo Antônio de Jesus -
Estado da Bahia.

## Sobre a proposta e o objetivo do pacote

O objetivo do pacote é tornar os dados do Cadastro Nacional da Pessoa
Jurídica (CNPJ) mais acessível, num padrão legível por máquina, para que
a Sociedade possa utilizá-los em diversas iniciativas, atividades,
projetos etc.

Por ser uma base de dados governamental que congrega diversas
informações sobre as Pessoas Jurídicas constituídas no Brasil (com
exceção das Fundações Privadas, Associações e demais entidades que
mantêm seus registros perante os Cartórios Civis de Registro de Pessoas
Jurídicas), a referida base é uma das fontes de informação pública mais
relevantes do país.

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

# Sugestão 1: Tratar toda a base do CNPJ, 100.000 linha a cada interação, armazenando os dados no SQLite
qsacnpj::obter_dados_qsa(path_arquivo_txt = "rf_qsa_cnpj.txt",
                         localizar_cnpj = "NAO",
                         n_lines = 100000,
                         armazenar = "sqlite")


# Sugestão 2: Tratar toda a base do CNPJ, 100.000 linha a cada interação, armazenando os dados no CSV
qsacnpj::obter_dados_qsa(path_arquivo_txt = "rf_qsa_cnpj.txt",
                         localizar_cnpj = "NAO",
                         n_lines = 100000,
                         armazenar = "csv")

# Sugestão 3: Localziar um conjunto de CNPJ, interando a base a cada 100.000 linha, armazenando os dados localizados no SQLite
qsacnpj::obter_dados_qsa(path_arquivo_txt = "rf_qsa_cnpj.txt",
                         localizar_cnpj = c("00000000000191", "07237373000120",
                                            "00360305000104", "04902979000144"
                                            ),
                         n_lines = 100000,
                         armazenar = "sqlite")
# Sugestão 4: Localziar um conjunto de CNPJ, interando a base a cada 100.000 linha, armazenando os dados localizados no CSV
qsacnpj::obter_dados_qsa(path_arquivo_txt = "rf_qsa_cnpj.txt",
                         localizar_cnpj = c("00000000000191", "07237373000120",
                                            "00360305000104", "04902979000144"
                                            ),
                         n_lines = 100000,
                         armazenar = "csv")
```

# Futuras Implementações

  - Criar uma função para verificar se os CNPJ na variável
    ‘localizar\_cnpj’ são válidos

  - Criar uma função para verificar a adequação da base de dados

# BUGs e Correções

Caso identifique um BUG, favor abrir uma `issues` no Github.

Como essa é a primeira versão do pacote, podem existir problemas ainda
não identificados.

Possíveis problemas já identificados:

  - Verificar porque o arquivo CSV e o SQLite criados têm algumas linhas
    em branco no data frame. Analisar se são inconsistências da base de
    dados ou da função;

  - Analisar o Dicionário de Dados da Receita Federal para propor uma
    melhor extração dos CNAEs Secundários. Verificar se o problema é no
    Dicinário de Dados ou na Base de Dados;
