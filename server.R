##################
##### SERVER #####
##################



server <- function(input, output, session) {
   
  # Data selected for the motion chart
  selectedData <- reactive({
    health_data_wide
  })
  
  # Plot output
  output$plot <- renderPlotly({
    gg <- ggplot(selectedData(),
                 aes(incomegroup, life_expectancy, color = region)) +
      geom_point(aes(size = population, frame = year, ids = country_name)) +
      xlab("Income Group") +
      ylab("Life Expectancy")
    
    ggplotly(gg)
    
  })
  }

  