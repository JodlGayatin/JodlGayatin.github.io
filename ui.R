library(shiny)
library(leaflet)

ui <- fluidPage(
  titlePanel("Euro Trip Planner"),
  helpText("This app will suggest cities in your European backpacking itinerary.
           Select the theme of your travel and the number of cities you would like to visit. 
           The map will respond accordingly."),
  helpText ("The estimated cost provided does not include airfare from your home location to Europe.
            Only the estimated daily cost for hostel stay, food, and travel across cities are included.
            Prices were computed using the Madrid data from www.thesavvybackpacker.com.
            Prices of other cities were calculated using price comparison in numbeo.com.
            Medical insurance is not included in the cost."),
  selectInput("var1", label = "Choose the theme of your travel :",
      choices = list("Popular areas","Northern region", "Western region", 
                     "James Bond locations","Beautiful churches","Country hopper",
                     "Limited time"),
      selected = "Popular areas"),
  selectInput("var2", label = "How many cities do you plan to visit?",
              choices = list("At most five", "Five to ten", "Ten or more"),
              selected = "At most five"),
  htmlOutput("cost"),
  p(),
  leafletOutput("mymap"),
  p()
)