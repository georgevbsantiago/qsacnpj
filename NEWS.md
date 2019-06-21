# Atualizações

#### qsacnpj - versão: 0.1.5

Foram realizados ajustes no código, visto que a Receita Federal, a partir do mês de maio de 2019, passou a liberar a base do CNPJ por meio de 20 arquivos, e não mais num arquivo único.



#### qsacnpj - versão: 0.1.4

**1 - BUGs Corrigidos:**

1.1 - Implementado uma rotina de tratamento adequado para construção da tabela referente aos CNAEs secundários.

**2 - MELHORIAS:**

2.1 - Adicionamos, no pacote, um conjunto de [Tabelas complementares disponíveis no site do IBGE](https://concla.ibge.gov.br/classificacoes.html) para enriquecer e detalhar a Bases de Dados do CNPJ.

- [Tabela de Classificação da Natureza Jurídica 2018](https://concla.ibge.gov.br/estrutura/natjur-estrutura/natureza-juridica-2018) foi incluída dentro do pacote, podendo ser acessada pela variável `qsacnpj::tab_natureza_juridica`.

- [Tabela de Classificação Nacional de Atividades Econômicas (CNAE) - Subclasses 2.3](https://concla.ibge.gov.br/classificacoes/por-tema/atividades-economicas) foi incluída dentro do pacote, podendo ser acessada pela variável `qsacnpj::tab_cnae`.

2.2 - Tratamento de dados

- Os dados das colunas que representam datas foram tratados para o padrão internacional (ano-mes-dia). Ex: Antes: 20180505 / Depois: 2018-05-05 . As datas com valores inválidos (Ex: 00000000), ficaram como NULL (vazio) na tabela;

- Os dados das colunas que representam a capital social foram transformadas para o padrão de valores monetários internacional: Antes: 00000001272800 / Depois: 12728.00



## qsacnpj - versão: 0.1.3


1 - BUG:
1.1 - Corrigido o problema das linhas NULL. Estava relacionado ao encoding, devido a letras com "Ç", a exemplo da palavra "PRAÇA". Como tivemos que implementar o argumento `locale = readr::locale(encoding = "ISO-8859-1")` na função, houve uma perda substancial do desempenho da função, fazendo que com a criação da base de dados demore mais de 2h.


2 - MELHORIAS:
2.1 - Rotina para tratar o número dos CPFs dos sócios retirando os 03 zeros iniciais. Antes: "`000***718468**`" , Agora: "`***718468**`"

2.2 - Adicionamos, no pacote, um conjunto de [Tabelas complementares disponíveis no site da Receita Federal]((https://receita.economia.gov.br/interface/lista-de-servicos/cadastros/cnpj) para enriquecer a e detalhar a Bases de Dados do CNPJ.

- [Tabela com CNPJ dos Entes Federativos](https://receita.economia.gov.br/interface/lista-de-servicos/cadastros/cnpj/lista-dos-cnpj-entes-federativos), foi incluída dentro do pacote, podendo ser acessada pela variável `tab_cnpj_entes_publicos_br`.

- [Tabela de Qualificação do Responsável no Quadro Societário da Pessoa Jurídica](https://receita.economia.gov.br/orientacao/tributaria/cadastros/cadastro-nacional-de-pessoas-juridicas-cnpj/DominiosQualificaodoresponsvel.csv), foi incluída dentro do pacote, podendo ser acessada pela variável `tab_qualificacao_responsavel_socio`.

- [Tabela de Motivo Situação Cadastral da Pessoa Jurídica](https://receita.economia.gov.br/orientacao/tributaria/cadastros/cadastro-nacional-de-pessoas-juridicas-cnpj/DominiosMotivoSituaoCadastral.csv), foi incluída dentro do pacote, podendo ser acessada pela variável `tab_situacao_cadastral`.

2.3 - Com a implementação das novas tabelas, o código foi reestruturado. Agora, o tratamento e organização dos dados da base do CNPJ é executado com a função `gerar_bd_cnpj`



## qsacnpj - versão: 0.1.2

* Adicionado rotina para substituir ";" por "#", em virtude da base de dados usar o ";" no corpo de diversos dados.



