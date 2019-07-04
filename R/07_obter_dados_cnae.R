#' @title Função que inclui a Tabela com os CNAEs
#'
#' @param armazenar Indica a forma de armazenamento dos dados: 'csv' ou 'sqlite' (OBS1: O delimitador do CSV é o simbolo: "#')
#'
#'

obter_dados_cnae <- function(armazenar) {


        tab_cnae <- qsacnpj::tab_cnae


        if(armazenar == "csv") {

                readr::write_delim(tab_cnae,
                                   file.path("bd_cnpj_tratados", "tab_cnae.csv"),
                                   delim = "#")
        }


        if(armazenar %in% c("sqlite", "sqlserver", "oracle", "mysql")) {

                conn <- qsacnpj::connect_sgbd(armazenar)

                DBI::dbWriteTable(conn,
                                  "tab_cnae",
                                  tab_cnae)

                DBI::dbDisconnect(conn)

        }

}
