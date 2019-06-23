#' @title Função que inclui a Tabela de Motivo Situação Cadastral da Pessoa Jurídica
#'
#' @param armazenar Indica a forma de armazenamento dos dados: 'csv' ou 'sqlite' (OBS1: O delimitador do CSV é o simbolo: "#')
#'
#'

obter_dados_situacao_cadastral <- function(armazenar) {


        tab_situacao_cadastral <- qsacnpj::tab_situacao_cadastral


        if(armazenar == "csv") {

                readr::write_delim(tab_situacao_cadastral,
                                   file.path("bd_cnpj_tratados", "tab_situacao_cadastral.csv"),
                                   delim = "#")
        }


        if(armazenar == "sqlite") {

                DBI::dbWriteTable(qsacnpj::connect_sgbd(armazenar),
                                  "tab_situacao_cadastral",
                                  tab_situacao_cadastral)

                DBI::dbDisconnect(qsacnpj::connect_sgbd(armazenar))


        }

}
