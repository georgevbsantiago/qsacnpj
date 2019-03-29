#' @title Função que orquestra as demais funções para realizar o tratamento e organização dos dados do CNPJ
#'
#' @description Essa função foi desenvolvida utilizando como elementro central uma função complementar
#' chamada 'readr::read_lines_chunked', com o propósito de ler o arquivo '.txt' de 87Gb em partes de
#' 10.000, 100.000 ou 1.000.000 de linhas por vez.
#'
#' @param path_arquivo_txt Caminho (path) do arquivo com a base de dados do CNPJ no formato '.txt'
#' @param localizar_cnpj Vetor com o número dos CNPJ que se deseja filtrar e obter os dados.
#' O valor padrão é "NAO", o que força ao tratamento de todas as linha da base de dados
#' @param n_lines Número de linhas que podem ser iteradas por vez: 10000, 100000 ou 1000000
#' @param armazenar Indica a forma de armazenamento dos dados: 'csv' ou 'sqlite' (OBS1: O delimitador do CSV é o simbolo: "#'),
#'  (OBS2: Preferencialmente, defina a pasta de trabalho da sessão 'Working Directory' na mesma em que está localizado o arquivo
#' '.txt' da base de dados no CNPJ)
#'
#' @examples
#' \dontrun{
#' qsacnpj::gerar_bd_cnpj(path_arquivo_txt = "D:/rf_qsa_cnpj.txt",
#'                        localizar_cnpj = "NAO",
#'                        n_lines = 100000,
#'                        armazenar = "csv")
#'
#'
#'# Exemplo com número de CNPJ, entre aspas (""), do Banco do Brasil, Banco do Nordeste,
#'# Banco da Amazônia e Caixa Econômica
#'
#' qsacnpj::gerar_bd_cnpj(path_arquivo_txt = "D:/rf_qsa_cnpj.txt",
#'                        localizar_cnpj = c("00000000000191", "07237373000120",
#'                                             "00360305000104", "04902979000144"),
#'                        n_lines = 100000,
#'                        armazenar = "sqlite")
#'}
#'
#'
#' @export

gerar_bd_cnpj <- function(path_arquivo_txt,
                          localizar_cnpj = "NAO",
                          n_lines = 100000,
                          armazenar = "csv") {


        if(is.null(path_arquivo_txt)) {

                stop("Defina o caminho (path) do arquivo da base de dados do CNPJ")
        }

        if(file.exists("dados_cadastrais_pj.csv") |
           file.exists("dados_qsa_cnpj.db") == TRUE) {

                stop("Foi identificado, no diretório, a existência de arquivos CSV ou SQLite criados pelo pacote.",
                     "Apague os arquivos CSV ou SQLite gerados, ou altere o diretório de trabalho!")
        }

        #!!! Criar uma função para verificar se os CNPJ na variável 'localizar_cnpj' são válidos

        if(!n_lines %in% c(10000, 100000, 1000000)) {

                stop("Escolha a opção 10000, 100000 ou 1000000 para a quantidade de linhas a serem analisadas por vez!")

        }

        if(!armazenar %in% c("csv", "sqlite")) {

                stop("Escolha a opção 'csv' ou 'sqlite' para armazenar os dados!")
        }


                print(paste("Iniciando o tratamento e consolidação dos dados do CNPJ.",
                      "Esse processo pode levar entre 1h a 2h, dependenndo da configuração do computador!"))

        obter_dados_qsa(path_arquivo_txt,
                        localizar_cnpj,
                        n_lines,
                        armazenar)

                print(paste("Base de Dados do CNPJ gerada com Sucesso! Tabelas geradas:",
                      "`dados_cadastrais_pj`, `dados_socios_pj` e `dados_cnae_secundario_pj`"))


                print("Adicionando na base a tabela com dados dos Entes Públicos Federais, Estaduais e Municipais!")

        obter_dados_cnpj_entes_publicos(armazenar)

                print("Tabela `tab_cnpj_entes_publicos_br` gerada com Sucesso!")


                print("Adicionando na base a tabela com Código e Nome da Qualificação dos Responsáveis!")

        obter_dados_qualificacao_responsavel(armazenar)

                print("Tabela `tab_qualificacao_responsavel_socio` gerada com Sucesso!")


                print("Adicionando na base a tabela com Código e Nome da Situação Cadastral!")

        obter_dados_situacao_cadastral(armazenar)

                print("Tabela `tab_situacao_cadastral` gerada com Sucesso!")


        message("Fim do Processamento: Base de Dados do CNPJ gerada com Sucesso!")

}
