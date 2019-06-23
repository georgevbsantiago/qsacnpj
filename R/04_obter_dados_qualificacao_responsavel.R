#' @title Função que inclui a Tabela de Qualificação do Responsável no Quadro Societário da Pessoa Jurídica
#'
#' @param armazenar Indica a forma de armazenamento dos dados: 'csv' ou 'sqlite' (OBS1: O delimitador do CSV é o simbolo: "#')
#'
#'

obter_dados_qualificacao_responsavel <- function(armazenar) {


        tab_qualificacao_responsavel_socio <- qsacnpj::tab_qualificacao_responsavel_socio


        if(armazenar == "csv") {

                readr::write_delim(tab_qualificacao_responsavel_socio,
                                   file.path("bd_cnpj_tratados", "tab_qualificacao_responsavel_socio.csv"),
                                   delim = "#")
        }


        if(armazenar == "sqlite") {

                DBI::dbWriteTable(qsacnpj::connect_sgbd(armazenar),
                                  "tab_qualificacao_responsavel_socio",
                                  tab_qualificacao_responsavel_socio)

                DBI::dbDisconnect(qsacnpj::connect_sgbd(armazenar))

        }

}
