#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)
# devtools::install_github("hrbrmstr/streamgraph")
library(streamgraph)
library(readr)

message("ler entradas")
entradas = read_csv("../../dados/ccc-entradas-por-genero.csv") %>% 
  group_by(ano, GENERO) %>% 
  summarise(total = sum(entrada)) %>% 
  ungroup()

message("ler saídas")
saidas = read_csv("../../dados/ccc-saidas-por-genero.csv") %>% 
  group_by(ano, GENERO) %>% 
  summarise(saida.total = sum(saida)) %>% 
  ungroup() 

message("cruzando")
alunos = entradas %>% 
  mutate(no.curso = cumsum(total)) %>% 
  full_join(saidas) %>% 
  mutate(saida.total = ifelse(is.na(saida.total), 0, saida.total)) %>% 
  mutate(no.curso = no.curso - saida.total) %>% 
  filter(complete.cases(.))


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$plot <- renderStreamgraph({
    ano_inicial = input$anos[1]
    ano_final = input$anos[2]
    
    entradas %>%
      filter(ano >= ano_inicial, ano <= ano_final) %>%
      streamgraph("GENERO", "total", "ano") %>%
      sg_axis_x(10) %>%
      sg_fill_brewer("PuOr") %>%
      sg_legend(show=TRUE, label="gênero: ")
  })
})
