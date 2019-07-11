#' @title Função que orquestra as demais funções para realizar o tratamento e organização dos dados
#'
#' @description Essa função foi desenvolvida utilizando como elementro central uma função complementar
#' chamada 'readr::read_lines_chunked', com o propósito de ler o arquivo '.txt' de 87Gb em partes de
#' 10.000, 100.000 ou 1.000.000 de linhas por vez.
#'
#' @param path_arquivos_txt Caminho (path) dos arquivos com a base de dados do CNPJ no formato '.txt'
#' @param localizar_cnpj Vetor com o número dos CNPJ que se deseja filtrar e obter os dados.
#' O valor padrão é "NAO", o que força ao tratamento de todas as linha da base de dados
#' @param n_lines Número de linhas que podem ser iteradas por vez: 10000, 100000 ou 1000000
#' @param armazenar Indica a forma de armazenamento dos dados: 'csv' ou 'sqlite' (OBS1: O delimitador do CSV é o simbolo: "#'),
#'  (OBS2: Preferencialmente, defina a pasta de trabalho da sessão 'Working Directory' na mesma em que está localizado o arquivo
#' '.txt' da base de dados no CNPJ)
#'

obter_dados_qsa <- function(path_arquivos_txt,
                            localizar_cnpj,
                            n_lines,
                            armazenar) {


        # col_position_pj <- criar_col_position_pj()
        #
        # col_position_socio <- criar_col_position_socio()
        #
        # col_position_cnae <- criar_col_position_cnae()


for (arquivo_txt in path_arquivos_txt) {

readr::read_lines_chunked(file = arquivo_txt,
                          chunk_size = n_lines,
                          locale = readr::locale(encoding = "ISO-8859-1"),
                          callback = readr::SideEffectChunkCallback$new(tratar_arquivo_txt(arquivo_txt,
                                                                                           localizar_cnpj,
                                                                                           n_lines,
                                                                                           armazenar)))
}

}


#######################################################################################################

#' @title Função trata e armazena os dados do CNPJ no Banco de Dados
#'
#' @param arquivo_txt Arquivo com a base de dados do CNPJ no formato '.txt'
#' @param localizar_cnpj Vetor com o número dos CNPJ que se deseja filtrar e obter os dados.
#' O valor padrão é "NAO", o que força ao tratamento de todas as linha da base de dados
#' @param n_lines Número de linhas que podem ser iteradas por vez: 10000, 100000 ou 1000000
#' @param armazenar Indica a forma de armazenamento dos dados: 'csv' ou 'sqlite' (OBS1: O delimitador do CSV é o simbolo: "#'),
#'  (OBS2: Preferencialmente, defina a pasta de trabalho da sessão 'Working Directory' na mesma em que está localizado o arquivo
#' '.txt' da base de dados no CNPJ)
#'
#'
#'
#' @importFrom magrittr %>%
#'
#'

