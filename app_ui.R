#Loading libraries and dataset 
library(plotly)
library(ggplot2)
library(shiny)
library(dplyr)

data_set <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

sidepanel <- sidebarPanel(
  country_input <- selectInput(
    "country",
    label = "Country",
    choices = list(
      "Worldwide" = "World",
      "United States" = "United States",
      "United Kingdom" = "United Kingdom",
      "China" = "China",
      "India" = "India",
      "Brazil" = "Brazil",
      "South Africa" = "South Africa",
      "Germany" = "Germany",
      "Spain" = "Spain",
      "France" = "France",
      "Canada" = "Canada",
      "Australia" = "Australia",
      "Sweden" = "Sweden"
    ),
    selected = "World"
  ),
  year_input <- selectInput(
    "co2_type",
    label = "CO2 Emmision Type",
    choices = list(
      "Total Annual CO2 (million tonnes)" = "co2",
      "Cumulative CO2 (million tonnes)" = "cumulative_co2",
      "CO2 per capita (tonnes per person)" = "co2_per_capita",
      "CO2 per GDP (kilograms per dollar of GDP)" = "co2_per_gdp",
      "CO2 per Unit Energy (kilograms per kilowatt-hour)" = "co2_per_unit_energy"
    ),
    selected = "co2"
  )
)

maincontent <- mainPanel(
  plotlyOutput("plot"),
  tags$p("The purpose of this chart is to see the trends in the type of CO2 emmision and related data that a variety of countries exhibit")
)

page1 <- tabPanel(
  "Visulized Graph",
  titlePanel("Widget Settings"),
  sidebarLayout(
    sidepanel, maincontent
  )
)
intro <- tabPanel(
  "Home",
  titlePanel("Home Page"),
  mainPanel(
    tags$h3("Introduction"),
    tags$p("Hello! My name is Naomi Nguyen and the features I decided to analyze in the CO2 and Greenhouse Gas Emissions dataset was how a variety countries fared in their specific uses of CO2 emissions. This was done by having a widget that allows you to choose a specific type of CO2 emission to visualize with your country of interest!"),
    tags$h3("Dataset Summary"),
    tags$p("The dataset I will be using is called, “CO₂ and Greenhouse Gas Emissions”. The authors that collected this data are Hannah Ritchie, Max Roser, and Pablo Rosado. The data they use is collected from The Global Carbon Project which is an expansive collection of data that spans more than 270 years of global data on annual CO2 emissions. The authors of The Global Carbon Projects are Robbie Andrews and Glen Peters, they are the people who provide the long term data from 1750 and onwards; this is the dataset that the CO₂ and Greenhouse Gas Emissions relies on. The primary reason for the construction of this dataset is to be able to track the global greenhouse emissions of a variety of countries. The reason why this is important is to be able to see if there has been progress in lowering the CO2 emissions, additionally, to also allow us to see in more finer detail in what specifically effects the emission rates. Some possible limitations of this dataset is that there are a lot of data slots that are not collected in specific countries. This makes it difficult to have a complete picture of the impact that certain countries have on the emission rates. "),
    tags$h3("Data"),
    tags$h4("Which geographic area has produced the most amount of CO2 to date?"),
    tags$p("World"),
    tags$h4("Which geographic area has produced the least amount of CO2 to date?"),
    tags$p("Antarctica"),
    tags$h4("Which year did the United State of America produce the least amount of CO2 in the 20th century?"),
    tags$p("2001"),
    tags$h4("Which year did the United State of America produce the most amount of CO2 in the 20th century?"),
    tags$p("2005"),
    tags$h4("Which geographic location has produced the least amount of CO2 emissions in the 20th century?"),
    tags$p("Antarctica"),
    tags$h3("Conclusions"),
    tags$p("After analysing the data, there are a couple of conclusions that I've came to based on filtering through the data and based on the interactive visulization graph made. Since the 1950s, the CO2 emmision rate has increased in most non-europian countries. However, it seems that the EU's new policies on CO2 emmisions have seem to make a large positive impact on these rates.")
  )
)


ui <- navbarPage(
  "CO2 Emmision Catagory in Various Countries ", 
  intro,
  page1
)


