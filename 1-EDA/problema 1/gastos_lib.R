ler_gastos <- function(arquivo = "../dados/ano-atual.csv"){
  require("readr")
  require("dplyr", warn.conflicts = FALSE)
  
  gastos = read_csv(arquivo, 
                    col_types = list(
                    ))
  gastos = gastos %>% 
    mutate_each(funs(as.factor), sgPartido, sgUF, txNomeParlamentar, indTipoDocumento)
  return(gastos)
} 