tratar_arquivo_txt <- function(arquivo_txt,
                               localizar_cnpj,
                               n_lines,
                               armazenar) {

    # Variáveis utilizadas pela função `readr::SideEffectChunkCallback$new`
    # Variável: 'x' Data Frame que será analisado e tratado
    # Variável: 'pos' Variável que indica o número da linha inicial da interação

        function(x, pos) {

# A variável 'pos' é um elemento da função 'SideEffectChunkCallback'
# e indica a posição da linha inicial da iteração

        linha_inicial <- as.integer(pos)

        linha_final <- as.integer(pos + n_lines - 1)

        print(paste("Analisando linhas:", linha_inicial, "a", linha_final, "- arq:", arquivo_txt))

# ------------------------------------------------------------------------------------------------

# Carrega a as tabelas com as posição dos delimitadores

        # Os valores utilizados para constituir a tabela de posições estão
        # especificados no Dicionário de Dados disponibilizado no site da Receita Federal
        # link: http://200.152.38.155/CNPJ/LAYOUT_DADOS_ABERTOS_CNPJ.pdf

        col_position_pj <- readr::fwf_cols(tipo_de_registro = 1,
                                           indicador = 1,
                                           tipo_atualizacao = 1,
                                           cnpj = 14,
                                           identificador_matriz_filial = 1,
                                           razao_social = 150,
                                           nome_fantasia = 55,
                                           situacao_cadastral = 2,
                                           data_situacao_cadastral = 8,
                                           motivo_situacao_cadastral = 2,
                                           nm_cidade_exterior = 55,
                                           cod_pais = 3,
                                           nm_pais = 70,
                                           codigo_natureza_juridica = 4,
                                           data_inicio_atividade = 8,
                                           cnae_fiscal = 7,
                                           descricao_tipo_logradouro = 20,
                                           logradouro = 60,
                                           numero = 6,
                                           complemento = 156,
                                           bairro = 50,
                                           cep = 8,
                                           uf = 2,
                                           codigo_municipio = 4,
                                           municipio = 50,
                                           ddd_telefone_1 = 12,
                                           ddd_telefone_2 = 12,
                                           ddd_fax = 12,
                                           correio_eletronico = 115,
                                           qualificacao_responsavel = 2,
                                           capital_social_empresa = 14,
                                           porte_empresa = 2,
                                           opcao_pelo_simples = 1,
                                           data_opcao_pelo_simples = 8,
                                           data_exclusao_simples = 8,
                                           opcao_pelo_mei = 1,
                                           situacao_especial = 23,
                                           data_situacao_especial = 8,
                                           filler = 243,
                                           fim_registro = 1
                                           ) %>%
                dplyr::mutate(end = end - 1) %>%
                # Diminuir 'end - 1' foi necessário para restruturar a posição dos delimitadores,
                # já que, durante o tratamento dos dados, filtraremos primeiro o 'tipo_de_registro',
                # que está na primeira (1) posição da linha, para só então aplicar
                # o conjunto de delimitadores fixos para separar as colunas.
                # Devido a essa estratégia para otimizar o processamento dos dados,
                # foi necessário restruturar a posição dos delimitadores.
                tibble::column_to_rownames(var = "col_names")


        col_position_socio <- readr::fwf_cols(tipo_de_registro = 1,
                                              indicador = 1,
                                              tipo_atualizacao = 1,
                                              cnpj = 14,
                                              identificador_socio = 1,
                                              nome_socio = 150,
                                              cnpj_cpf_socio = 14,
                                              cod_qualificacao_socio = 2,
                                              percentual_capital_socio = 5,
                                              data_entrada_sociedade = 8,
                                              cod_pais = 3,
                                              nome_pais_socio = 70,
                                              cpf_representante_legal = 11,
                                              nome_representante = 60,
                                              cod_qualificacao_representante_legal = 2,
                                              fillter = 855,
                                              fim_registro = 1
                                              ) %>%
                dplyr::mutate(end = end - 1) %>%
                # Diminuir 'end - 1' foi necessário para restruturar a posição dos delimitadores,
                # já que, durante o tratamento dos dados, filtraremos primeiro o 'tipo_de_registro',
                # que está na primeira (1) posição da linha, para só então aplicar
                # o conjunto de delimitadores fixos para separar as colunas.
                # Devido a essa estratégia para otimizar o processamento dos dados,
                # foi necessário restruturar a posição dos delimitadores.
                tibble::column_to_rownames(var = "col_names")


        col_position_cnae <- readr::fwf_cols(tipo_de_registro = 1,
                                             indicador = 1,
                                             tipo_atualizacao = 1,
                                             cnpj = 14,
                                             cnae_secundario = 693,
                                             filler = 489,
                                             fim_registro = 1
                                             ) %>%
                dplyr::mutate(end = end - 1) %>%
                # Diminuir 'end - 1' foi necessário para restruturar a posição dos delimitadores,
                # já que, durante o tratamento dos dados, filtraremos primeiro o 'tipo_de_registro',
                # que está na primeira (1) posição da linha, para só então aplicar
                # o conjunto de delimitadores fixos para separar as colunas.
                # Devido a essa estratégia para otimizar o processamento dos dados,
                # foi necessário restruturar a posição dos delimitadores.
                tibble::column_to_rownames(var = "col_names")

# ------------------------------------------------------------------------------------------------

# Início do tratamento dos dados

        # Criar uma coluna 'tipo_de_registro' para utilizar como filtro na identificação
        # das linhas com id 1, 2, ou 6. Cada id requer uma abordagem diferente
        # na definição do delimitador fixo ou no tratamento dos dados

        df_qsa <- tibble::tibble(df_qsa_col = x) %>%
                  tidyr::separate(df_qsa_col,
                                  into = c("tipo_de_registro", "df_qsa_col"),
                                  sep = c(1)
                                  )

# ------------------------------------------------------------------------------------------------

# Filtrar e tratar as linhas com id "1" que contêm os dados cadastrais das PJs

        df_qsa_1 <- df_qsa %>%
                dplyr::filter(tipo_de_registro == 1) %>%
                tidyr::separate(df_qsa_col, into = c(
                                                "indicador",
                                                "tipo_atualizacao",
                                                "cnpj",
                                                "identificador_matriz_filial",
                                                "razao_social",
                                                "nome_fantasia",
                                                "situacao_cadastral",
                                                "data_situacao_cadastral",
                                                "motivo_situacao_cadastral",
                                                "nm_cidade_exterior",
                                                "cod_pais",
                                                "nm_pais",
                                                "codigo_natureza_juridica",
                                                "data_inicio_atividade",
                                                "cnae_fiscal",
                                                "descricao_tipo_logradouro",
                                                "logradouro",
                                                "numero",
                                                "complemento",
                                                "bairro",
                                                "cep",
                                                "uf",
                                                "codigo_municipio",
                                                "municipio",
                                                "ddd_telefone_1",
                                                "ddd_telefone_2",
                                                "ddd_fax",
                                                "correio_eletronico",
                                                "qualificacao_responsavel",
                                                "capital_social_empresa",
                                                "porte_empresa",
                                                "opcao_pelo_simples",
                                                "data_opcao_pelo_simples",
                                                "data_exclusao_simples",
                                                "opcao_pelo_mei",
                                                "situacao_especial",
                                                "data_situacao_especial",
                                                "filler",
                                                "fim_registro"),
                                sep = c(col_position_pj["indicador", 2],
                                        col_position_pj["tipo_atualizacao", 2],
                                        col_position_pj["cnpj", 2],
                                        col_position_pj["identificador_matriz_filial", 2],
                                        col_position_pj["razao_social", 2],
                                        col_position_pj["nome_fantasia", 2],
                                        col_position_pj["situacao_cadastral", 2],
                                        col_position_pj["data_situacao_cadastral", 2],
                                        col_position_pj["motivo_situacao_cadastral", 2],
                                        col_position_pj["nm_cidade_exterior", 2],
                                        col_position_pj["cod_pais", 2],
                                        col_position_pj["nm_pais", 2],
                                        col_position_pj["codigo_natureza_juridica", 2],
                                        col_position_pj["data_inicio_atividade", 2],
                                        col_position_pj["cnae_fiscal", 2],
                                        col_position_pj["descricao_tipo_logradouro", 2],
                                        col_position_pj["logradouro", 2],
                                        col_position_pj["numero", 2],
                                        col_position_pj["complemento", 2],
                                        col_position_pj["bairro", 2],
                                        col_position_pj["cep", 2],
                                        col_position_pj["uf", 2],
                                        col_position_pj["codigo_municipio", 2],
                                        col_position_pj["municipio", 2],
                                        col_position_pj["ddd_telefone_1", 2],
                                        col_position_pj["ddd_telefone_2", 2],
                                        col_position_pj["ddd_fax", 2],
                                        col_position_pj["correio_eletronico", 2],
                                        col_position_pj["qualificacao_responsavel", 2],
                                        col_position_pj["capital_social_empresa", 2],
                                        col_position_pj["porte_empresa", 2],
                                        col_position_pj["opcao_pelo_simples", 2],
                                        col_position_pj["data_opcao_pelo_simples", 2],
                                        col_position_pj["data_exclusao_simples", 2],
                                        col_position_pj["opcao_pelo_mei", 2],
                                        col_position_pj["situacao_especial", 2],
                                        col_position_pj["data_situacao_especial", 2],
                                        col_position_pj["filler", 2],
                                        col_position_pj["fim_registro", 2]
                                        )
                                        ) %>%
                dplyr::mutate_all(~stringr::str_trim(.)) %>%
                # dplyr::mutate_all(~trimws(.))
                dplyr::mutate(descricao_tipo_logradouro = gsub("[Ç]", "C", descricao_tipo_logradouro)) %>%
                dplyr::mutate(correio_eletronico = gsub("[']", "@", correio_eletronico)) %>%
                dplyr::mutate_at(c("data_situacao_cadastral", "data_inicio_atividade",
                                   "data_opcao_pelo_simples", "data_exclusao_simples",
                                   "data_situacao_especial"),
                                 ~as.character(lubridate::ymd(., quiet = TRUE))
                                 ) %>%
                dplyr::mutate(capital_social_empresa = readr::parse_number(capital_social_empresa)/100) %>%
                tibble::as_tibble()





# Filtrar e tratar as linhas com id "2" que contêm os dados cadastrais dos Sócios das PJs

        df_qsa_2 <- df_qsa %>%
                dplyr::filter(tipo_de_registro == 2) %>%
                tidyr::separate(df_qsa_col, into = c(
                                                "indicador",
                                                "tipo_atualizacao",
                                                "cnpj",
                                                "identificador_socio",
                                                "nome_socio",
                                                "cnpj_cpf_socio",
                                                "cod_qualificacao_socio",
                                                "percentual_capital_socio",
                                                "data_entrada_sociedade",
                                                "cod_pais",
                                                "nome_pais_socio",
                                                "cpf_representante_legal",
                                                "nome_representante",
                                                "cod_qualificacao_representante_legal",
                                                "fillter",
                                                "fim_registro"
                                                ),
                                sep = c(
                                        col_position_socio["indicador", 2],
                                        col_position_socio["tipo_atualizacao", 2],
                                        col_position_socio["cnpj", 2],
                                        col_position_socio["identificador_socio", 2],
                                        col_position_socio["nome_socio", 2],
                                        col_position_socio["cnpj_cpf_socio", 2],
                                        col_position_socio["cod_qualificacao_socio", 2],
                                        col_position_socio["percentual_capital_socio", 2],
                                        col_position_socio["data_entrada_sociedade", 2],
                                        col_position_socio["cod_pais", 2],
                                        col_position_socio["nome_pais_socio", 2],
                                        col_position_socio["cpf_representante_legal", 2],
                                        col_position_socio["nome_representante", 2],
                                        col_position_socio["cod_qualificacao_representante_legal", 2],
                                        col_position_socio["fillter", 2]
                                        )
                                        ) %>%
                dplyr::mutate_all(~stringr::str_trim(.)) %>%
                # dplyr::mutate_all(~trimws(.))
                dplyr::mutate(cnpj_cpf_socio = gsub("[000***]{6}", "***", cnpj_cpf_socio)) %>%
                dplyr::mutate(data_entrada_sociedade = as.character(lubridate::ymd(data_entrada_sociedade, quiet = TRUE)))


# Filtrar e tratar as linhas com id "6" que contêm os CNAE secundários das PJs



        df_qsa_6_sep <- df_qsa %>%
                    dplyr::filter(tipo_de_registro == 6) %>%
                    tidyr::separate(df_qsa_col, into = c(
                                                    "indicador",
                                                    "tipo_atualizacao",
                                                    "cnpj",
                                                    "cnae_secundario",
                                                    "filler",
                                                    "fim_registro"
                                                    ),
                                    sep = c(
                                            col_position_cnae["indicador", 2],
                                            col_position_cnae["tipo_atualizacao", 2],
                                            col_position_cnae["cnpj", 2],
                                            col_position_cnae["cnae_secundario", 2],
                                            col_position_cnae["filler", 2]
                                            )
                                            ) %>%
                    tibble::as_tibble()


    # if incluído para contornar um bug na função tidyr::unnest após ser aplicada a função dplyr::mutate,
    # que retornou uma lista vazia. O bug já foi reportado no github do repositório tidyr,
    if (nrow(df_qsa_6_sep) != 0) {

        df_qsa_6 <- df_qsa_6_sep %>%
                    dplyr::mutate_all(~stringr::str_trim(.)) %>%
                    # dplyr::mutate_all(~trimws(.))
                    dplyr::mutate(cnae_secundario = stringr::str_extract_all(cnae_secundario, pattern = "\\d{7}")) %>%
                    tidyr::unnest(cnae_secundario) %>%
                    dplyr::filter(!cnae_secundario %in% c("0000000", "")) %>%
                    dplyr::select(indicador,
                                  tipo_atualizacao,
                                  cnpj,
                                  cnae_secundario,
                                  filler) %>%
                    tibble::as_tibble()
    }



# ------------------------------------------------------------------------------------------------

# Rotina para filtrar CNPJs definidos pelo usuário

        if(localizar_cnpj != "NAO") {

                df_qsa_1 <- dplyr::filter(df_qsa_1, cnpj %in% localizar_cnpj)

                df_qsa_2 <- dplyr::filter(df_qsa_2, cnpj %in% localizar_cnpj)

                df_qsa_6 <- dplyr::filter(df_qsa_6, cnpj %in% localizar_cnpj)


                # Falta testar se o filtro com uma coluna numérica é mais rápido
                # df_qsa_1 <- df_qsa_1 %>%
                #         as.numeric(df_qsa_1$cnpj) %>%
                #         dplyr::filter(cnpj %in% localizar_cnpj)
                #
                # df_qsa_2 <- df_qsa_2 %>%
                #         as.numeric(df_qsa_2$cnpj) %>%
                #         dplyr::filter(cnpj %in% localizar_cnpj)
                #
                # df_qsa_6 <- df_qsa_6 %>%
                #         as.numeric(df_qsa_6$cnpj) %>%
                #         dplyr::filter(cnpj %in% localizar_cnpj)

        }

# ------------------------------------------------------------------------------------------------

# Armazenar o resultado

        if(armazenar == "csv") {

            if (file.exists(file.path("bd_cnpj_tratados", "cnpj_dados_cadastrais_pj.csv"))) {

                append_parametro = TRUE

            } else {

                append_parametro = FALSE
            }

                readr::write_delim(df_qsa_1,
                                   file.path("bd_cnpj_tratados", "cnpj_dados_cadastrais_pj.csv"),
                                   delim = "#",
                                   append = append_parametro
                                   )

                readr::write_delim(df_qsa_2,
                                   file.path("bd_cnpj_tratados", "cnpj_dados_socios_pj.csv"),
                                   delim = "#",
                                   append = append_parametro
                                   )

                if (nrow(df_qsa_6_sep) != 0) {

                    readr::write_delim(df_qsa_6,
                                       file.path("bd_cnpj_tratados", "cnpj_dados_cnae_secundario.csv"),
                                       delim = "#",
                                       append = append_parametro
                                       )
                }
        }

        if(armazenar %in% c("sqlite", "sqlserver", "oracle", "mysql")) {


                conn <- qsacnpj::connect_sgbd(armazenar)


                DBI::dbWriteTable(conn,
                                  "cnpj_dados_cadastrais_pj",
                                  df_qsa_1,
                                  append = TRUE
                                  )

                DBI::dbWriteTable(conn,
                                  "cnpj_dados_socios_pj",
                                  df_qsa_2,
                                  append = TRUE
                                  )

                if (nrow(df_qsa_6_sep) != 0) {

                    DBI::dbWriteTable(conn,
                                      "cnpj_dados_cnae_secundario_pj",
                                      df_qsa_6,
                                      append = TRUE
                                      )
                }


                DBI::dbDisconnect(conn)

        }


        # rm(list = ls())

    }
}

#######################################################################################################

