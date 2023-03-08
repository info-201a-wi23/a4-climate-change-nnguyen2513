#Loading libraries and dataset 
library(plotly)
library(ggplot2)
library(shiny)
library(dplyr)

data_set <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")
data_set <- filter(data_set, year > 1950) 

server <- function(input, output) {
  output$plot <- renderPlotly({
    select_data <- filter(data_set, country == input$country)
    req(input$co2_type)
    scatterplot <- plot_ly(select_data, x = ~year, y = ~get(input$co2_type), 
                           type="scatter", mode="lines") 
    scatterplot <- scatterplot %>% layout(
      title = "CO2 Type by Country",
      yaxis = list(title = "CO2 Emmision Type"),
      xaxis = list(title = "Year")
    )
    scatterplot
  })
  
  
}