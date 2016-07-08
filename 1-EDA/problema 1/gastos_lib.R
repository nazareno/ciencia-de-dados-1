ler_gastos <- function(arquivo = "../dados/ano-atual.csv"){
  #' Lê um csv criado a partir dos dados de gastos dos deputados da 
  #' Câmara e seta os tipos de colunas mais convenientemente. 
  require("readr")
  require("dplyr", warn.conflicts = FALSE)
  
  gastos = read_csv(arquivo, 
                    col_types = list(
                      datEmissao = col_datetime()
                    ))
  gastos = gastos %>% 
    mutate_each(funs(as.factor), sgPartido, sgUF, txNomeParlamentar, indTipoDocumento)
  return(gastos)
} 