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


        if(armazenar == "sqlserver") {

                # Para utilizar outros métodos de proteção do credenciamento no SGBD, consulte:
                # Site: https://db.rstudio.com/best-practices/managing-credentials/
                #       https://db.rstudio.com/best-practices/portable-code/

                # Mais informações sobre a Conexão no SQL Server, consulte:
                # Site: https://db.rstudio.com/databases/microsoft-sql-server/

                connect_sgbd <- DBI::dbConnect(odbc::odbc(),
                                               Driver = "[your driver's name]",
                                               Server = "[your server's path]",
                                               Database = "[your database's name]",
                                               UID = rstudioapi::askForPassword("Database user"),
                                               PWD = rstudioapi::askForPassword("Database password"),
                                               Port = 1433)

                return(connect_sgbd)

        }


        if(armazenar == "oracle") {

                # Para utilizar outros métodos de proteção do credenciamento no SGBD, consulte:
                # Site: https://db.rstudio.com/best-practices/managing-credentials/
                #       https://db.rstudio.com/best-practices/portable-code/

                # Mais informações sobre a Conexão no Oracle, consulte:
                # Site: https://db.rstudio.com/databases/oracle/

                connect_sgbd <- DBI::dbConnect(odbc::odbc(),
                                               Driver = "[your driver's name]",
                                               Host= "[your server's path]",
                                               SVC = "[your schema's name]",
                                               UID = rstudioapi::askForPassword("Database user"),
                                               PWD = rstudioapi::askForPassword("Database password"),
                                               Port  = 1521)

                return(connect_sgbd)

        }

        if(armazenar == "mysql") {

                # Para utilizar outros métodos de proteção do credenciamento no SGBD, consulte:
                # Site: https://db.rstudio.com/best-practices/managing-credentials/
                #       https://db.rstudio.com/best-practices/portable-code/

                # Mais informações sobre a Conexão no MySQL, consulte:
                # https://db.rstudio.com/databases/my-sql/


                connect_sgbd <- DBI::dbConnect(odbc::odbc(),
                                               Driver   = "[your driver's name]",
                                               Server   = "[your server's path]",
                                               UID      = rstudioapi::askForPassword("Database user"),
                                               PWD      = rstudioapi::askForPassword("Database password"),
                                               Port     = 3306)

                return(connect_sgbd)

        }

}

#######################################################################################################

