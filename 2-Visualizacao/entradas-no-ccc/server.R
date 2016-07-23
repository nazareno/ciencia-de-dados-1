#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr, warn.conflicts = F)
library(readr)
library(ggplot2)
theme_set(theme_bw())

entradas = read_csv("../../dados/ccc-entradas-por-genero.csv")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$plotTempo = renderPlot({
    entradas %>% 
      filter(ano >= input$anos[1], ano <= input$anos[2]) %>% 
      ggplot(aes(PERIODO_INGRESSO, entrada, fill = GENERO)) + 
      geom_area()
  })
})
