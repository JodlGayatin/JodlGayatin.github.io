Shiny App : Euro Trip Planner
========================================================
author: Olson Jodl Ignacio V. Gayatin
date: October 14, 2016
autosize: true

Background
========================================================

This Shiny app is built to help users who plan to embark on a backpacking trip to Europe

- With a handful of European cities to choose from, it can lead to options paralysis to the would-be traveler/user. This app will hopefully provide an initial itinerary to the user.
- The user is asked to select a preferred theme of the travel and the number of cities he plans to visit.
- The app will return a suggested itinerary with markers on the map c/o the leaflet package.
- The app will also compute for the estimated expense and the suggested duration of the travel.

Logic
========================================================

The output data is derived through a lookup in a stored data table

- The app will look up the cities based on the input data (theme and number of cities)
- The cities will be plotted on the map based on the stored data on latitude and longitude
- The estimated cost will be computed based on 1) Reference data for Madrid from [Savvybackpacker](http://thesavvybackpacker.com/daily-costs-visit-madrid/), 2) cost of living comparison from [Numbeo.com](https://www.numbeo.com/cost-of-living/), 3) estimated duration and travel cost based on the backpacking experience of the app creator.

Sample Code
========================================================
Here are sample codes used for plotting the map


```r
cities1 <- read.csv("data/europecities.csv")
output$mymap <- renderLeaflet({
    recommended1<-switch(input$var1,"Popular areas"=filter(cities1,area=='Popular'))
    recommended2<-switch(input$var2,"At most five"=filter(recommended1, cities <= 1)
    leaflet() %>% addProviderTiles("Stamen.TonerLite",options = providerTileOptions(noWrap = TRUE)) %>% addMarkers(data=recommended2,popup=recommended2$name)})
```


App
========================================================

Here is the actual app as seen on the web. (Please scroll down to see the map.)

<iframe src="https://jodlgayatin.shinyapps.io/EuropeApp2/" style="border: none; width: 900px; height: 400px"></iframe>

