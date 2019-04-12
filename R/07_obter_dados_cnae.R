#' @title Função que inclui a Tabela com os CNAEs
#'
#' @param armazenar Indica a forma de armazenamento dos dados: 'csv' ou 'sqlite' (OBS1: O delimitador do CSV é o simbolo: "#')
#'
#'

obter_dados_cnae <- function(armazenar) {


        tab_cnae <- qsacnpj::tab_cnae


        if(armazenar == "csv") {

                readr::write_delim(tab_cnae,
                                   "tab_cnae.csv",
                                   delim = "#")
        }


        if(armazenar == "sqlite") {

                DBI::dbWriteTable(qsacnpj::connect_sgbd(armazenar),
                                  "tab_cnae",
                                  tab_cnae)

                DBI::dbDisconnect(qsacnpj::connect_sgbd(armazenar))

        }

}
