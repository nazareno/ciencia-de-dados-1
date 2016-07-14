ler_gastos <- function(arquivo = "../dados/ano-atual.csv"){
  #' Lê um csv criado a partir dos dados de gastos dos deputados da 
  #' Câmara e seta os tipos de colunas mais convenientemente. 
  require("readr")
  require("lubridate")
  require("dplyr", warn.conflicts = FALSE)
  
  gastos = read_csv(arquivo)
  gastos = gastos %>% 
    mutate_each(funs(as.factor), sgPartido, sgUF, txNomeParlamentar, indTipoDocumento, txtDescricao) %>% 
    mutate(datEmissao = ymd(substr(datEmissao, 1, 10)))
  
  return(gastos)
} 

ler_gastos2 <- function(arquivo = "../dados/ano-atual.csv"){
  #' Lê um csv criado a partir dos dados de gastos dos deputados da 
  #' Câmara e seta os tipos de colunas mais convenientemente. 
  #' Versão sem readr, para máquinas onde não é possível instalar esse pacote. 
  #' É um pouco mais lenta que a com readr.
  require("dplyr", warn.conflicts = FALSE)
  require("lubridate")
  
  gastos = read.csv(arquivo, stringsAsFactors = FALSE)
  gastos = gastos %>% 
    mutate_each(funs(as.factor), sgPartido, sgUF, txNomeParlamentar, indTipoDocumento, txtDescricao)
  gastos$datEmissao = ymd(substr(gastos$datEmissao, 1, 10))
  return(gastos)
} 
