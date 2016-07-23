#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Entradas no CCC ao longo do tempo"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        "anos",
        "Filtrar período",
        min = 1970,
        max = 2016,
        value = c(1979, 2016)
      )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput(outputId = "plotTempo")
    )
  )
))
