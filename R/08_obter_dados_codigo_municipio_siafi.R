#' @title Função que inclui a Tabela de Código dos Municípios do SIAFI, correspondentes ao Código dos Municípios do IBGE
#'
#' @param armazenar Indica a forma de armazenamento dos dados: 'csv' ou 'sqlite' (OBS1: O delimitador do CSV é o simbolo: "#')
#'
#'

obter_dados_codigo_municipios_siafi <- function(armazenar) {


        tab_codigo_municipios_siafi <- qsacnpj::tab_codigo_municipios_siafi


        if(armazenar == "csv") {

                readr::write_delim(tab_codigo_municipios_siafi,
                                   file.path("bd_cnpj_tratados", "tab_codigo_municipios_siafi.csv"),
                                   delim = "#")
        }


        if(armazenar %in% c("sqlite", "sqlserver", "oracle", "mysql")) {

                conn <- qsacnpj::connect_sgbd(armazenar)

                DBI::dbWriteTable(conn,
                                  "tab_codigo_municipios_siafi",
                                  tab_codigo_municipios_siafi)

                DBI::dbDisconnect(conn)

        }

}
