#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(maps)
library(mapdata)

us_states <- map_data("state")

states_choices <- c("")

states_choices <- c(states_choices, unique(us_states$region))

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("States in the U.S."),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      "Please select the name of the state you want to discover:",
       selectInput("state_selection", "", states_choices, 
                   selected = NULL, multiple = FALSE),
      h4("Documentation"),
      "This app will allow users to discover the locations of 
      difference states in the U.S. Select the desired state from
      the drop-down list to highlight the location on the map."
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h4("United States Map"),
       plotOutput("mapPlot")
    )
  )
))
