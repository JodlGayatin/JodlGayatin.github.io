library(shiny)
library(leaflet)
library(dplyr)

shinyServer(function(input, output){
  
cities1 <- read.csv("data/europecities.csv")
  
  output$mymap <- renderLeaflet({
    
   recommended1<-switch(input$var1,"Popular areas"=filter(cities1,area=='Popular'), 
                        "Beautiful churches"=filter(cities1,area=='Church'), 
                        "Western region"=filter(cities1,area=='Western'),
                        "James Bond locations"= filter(cities1,area=='James'),
                        "Country hopper"= filter(cities1,area=='Hopper'),
                        "Limited time"= filter(cities1,area=='Short'),
                        "Northern region"=filter(cities1,area=='Northern'))
    recommended2<-switch(input$var2,"At most five"=filter(recommended1, cities <= 1), 
                         "Five to ten"=filter(recommended1, cities <=2), 
                        "Ten or more"=filter(recommended1, cities<=3))
    leaflet() %>%
      addProviderTiles("Stamen.TonerLite",
                       options = providerTileOptions(noWrap = TRUE)
      ) %>%
      addMarkers(data=recommended2,popup=recommended2$name)
    })
  output$cost<-renderText({
   recommended1<-switch(input$var1,"Popular areas"=filter(cities1,area=='Popular'), 
                         "Beautiful churches"=filter(cities1,area=='Church'), 
                         "Western region"=filter(cities1,area=='Western'),
                         "James Bond locations"= filter(cities1,area=="James"),
                        "Country hopper"= filter(cities1,area=='Hopper'),
                        "Limited time"= filter(cities1,area=='Short'),  
                         "Northern region"=filter(cities1,area=="Northern"))
    recommended2<-switch(input$var2,"At most five"=filter(recommended1, cities <= 1), 
                         "Five to ten"=filter(recommended1, cities <=2), 
                         "Ten or more"=filter(recommended1, cities<=3))
    b<-sum(recommended2$duration)
    a<-sum(recommended2$daycost)+sum(recommended2$travelcost)
    paste("<font color=\"#0000FF\"><b>","The estimated amount for this itinerary is",
          "<font color=\"#FF0000\"><b>",a, "euros. ",
          "<font color=\"#0000FF\"><b>","The estimated duration is",
          "<font color=\"#FF0000\"><b>",b," days. ",
          "<font color=\"#000000\"><b>","Click on the marker to get the name of the city.") 
                                })
  }
  )