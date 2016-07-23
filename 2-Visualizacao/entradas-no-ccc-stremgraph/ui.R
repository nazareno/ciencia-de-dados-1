#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(streamgraph)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Entradas 2.0"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("anos",
                   "Período",
                   min = 1970,
                   max = 2015,
                   value = c(1979, 2015))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      streamgraphOutput("plot")
    )
  )
))
