#' Tabela com o CNPJ dos Entes Federativos
#'
#' Dataset com o nome e código dos Entes Públicos Federais, Estaduais e Municipais
#'
#' @format Um data frame com 118.287 linhas e 6 variáveis:
#' \describe{
#'   \item{cnpj}{Código do CNPJ}
#'   \item{cod_natureza_juridica}{Código da Natureza Jurídica}
#'   \item{nome_empresarial}{Nome do Ente Federativo}
#'   \item{ente_federativo_responsavel}{Código do Ente Federativo Responsável}
#'   \item{ente_principal}{Indicador do Ente Principal}
#'   \item{situacao}{Situação Cadastral}
#'   ...
#' }
#' @source \url{http://www.receita.fazenda.gov.br/publico/cnpj/ListadosCNPJdosEntesFederativos.ods}
"tab_cnpj_entes_publicos_br"



#' Tabela de Qualificação do Sócio
#'
#' Dataset com o nome e código de Qualificação do Responsável e/ou Sócio no Quadro Societário da Pessoa Jurídica
#'
#' @format Um data frame com 79 linhas e 3 variáveis:
#' \describe{
#'   \item{cod_qualificacao_responsavel_socio}{Código da Qualificação do Responsável e/ou Sócio}
#'   \item{nm_qualificacao_responsavel_socio}{Nome da Qualificação do Responsável e/ou Sócio}
#'   \item{coletado_atualmente}{Informaçquão que indica se a Receita Federal utiliza ou coleta atualmente a classificação}
#'   ...
#' }
#' @source \url{http://receita.economia.gov.br/orientacao/tributaria/cadastros/cadastro-nacional-de-pessoas-juridicas-cnpj/DominiosQualificaodoresponsvel.csv}
"tab_qualificacao_responsavel_socio"



#' Tabela de Situação Cadastral
#'
#' Dataset com o nome e código da Situação Cadastral da Pessoa Jurídica
#'
#' @format Um data frame com 68 linhas e 2 variáveis:
#' \describe{
#'   \item{cod_situacao_cadastral}{Código da Situação Cadastral}
#'   \item{nm_situacao_cadastral}{Nome da Situação Cadastral}
#'   ...
#' }
#' @source \url{http://receita.economia.gov.br/orientacao/tributaria/cadastros/cadastro-nacional-de-pessoas-juridicas-cnpj/DominiosMotivoSituaoCadastral.csv}
"tab_situacao_cadastral"



#' Tabela de Classificação da Natureza Jurídica
#'
#' Dataset com o nome e código de Classificação da Natureza Jurídica de 2018
#'
#' @format Um data frame com 90 linhas e 4 variáveis:
#' \describe{
#'   \item{cod_natureza_juridica}{Código da Natureza Jurídica}
#'   \item{nm_natureza_juridica}{Nome da Natureza Jurídica}
#'   \item{cod_subclass_natureza_juridica}{Código da subclassificação da Natureza Jurídica}
#'   \item{nm_subclass_natureza_juridica}{Nome da subclassificação da Natureza Jurídica}
#'   ...
#' }
#' @source \url{https://concla.ibge.gov.br/estrutura/natjur-estrutura/natureza-juridica-2018}
"tab_natureza_juridica"


#' Tabela de Classificação da Natureza Jurídica
#'
#' Dataset com o nome e código de Classificação Nacional de Atividades Econômicas (CNAE) - Subclasses 2.3
#'
#' @format Um data frame com 1331 linhas e 10 variáveis:
#' \describe{
#'   \item{cod_secao}{Código da Seção}
#'   \item{nm_secao}{Nome da Seção}
#'   \item{cod_divisao}{Código da Divisão}
#'   \item{nm_divisao}{Nome da Divisão}
#'   \item{cod_grupo}{Código do Grupo}
#'   \item{nm_grupo}{Nome do grupo}
#'   \item{cod_classe}{Código da Classe}
#'   \item{nm_classe}{Nome da Classe}
#'   \item{cod_cnae}{Código do CNAE}
#'   \item{nm_cnae}{Nome do CNAE}
#'   ...
#' }
#' @source \url{https://concla.ibge.gov.br/classificacoes/por-tema/atividades-economicas}
"tab_cnae"


#' Tabela de Código dos Municípios do SIAFI, correspondente ao do IBGE
#'
#' Dataset com o nome e código de Classificação dos Municípios no SIAFI, com correspondência ao do IGBE
#'
#' @format Um data frame com 5589 linhas e 5 variáveis:
#' \describe{
#'   \item{codigo_siafi}{Código do Município no SIAFI}
#'   \item{cnpj}{CNPJ do Município}
#'   \item{descricao}{Nome do Município}
#'   \item{uf}{Unidade Federativa do Município}
#'   \item{codigo_ibge}{Código do Município no IBGE}
#'   ...
#' }
#' @source \url{http://www.tesourotransparente.gov.br/ckan/dataset/lista-de-municipios-do-siafi}
"tab_codigo_municipios_siafi"
