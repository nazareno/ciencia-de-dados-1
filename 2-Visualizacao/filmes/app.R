library(streamgraph)
library(dplyr)
library(shiny)
library(ggplot2)

ui = shinyUI(fluidPage(
  h3("streamgraph example", style="text-align:center"),
  streamgraphOutput('sg1')
))

server = function(input, output) {
  
  ggplot2movies::movies %>%
    select(year, Action, Animation, Comedy, Drama, Documentary, Romance, Short) %>%
    tidyr::gather(genre, value, -year) %>%
    group_by(year, genre) %>%
    tally(wt=value) %>%
    ungroup %>%
    streamgraph("genre", "n", "year") %>%
    sg_axis_x(20) %>%
    sg_fill_brewer("PuOr") %>%
    sg_legend(show=TRUE, label="Genres: ") -> sg
  
  output$sg1 <- renderStreamgraph(sg)
  
}

shinyApp(ui = ui, server = server)