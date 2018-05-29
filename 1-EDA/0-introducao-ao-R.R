library(tidyverse) # carrega os pacotes ggplot2, readr, tidyr e dplyr
# no linux pode ser que você precise instalar a libcurl4-openssl-dev

# use sempre read_csv em vez de read.csv
vendas = read_csv(file = "../dados/vendas_artistas_br.csv")
# sempre dê uma olhada no que você leu
glimpse(vendas)

# visualizar!
ggplot(vendas, aes(x = Artista, # Artista é o nome de uma variável dentro de vendas
                   y = `Vendas estimadas (milhões)`, # Crase serve de escape para símbolos e espaços
                   size = `Vendas estimadas (milhões)`)) + 
  geom_point(color = "darkorange") +
  coord_flip() # Troca o x por y depois de plotar
# documentação do ggplot2: http://ggplot2.tidyverse.org/index.html


# 5 verbos principais para transformar vindos do dplyr
# select  - escolhe variáveis (colunas)
# filtrar - escolhe observações (linhas)
# mutate - cria/altera variáveis
# summarise - calcula algo (média, max, min, ...) a partir de várias linhas
# group_by - tal qual o do SQL
# arrange é um sexto verbo que pode ser útil. ordena linhas.

vendas_com_mpb = vendas %>% 
  filter(`Vendas estimadas (milhões)` < 100, # filter faz um AND nas condições
         `Vendas estimadas (milhões)` > 20) %>% 
  mutate(eh_mpb = grepl("MPB", `Gênero(s)`))  # grepl retorna TRUE para as linhas do segundo argumento que contém o 1o

glimpse(vendas_com_mpb)

ggplot(vendas_com_mpb, aes(x = eh_mpb, 
                           y = `Vendas estimadas (milhões)`)) + 
  geom_point(color = "darkorange")

