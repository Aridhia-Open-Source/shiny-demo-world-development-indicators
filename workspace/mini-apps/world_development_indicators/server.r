health_data_wide <- xap.read_table("health_indicators")

shinyServer(function(input, output, session) {
   
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    
    dataset_wide <- health_data_wide
    names(dataset_wide)[names(dataset_wide) == paste0(input$xcol)] <- "xcol"
    names(dataset_wide)[names(dataset_wide) == paste0(input$ycol)] <- "ycol"
    dataset_wide[, c("country_name", "region", "incomegroup", "year", "xcol", "ycol", "population")]
  })
  
  output$test_plot <- renderGvis({
    gvisMotionChart(selectedData(), idvar = "country_name", timevar = "year", xvar = "xcol",
                    yvar = "ycol", colorvar = "region", sizevar = "population",
                    options = list(width = "1200px", height = "800px"))
  })
})