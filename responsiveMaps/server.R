source("helpers.R")
# library(maps)
# library(mapproj)
library(shiny)

shinyServer(function(input, output){
  output$description <- renderText({
    paste("You're looking at ", input$year)
  })
  output$map <- renderPlot({
    data <- switch(input$year,
                   "X1996" = carbonEmissionDF$X1996,
                   "X1997" = carbonEmissionDF$X1997,
                   "X1998" = carbonEmissionDF$X1998,
                   "X1999" = carbonEmissionDF$X1999,
                   "X2000" = carbonEmissionDF$X2000,
                   "X2001" = carbonEmissionDF$X2001,
                   "X2002" = carbonEmissionDF$X2002,
                   "X2003" = carbonEmissionDF$X2003,
                   "X2004" = carbonEmissionDF$X2004,
                   "X2005" = carbonEmissionDF$X2005,
                   "X2006" = carbonEmissionDF$X2006,
                   "X2007" = carbonEmissionDF$X2007,
                   "X2008" = carbonEmissionDF$X2008,
                   "X2009" = carbonEmissionDF$X2009,
                   "X2010" = carbonEmissionDF$X2010,
                   "X2011" = carbonEmissionDF$X2011
                   )

    emission_map(var = data, legend.title = input$year, min = input$range[1], max = input$range[2])
  })
})
