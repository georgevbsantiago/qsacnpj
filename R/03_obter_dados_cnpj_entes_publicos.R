#' @title Função que inclui a Tabela com CNPJ dos Entes Federativos
#'
#' @param armazenar Indica a forma de armazenamento dos dados: 'csv' ou 'sqlite' (OBS1: O delimitador do CSV é o simbolo: "#')
#'
#'

obter_dados_cnpj_entes_publicos <- function(armazenar) {


        tab_cnpj_entes_publicos <- qsacnpj::tab_cnpj_entes_publicos_br


        if(armazenar == "csv") {

                readr::write_delim(tab_cnpj_entes_publicos,
                                   file.path("bd_cnpj_tratados", "tab_cnpj_entes_publicos.csv"),
                                   delim = "#")
        }


        if(armazenar %in% c("sqlite", "sqlserver", "oracle", "mysql")) {

                conn <- qsacnpj::connect_sgbd(armazenar)

                DBI::dbWriteTable(conn,
                                  "tab_cnpj_entes_publicos",
                                  tab_cnpj_entes_publicos)

                DBI::dbDisconnect(conn)

        }


}

