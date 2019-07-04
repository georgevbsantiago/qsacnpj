#' @title Função que pesquisa os dados do CNPJ do Banco de Dados
#'
#' @description Ao final da consulta, é gerado um arquivo CSV com o resultado da pesquisa
#'
#' @param cnpj_alvos Números dos CNPJ que serão extraídos do Banco de Dados
#' @param criar_indice Cria um índice no Banco de Dados para otimizar as pesquisas.
#'         OBS: Esse processo demora uns 5 min
#' @param sgbd Variável que indica o SGBD que será realizada a conexão. O 'sqlite' é a opção padrão.
#'
#'

pesquisar_dados_cnpj <- function(cnpj_alvos,
                                 criar_indice = TRUE,
                                 sgbd = "sqlite") {

        #!!! Implementar um validador de CNPJ
        cnpj_alvos <- as.character(cnpj_alvos) %>%
                      unique()

        if(criar_indice == TRUE){

                print(paste("Criando 03 índices para otimizar as pesquisas.",
                            "Essa operação é realizada uma única vez.",
                            "Esse processo pode demorar até 5 minutos!"))

        conn <- qsacnpj::connect_sgbd(armazenar)

        DBI::dbExecute(conn,
                       "CREATE UNIQUE INDEX IF NOT EXISTS index_cnpj ON cnpj_dados_cadastrais_pj(cnpj);")

        print("Índice da coluna 'cnpj' criado com sucesso na tabela `cnpj_dados_cadastrais_pj`!")



        DBI::dbExecute(conn,
                       "CREATE INDEX IF NOT EXISTS index_cnpj_socios ON cnpj_dados_socios_pj(cnpj);")

        print("Índice da coluna 'cnpj' criado com sucesso na tabela `cnpj_dados_socios_pj`!")



        DBI::dbExecute(conn,
                       "CREATE INDEX IF NOT EXISTS index_cnpj_cnae ON cnpj_dados_cnae_secundario_pj(cnpj);")

        print("Índice da coluna 'cnpj' criado com sucesso na tabela `cnpj_dados_cnae_secundario_pj`!")

        DBI::dbDisconnect(conn)


        }

        print("Iniciando pesquisa dos CNPJs no Banco de Dados. Esse processo pode demorar alguns minutos!")

        conn <- qsacnpj::connect_sgbd(armazenar)

        subset_cnpjs <- dplyr::tbl(conn,
                                   "cnpj_dados_cadastrais_pj") %>%
                        dplyr::filter(cnpj %in% cnpj_alvos) %>%
                        dplyr::select(cnpj:opcao_pelo_simples) %>%
                        dplyr::collect()

        DBI::dbDisconnect(conn)


        readr::write_delim(subset_cnpjs,
                           file.path("bd_cnpj_tratados", "dados_cnpjs_pesquisa.csv"),
                           delim = "#"
                           )

        print("Arquivo CSV com os dados do CNPJ gerado com sucesso!")

        return(subset_cnpjs)

}

