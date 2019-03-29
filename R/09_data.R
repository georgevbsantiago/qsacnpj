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
#' @format Um data frame com 32 linhas e 2 variáveis:
#' \describe{
#'   \item{cod_qualificacao_responsavel_socio}{Código da Qualificação do Responsável e/ou Sócio}
#'   \item{nm_qualificacao_responsavel_socio}{Nome da Qualificação do Responsável e/ou Sócio}
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
