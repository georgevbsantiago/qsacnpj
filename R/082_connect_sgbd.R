#' @title Função que cria a conexão com o Banco de Dados
#'
#'
#' @param armazenar Indica a forma de armazenamento dos dados: 'csv' ou 'sqlite'
#'
#'
#' @export

connect_sgbd <- function(armazenar) {


        if(armazenar == "sqlite") {

                connect_sgbd <- DBI::dbConnect(RSQLite::SQLite(),
                                               dbname = file.path("bd_cnpj_tratados", "bd_dados_qsa_cnpj.db"))

                return(connect_sgbd)
        }


}

#######################################################################################################

