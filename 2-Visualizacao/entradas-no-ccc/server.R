#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse, warn.conflicts = F)
library(here)
theme_set(theme_bw())

entradas = read_csv(here("../dados/ccc-entradas-por-genero.csv"))

shinyServer(function(input, output) {
  output$plotTempo = renderPlot({
    entradas %>%
      filter(ano >= input$anos[1], ano <= input$anos[2]) %>%
      ggplot(aes(x = PERIODO_INGRESSO, 
                 y = entrada, 
                 fill = GENERO)) +
      geom_area()
  })
})
