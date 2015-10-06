source("helpers.R")
library(maps)
library(mapproj)
library(shiny)

shinyUI(
  fluidPage(
    titlePanel("Interactive CO2 Emission World Map"),
    
    sidebarLayout(
      sidebarPanel(
        sliderInput("year",
                    label=h4("Year"),
                    min=1996, max=2011, value=2011),
        br(),
        sliderInput("range",
                    label=h4("Ranges of CO2 Emission"),
                    min=0, max=70, value=c(0,70))
      ),
      mainPanel(
        textOutput("description"),
        plotOutput("map")
      )
    )
    
  )
)