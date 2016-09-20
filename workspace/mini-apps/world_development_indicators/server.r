health_data_wide <- xap.read_table("health_indicators")

shinyServer(function(input, output, session) {
   
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    
    dataset_wide <- health_data_wide
    names(dataset_wide)[names(dataset_wide) == paste0(input$xcol)] <- "xcol"
    names(dataset_wide)[names(dataset_wide) == paste0(input$ycol)] <- "ycol"
    dataset_wide[, c("country_name", "region", "incomegroup", "year", "xcol", "ycol", "population")]
  })
  

  observe({
    
    messageList = list(Idvar = selectedData()$country_name, 
                       Timevar = selectedData()$year,
                       Xvar = selectedData()$xcol, #"SP.DYN.LE00.IN", 
                       Yvar = selectedData()$ycol, # "SP.DYN.TFRT.IN", 
                       Colorvar = selectedData()$region,
                       #Sizevar = rnorm(nrow(selectedData()), 0, 1))
                       Sizevar = selectedData()$population)
    
    session$sendCustomMessage(type = "myCallbackHandler", message = messageList)
  })
  
})