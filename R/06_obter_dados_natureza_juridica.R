#' @title Função que inclui a Tabela de Classificação da Natureza Jurídica
#'
#' @param armazenar Indica a forma de armazenamento dos dados: 'csv' ou 'sqlite' (OBS1: O delimitador do CSV é o simbolo: "#')
#'
#'

obter_dados_natureza_juridica <- function(armazenar) {


        tab_natureza_juridica <- qsacnpj::tab_natureza_juridica


        if(armazenar == "csv") {

                readr::write_delim(tab_natureza_juridica,
                                   file.path("bd_cnpj_tratados", "tab_natureza_juridica.csv"),
                                   delim = "#")
        }


        if(armazenar == "sqlite") {

                DBI::dbWriteTable(qsacnpj::connect_sgbd(armazenar),
                                  "tab_natureza_juridica",
                                  tab_natureza_juridica)

                DBI::dbDisconnect(qsacnpj::connect_sgbd(armazenar))

        }

}
