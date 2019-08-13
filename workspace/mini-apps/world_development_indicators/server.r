
shinyServer(function(input, output, session) {
   
  # Data selected for the motion chart
  selectedData <- reactive({
    health_data_wide
  })
  
  output$gvis_out <- renderGvis({
    gvisMotionChart(selectedData(), 
                    idvar = "country_name", timevar = "year", 
                    xvar = start_x, yvar = start_y,
                    colorvar = "region", sizevar = "population",
                    options = list(width = "1000px", height = "800px"))
  })
})